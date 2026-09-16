# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Gets the OneDrive sync engine running again and brings every file of a folder onto this disk, without a single manual step.

.DESCRIPTION
Two things stop a folder from being readable, and both are fixed here.

First, OneDrive refuses to run with full administrator rights: started from an elevated shell it
exits immediately, so Start-Process reports success and nothing happens. This script detects
elevation and launches OneDrive through explorer.exe, which runs as the logged-on user and starts
its child at the same integrity level, then watches the process long enough to prove it stayed up.

Second, a file marked as cloud-only is pinned with attrib +P -U, the equivalent of "Always keep on
this device", and the script waits for the download, reporting what is left and stopping as soon as
the engine stops delivering rather than waiting out a timeout for nothing.

What decides that a file has arrived is reading its bytes, not its attributes: FILE_ATTRIBUTE_
RECALL_ON_OPEN 0x40000 is the same bit as FILE_ATTRIBUTE_EA, a process can run in a placeholder
compatibility mode that hides these bits, and a provider is not obliged to set them. The attributes
choose what to pin; the read decides what is true.

-Reset runs OneDrive.exe /reset, Microsoft's own repair, and restarts the client. It resets the
sync connection; it does not delete files and does not unlink the account. It is opt-in because it
changes the state of the machine, and a re-sync can take a while on a large account.

.EXAMPLE
pwsh -File platform/repair-onedrive.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES'

.EXAMPLE
pwsh -File platform/repair-onedrive.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -Reset
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Source,
    [int]$TimeoutMinutes = 30,
    [int]$StallMinutes = 3,
    [switch]$Reset
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if (Test-Path variable:PSNativeCommandUseErrorActionPreference) { $PSNativeCommandUseErrorActionPreference = $false }
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

# FILE_ATTRIBUTE_OFFLINE 0x1000 and FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS 0x400000. 0x40000 is left
# out on purpose: winnt.h gives that bit to FILE_ATTRIBUTE_EA as well.
$CloudMask = 0x401000

function Step([string]$Message) { Write-Host "==> $Message" -ForegroundColor Cyan }
function Note([string]$Message) { Write-Host "    $Message" }
function Warn([string]$Message) { Write-Host "  $Message" -ForegroundColor Yellow }
function Fail([string]$Message) { Write-Host "FAIL  $Message" -ForegroundColor Red; exit 1 }

function Test-Elevated {
    try {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        return ([Security.Principal.WindowsPrincipal]$identity).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    } catch { return $false }
}

function Find-OneDrive {
    $candidates = @()
    if ($env:ProgramFiles) { $candidates += (Join-Path $env:ProgramFiles 'Microsoft OneDrive\OneDrive.exe') }
    if (${env:ProgramFiles(x86)}) { $candidates += (Join-Path ${env:ProgramFiles(x86)} 'Microsoft OneDrive\OneDrive.exe') }
    if ($env:LOCALAPPDATA) { $candidates += (Join-Path $env:LOCALAPPDATA 'Microsoft\OneDrive\OneDrive.exe') }
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
    }
    return $null
}

function Get-OneDriveProcesses { return @(Get-Process -Name OneDrive -ErrorAction SilentlyContinue) }

function Start-OneDrive([string]$Executable, [bool]$Elevated, [string[]]$Arguments) {
    if ($Elevated) {
        # OneDrive exits at once when it is started with administrator rights. explorer.exe runs as
        # the logged-on user, so a process it starts comes up de-elevated.
        $line = if ($Arguments.Count -gt 0) { '"' + $Executable + '" ' + ($Arguments -join ' ') } else { '"' + $Executable + '"' }
        Start-Process -FilePath 'explorer.exe' -ArgumentList $line | Out-Null
    } elseif ($Arguments.Count -gt 0) {
        Start-Process -FilePath $Executable -ArgumentList $Arguments | Out-Null
    } else {
        Start-Process -FilePath $Executable | Out-Null
    }
}

function Wait-Running([int]$Seconds) {
    for ($i = 0; $i -lt $Seconds; $i++) {
        Start-Sleep -Seconds 1
        if (@(Get-OneDriveProcesses).Count -gt 0) { return $true }
    }
    return $false
}

function Get-CloudFiles([string]$Root) {
    return @(Get-ChildItem -LiteralPath $Root -Recurse -File -Force -ErrorAction SilentlyContinue |
        Where-Object { (([int]$_.Attributes) -band $CloudMask) -ne 0 })
}

