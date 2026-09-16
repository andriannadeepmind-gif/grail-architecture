# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Copies a OneDrive folder to a plain local path, taking only the files that are really on this disk, and naming the ones that are not.

.DESCRIPTION
When the OneDrive sync engine will not deliver a file, robocopy can carry the placeholder over as an
empty shell without saying so, and once the copy is outside OneDrive nothing marks it as incomplete:
the material would enter the repository as zeros. This script never copies a file it cannot fully
read. It takes everything that is on the disk, and prints the exact list of what is missing, to be
downloaded from onedrive.com by hand into the same destination.

A file is treated as not on this device when it carries FILE_ATTRIBUTE_OFFLINE 0x1000,
FILE_ATTRIBUTE_RECALL_ON_OPEN 0x40000 or FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS 0x400000, or when
reading its bytes fails.

.EXAMPLE
pwsh -File platform/stage-local-copy.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -Destination C:\IDEES
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Source,
    [Parameter(Mandatory)][string]$Destination
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if (Test-Path variable:PSNativeCommandUseErrorActionPreference) { $PSNativeCommandUseErrorActionPreference = $false }
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$CloudMask = 0x441000

function Step([string]$Message) { Write-Host "==> $Message" -ForegroundColor Cyan }
function Note([string]$Message) { Write-Host "    $Message" }
function Warn([string]$Message) { Write-Host "  $Message" -ForegroundColor Yellow }

if (-not (Test-Path -LiteralPath $Source -PathType Container)) {
    Write-Host "FAIL  source folder not found: $Source" -ForegroundColor Red; exit 1
}
$Source = (Resolve-Path -LiteralPath $Source).Path.TrimEnd('\', '/')

Step "Reading $Source"
$files = @(Get-ChildItem -LiteralPath $Source -Recurse -File -Force)
Note "$($files.Count) files in the source"

[System.IO.Directory]::CreateDirectory($Destination) | Out-Null
$Destination = (Resolve-Path -LiteralPath $Destination).Path.TrimEnd('\', '/')

$copied = 0
$missing = [System.Collections.Generic.List[object]]::new()
foreach ($file in $files) {
    $relative = $file.FullName.Substring($Source.Length + 1)
    if ((([int]$file.Attributes) -band $CloudMask) -ne 0) {
        $missing.Add([pscustomobject]@{ Path = $relative; Bytes = $file.Length; Why = 'only in the cloud' })
        continue
    }
    $target = Join-Path $Destination $relative
    [System.IO.Directory]::CreateDirectory([System.IO.Path]::GetDirectoryName($target)) | Out-Null
    try {
        # Read the bytes rather than trusting the attributes: a placeholder the sync engine cannot
        # deliver must fail here and not land as an empty file.
        $stream = [System.IO.File]::Open($file.FullName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
        try { $bytes = [System.IO.BinaryReader]::new($stream).ReadBytes([int]$file.Length) }
        finally { $stream.Dispose() }
        if ($bytes.Length -ne $file.Length) { throw "read $($bytes.Length) of $($file.Length) bytes" }
        [System.IO.File]::WriteAllBytes($target, $bytes)
        $copied++
    } catch {
        $exception = $_.Exception
        while ($exception.InnerException) { $exception = $exception.InnerException }
        if (Test-Path -LiteralPath $target) { Remove-Item -LiteralPath $target -Force }
        $missing.Add([pscustomobject]@{ Path = $relative; Bytes = $file.Length; Why = $exception.Message })
    }
}

Step "Copied $copied of $($files.Count) files to $Destination"

if ($missing.Count -eq 0) {
    Note 'Nothing is missing. The copy is complete.'
    Note "Next:  pwsh -File platform/import-ideas.ps1 -Source `"$Destination`" -Push"
    exit 0
}

Warn "$($missing.Count) file(s) are NOT in the copy:"
foreach ($item in $missing) { Note ("  {0,10:N0} bytes  {1}   [{2}]" -f $item.Bytes, $item.Path, $item.Why) }
Write-Host ''
Warn 'Download exactly these from onedrive.com and put them in the same place under'
Note "  $Destination"
Note 'keeping the folder structure. Then check that nothing is left out:'
Note ("       (Get-ChildItem `"$Source`" -Recurse -File -Force).Count")
Note ("       (Get-ChildItem `"$Destination`" -Recurse -File -Force).Count")
Note 'The two numbers must be equal. Only then:'
Note ("       pwsh -File platform/import-ideas.ps1 -Source `"$Destination`" -Push")
exit 1