function Test-Readable($File) {
    try {
        $stream = [System.IO.File]::Open($File.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        try {
            if ($File.Length -eq 0) { return $true }
            $buffer = [byte[]]::new(1)
            $stream.Seek([long]($File.Length - 1), [System.IO.SeekOrigin]::Begin) | Out-Null
            return ($stream.Read($buffer, 0, 1) -eq 1)
        } finally { $stream.Dispose() }
    } catch { return $false }
}

# --- the folder ------------------------------------------------------------

if (-not (Test-Path -LiteralPath $Source -PathType Container)) { Fail "folder not found: $Source" }
$Source = (Resolve-Path -LiteralPath $Source).Path.TrimEnd('\', '/')

Step "Checking $Source"
$all = @(Get-ChildItem -LiteralPath $Source -Recurse -File -Force -ErrorAction SilentlyContinue)
$pending = @(Get-CloudFiles $Source)
Note "$($all.Count) files, $($pending.Count) of them not on this device"

if ($pending.Count -eq 0) {
    Step 'Every file is already on this device; the sync engine is not needed.'
    Note 'Next:'
    Note ("       pwsh -File platform/import-ideas.ps1 -Source `"$Source`" -Name IDEES -Push")
    exit 0
}

# --- the sync engine -------------------------------------------------------

$elevated = Test-Elevated
if ($elevated) {
    Warn 'This shell has administrator rights. OneDrive refuses to run elevated, which is why'
    Warn 'Start-Process can report success while nothing starts. Launching it through explorer.exe,'
    Warn 'which starts it as the logged-on user.'
}

$executable = Find-OneDrive
if (-not $executable) {
    Fail @'
OneDrive.exe was not found in Program Files, Program Files (x86) or AppData.
The client is not installed on this machine: install it from https://www.microsoft.com/microsoft-365/onedrive/download
and run this again.
'@
}
Note "client: $executable"

if ($Reset) {
    Step 'Resetting the sync connection (OneDrive.exe /reset)'
    Note 'This resets the connection only. It deletes no file and unlinks no account.'
    foreach ($process in @(Get-OneDriveProcesses)) { $process | Stop-Process -Force -ErrorAction SilentlyContinue }
    Start-Sleep -Seconds 2
    Start-OneDrive $executable $elevated @('/reset')
    Start-Sleep -Seconds 20
}

$running = @(Get-OneDriveProcesses)
if ($running.Count -eq 0) {
    Step 'Starting OneDrive'
    Start-OneDrive $executable $elevated @()
    if (-not (Wait-Running 20)) {
        Fail @"
OneDrive did not start. Run this again with -Reset, and if it still will not come up, sign in from
the OneDrive icon in the notification area. Until the engine runs, the $($pending.Count) file(s)
that live only in the cloud cannot be fetched by any tool on this machine.
"@
    }
    # A client that refuses the launch exits within seconds; make sure it stayed up.
    Start-Sleep -Seconds 8
    if (@(Get-OneDriveProcesses).Count -eq 0) {
        Fail 'OneDrive started and exited at once. Sign in from the OneDrive icon in the notification area, then run this again.'
    }
}
Note "running: $(@(Get-OneDriveProcesses).Count) process(es)"

# --- pin and wait ----------------------------------------------------------

Step "Pinning $($pending.Count) file(s) and waiting for the download"
& attrib.exe +P -U $Source /D 2>&1 | Out-Null
& attrib.exe +P -U (Join-Path $Source '*') /S /D 2>&1 | Out-Null

$total = $pending.Count
$left = $total
$deadline = [DateTime]::UtcNow.AddMinutes($TimeoutMinutes)
$lastProgress = [DateTime]::UtcNow
while ($left -gt 0 -and [DateTime]::UtcNow -lt $deadline) {
    Start-Sleep -Seconds 5
    $still = @($pending | Where-Object {
        $item = Get-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
        if (-not $item) { return $false }
        # Attributes say what to pin; the read says what is true.
        if ((([int]$item.Attributes) -band $CloudMask) -eq 0) { return $false }
        return -not (Test-Readable $item)
    })
    if ($still.Count -lt $left) { $lastProgress = [DateTime]::UtcNow }
    $left = $still.Count
    $pending = $still
    Write-Progress -Activity 'Downloading from OneDrive' -Status "$left of $total left" -PercentComplete (100 - 100 * $left / [Math]::Max($total, 1))
    if (([DateTime]::UtcNow - $lastProgress).TotalMinutes -ge $StallMinutes) { break }
}
Write-Progress -Activity 'Downloading from OneDrive' -Completed

if ($left -eq 0) {
    Step 'Every file is on this device.'
    Note 'Next:'
    Note ("       pwsh -File platform/import-ideas.ps1 -Source `"$Source`" -Name IDEES -Push")
    exit 0
}

Warn "$left of $total file(s) did not arrive in $StallMinutes minutes without progress:"
foreach ($file in ($pending | Sort-Object -Property Length -Descending | Select-Object -First 25)) {
    Note ("  {0,10:N0} bytes  {1}" -f $file.Length, $file.FullName.Substring($Source.Length + 1))
}
Write-Host ''
Warn 'The engine is running but not delivering. In order:'
Note '  1. Run this again with -Reset.'
Note '  2. Open the OneDrive icon in the notification area and check for a sign-in prompt,'
Note '     a full account, or a paused sync.'
Note '  3. If it still will not deliver, these files exist only in the cloud and must come'
Note '     down through onedrive.com in a browser.'
exit 1
