# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Brings a folder of the creator's raw material into the repository byte-for-byte, with a manifest that proves nothing was changed or lost.

.DESCRIPTION
The material is the input of the design. It is committed as it is: not edited, not filtered,
not summarised, nothing dropped as "irrelevant". The script is idempotent — running it again
mirrors the current state of the source folder.

Mechanism:
  1. The folder is enumerated. Files that OneDrive keeps in the cloud (Files On-Demand) are
     pinned with attrib +P -U, the equivalent of "Always keep on this device", and the script
     waits for them to arrive. A file that never arrives stops the run: it must not enter the
     repository as an empty stub.
  2. Every file is hashed (SHA-256), read with FileShare.ReadWrite so that a document open in
     another program is still readable, and retried three times. Every file that still cannot be
     read is reported together with the others, with what to do about it.
  3. robocopy /MIR mirrors the folder into docs/ideas-raw/<Name>.
  4. Every copied file is hashed again and compared with the source. A missing file, a different
     size or a different hash fails the run and nothing is committed.
  5. docs/ideas-raw/<Name>.manifest.tsv is written (path, bytes, sha256), so the identity of the
     copy is proven by the repository itself and can be re-checked at any time.
  6. The copy is staged and the git index is counted against the manifest, so a file silently
     excluded by .gitignore, or swallowed by a nested .git, fails the run instead of disappearing.
  7. The result is committed, and pushed when -Push is given (with backoff on network failure).

Checks that stop the run before anything is copied, all reported together:
  file >= 100 MB          GitHub rejects the push  -> Git LFS, or leave it out deliberately
  path > 240 characters   not portable             -> shorten folder names in the source
  nested .git directory   git would store it as a submodule link and lose its contents
                          -> -ExcludeNestedGit (recorded in the manifest), or archive that repo
  unreadable file         the material would be incomplete -> the run prints what to do

.EXAMPLE
pwsh -File platform/import-ideas.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -InventoryOnly

.EXAMPLE
pwsh -File platform/import-ideas.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -Push
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Source,
    [string]$Name,
    [string]$Repo = (Split-Path $PSScriptRoot -Parent),
    [string]$Branch,
    [int]$HydrationTimeoutMinutes = 60,
    [switch]$InventoryOnly,
    [switch]$ExcludeNestedGit,
    [switch]$Push
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
# git and robocopy report through exit codes (robocopy 1-7 is success, 'git diff --quiet' is a
# question), so a non-zero exit must not raise a terminating error.
if (Test-Path variable:PSNativeCommandUseErrorActionPreference) { $PSNativeCommandUseErrorActionPreference = $false }
$utf8 = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = $utf8
$started = [DateTime]::UtcNow

$AuthorEmail = 'info@stavropouloslaw.com'
$MaxFileBytes = 100MB
$WarnFileBytes = 50MB
$MaxPathLength = 240
$HashAttempts = 3
# A file that OneDrive has not put on this disk carries one of these bits:
# FILE_ATTRIBUTE_OFFLINE 0x1000, FILE_ATTRIBUTE_RECALL_ON_OPEN 0x40000,
# FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS 0x400000.
$CloudMask = 0x441000

function Step([string]$Message) { Write-Host "==> $Message" -ForegroundColor Cyan }
function Note([string]$Message) { Write-Host "    $Message" }
function Warn([string]$Message) { Write-Host "  $Message" -ForegroundColor Yellow }
function Fail([string]$Message) { Write-Host "FAIL  $Message" -ForegroundColor Red; exit 1 }

function Test-Cloud($File) { return ((([int]$File.Attributes) -band $CloudMask) -ne 0) }

function Get-LongPath([string]$Path) {
    if ($Path.Length -lt 250 -or $Path.StartsWith('\\?\')) { return $Path }
    if ($Path.StartsWith('\\')) { return '\\?\UNC\' + $Path.Substring(2) }
    return '\\?\' + $Path
}

function Get-Sha256([string]$Path) {
    # FileShare::ReadWrite, so a document currently open in another program can still be read.
    $stream = [System.IO.File]::Open((Get-LongPath $Path), [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
    try {
        $sha = [System.Security.Cryptography.SHA256]::Create()
        try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
        finally { $sha.Dispose() }
    } finally { $stream.Dispose() }
}

function Resolve-Exception($ErrorRecord) {
    # PowerShell wraps a failing .NET call in a MethodInvocationException whose own HResult says
    # nothing; the file system error is the innermost exception.
    $exception = $ErrorRecord.Exception
    while ($exception.InnerException) { $exception = $exception.InnerException }
    $permanent = $exception -is [System.IO.FileNotFoundException] -or $exception -is [System.IO.DirectoryNotFoundException]
    return [pscustomobject]@{
        Code      = ('0x{0:X8}' -f $exception.HResult)
        Message   = $exception.Message
        Permanent = $permanent
    }
}

function Get-Entries([string]$Root) {
    $base = $Root.TrimEnd('\', '/')
    $walkErrors = $null
    $files = @(Get-ChildItem -LiteralPath $base -Recurse -File -Force -ErrorAction SilentlyContinue -ErrorVariable walkErrors)
    foreach ($problem in @($walkErrors)) { Warn "could not be listed: $($problem.TargetObject)" }
    return [pscustomobject]@{ Base = $base; Cut = $base.Length + 1; Files = $files }
}

function Wait-ForCloudFiles([string]$Root, [object[]]$Pending, [int]$TimeoutMinutes) {
    Note "$($Pending.Count) file(s) are not on this device (OneDrive Files On-Demand)."
    Note 'Pinning them ("Always keep on this device") and waiting for the download.'
    & attrib.exe +P -U $Root /D 2>&1 | Out-Null
    & attrib.exe +P -U (Join-Path $Root '*') /S /D 2>&1 | Out-Null

    $total = $Pending.Count
    $left = $total
    $deadline = [DateTime]::UtcNow.AddMinutes($TimeoutMinutes)
    $lastProgress = [DateTime]::UtcNow
    while ($left -gt 0 -and [DateTime]::UtcNow -lt $deadline) {
        Start-Sleep -Seconds 5
        $still = @($Pending | Where-Object {
            $item = Get-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
            $item -and (Test-Cloud $item)
        })
        if ($still.Count -lt $left) { $lastProgress = [DateTime]::UtcNow }
        $left = $still.Count
        $Pending = $still
        Write-Progress -Activity 'Downloading from OneDrive' -Status "$left of $total left" -PercentComplete (100 - 100 * $left / [Math]::Max($total, 1))
        # OneDrive downloads in the background; if nothing has arrived for three minutes the sync
        # engine is not doing the work and waiting longer will not change that.
        if (([DateTime]::UtcNow - $lastProgress).TotalMinutes -ge 3) { break }
    }
    Write-Progress -Activity 'Downloading from OneDrive' -Completed
    if ($left -eq 0) { Note 'All files are on this device.' }
    return $left
}

function Get-Inventory([string]$Root, [switch]$Hydrate) {
    $scan = Get-Entries $Root
    if ($scan.Files.Count -eq 0) { return [pscustomobject]@{ Items = @(); Failures = @(); Cloud = 0 } }

    $cloudLeft = 0
    $files = $scan.Files
    if ($Hydrate) {
        $pending = @($files | Where-Object { Test-Cloud $_ })
        if ($pending.Count -gt 0) {
            $cloudLeft = Wait-ForCloudFiles $scan.Base $pending $HydrationTimeoutMinutes
            $files = (Get-Entries $Root).Files   # sizes and attributes change once a file arrives
        }
    }

    $items = [System.Collections.Generic.List[object]]::new()
    $failures = [System.Collections.Generic.List[object]]::new()
    $done = 0
    foreach ($file in $files) {
        $done++
        if ($done % 25 -eq 0) { Write-Progress -Activity 'Hashing' -Status "$done / $($files.Count)" -PercentComplete (100 * $done / [Math]::Max($files.Count, 1)) }
        $relative = $file.FullName.Substring($scan.Cut).Replace('\', '/')
        $hash = $null
        $problem = $null
        # Once the sync engine is down every file fails; stop paying the retry delay for each one.
        $attempts = if ($failures.Count -ge 20) { 1 } else { $HashAttempts }
        foreach ($attempt in 1..$attempts) {
            try { $hash = Get-Sha256 $file.FullName; $problem = $null; break }
            catch {
                $problem = Resolve-Exception $_
                if ($problem.Permanent -or $attempt -ge $attempts) { break }
                Start-Sleep -Seconds (2 * $attempt)
            }
        }
        if ($null -eq $hash) {
            $failures.Add([pscustomobject]@{
                Path       = $relative
                Code       = $problem.Code
                Message    = $problem.Message
                StillCloud = (Test-Cloud $file)
            })
            continue
        }
        $items.Add([pscustomobject]@{ Path = $relative; Bytes = $file.Length; Hash = $hash })
    }
    Write-Progress -Activity 'Hashing' -Completed
    return [pscustomobject]@{ Items = $items.ToArray(); Failures = $failures.ToArray(); Cloud = $cloudLeft }
}

function Find-OneDrive {
    # OneDrive is per-machine on current Windows and per-user on older installs.
    $candidates = @(
        (Join-Path $env:ProgramFiles 'Microsoft OneDrive\OneDrive.exe'),
        (Join-Path ${env:ProgramFiles(x86)} 'Microsoft OneDrive\OneDrive.exe'),
        (Join-Path $env:LOCALAPPDATA 'Microsoft\OneDrive\OneDrive.exe')
    )
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath $candidate -PathType Leaf)) { return $candidate }
    }
    return $null
}

function Stop-OnUnreadable([object[]]$Failures, [string]$Root) {
    Warn "$($Failures.Count) file(s) could not be read:"
    foreach ($failure in ($Failures | Select-Object -First 25)) {
        Note "  $($failure.Path)"
        Note "      $($failure.Code) $($failure.Message)"
    }
    if ($Failures.Count -gt 25) { Note "  ... and $($Failures.Count - 25) more" }
    $cloudy = @($Failures | Where-Object { $_.StillCloud })
    Write-Host ''
    Warn 'What to do, in this order:'
    $stepNumber = 1
    if ($cloudy.Count -gt 0) {
        Note "  $($cloudy.Count) of them are still only in the cloud, so OneDrive is not delivering them."
        Note "  $stepNumber. Restart OneDrive and wait until it reports \"Up to date\":"
        Note '         Get-Process OneDrive -ErrorAction SilentlyContinue | Stop-Process -Force'
        $onedrive = Find-OneDrive
        if ($onedrive) { Note ('         Start-Process "' + $onedrive + '"') }
        else { Note '         OneDrive.exe was not found in Program Files or AppData: reinstall it, or use step 4.' }
        Note '     Then run this script again.'
        $stepNumber++
        Note "  $stepNumber. In File Explorer, right-click the folder -> \"Always keep on this device\","
        Note '     and wait until every icon is a green tick and not a cloud.'
        $stepNumber++
    }
    Note "  $stepNumber. Close any file of the folder that is open in Word or another program, and check"
    Note '     that your account can read it (right-click -> Properties -> Security).'
    $stepNumber++
    Note "  $stepNumber. The reliable way out of OneDrive altogether — copy the folder to a plain local"
    Note '     path and import from there:'
    Note ('         robocopy "' + $Root + '" "C:\IDEES" /E /R:1 /W:1')
    Note '         pwsh -File platform/import-ideas.ps1 -Source C:\IDEES -Name IDEES -InventoryOnly'
    Fail 'nothing was copied: the material must be readable in full before it enters the repository.'
}

function Sort-ByPath([object[]]$Items) {
    $sorted = [object[]]$Items
    [Array]::Sort($sorted, [System.Comparison[object]] { param($a, $b) [string]::CompareOrdinal($a.Path, $b.Path) })
    return $sorted
}

# --- source ---------------------------------------------------------------

if (-not (Test-Path -LiteralPath $Source -PathType Container)) { Fail "source folder not found: $Source" }
$Source = (Resolve-Path -LiteralPath $Source).Path.TrimEnd('\', '/')
if (-not $Name) { $Name = Split-Path $Source -Leaf }
if ($Name -match '[\\/:*?"<>|]') { Fail "the name '$Name' is not usable as a folder name" }

$landing = Join-Path $Repo 'docs' 'ideas-raw'
$destination = Join-Path $landing $Name
$manifestPath = Join-Path $landing "$Name.manifest.tsv"

Step "Reading $Source"
$scan = Get-Inventory -Root $Source -Hydrate
$sourceFiles = @($scan.Items)
if (@($scan.Failures).Count -gt 0) { Stop-OnUnreadable @($scan.Failures) $Source }
if ($sourceFiles.Count -eq 0) { Fail "the source folder is empty: $Source" }

$totalBytes = ($sourceFiles | Measure-Object -Property Bytes -Sum).Sum
Note ("{0} files, {1:N1} MB, all readable" -f $sourceFiles.Count, ($totalBytes / 1MB))
$sourceFiles |
    Group-Object { $ext = [IO.Path]::GetExtension($_.Path).ToLowerInvariant(); if ($ext) { $ext } else { '(no extension)' } } |
    Sort-Object Count -Descending | Select-Object -First 12 |
    ForEach-Object { Note ("  {0,-16} {1,6}" -f $_.Name, $_.Count) }

# --- checks ---------------------------------------------------------------

$nestedGit = @($sourceFiles | Where-Object { $_.Path -match '(^|/)\.git/' })
$kept = if ($ExcludeNestedGit) { @($sourceFiles | Where-Object { $_.Path -notmatch '(^|/)\.git/' }) } else { $sourceFiles }
$keptBytes = ($kept | Measure-Object -Property Bytes -Sum).Sum

$tooBig = @($kept | Where-Object { $_.Bytes -ge $MaxFileBytes })
$big = @($kept | Where-Object { $_.Bytes -ge $WarnFileBytes -and $_.Bytes -lt $MaxFileBytes })
$tooLong = @($kept | Where-Object { ("docs/ideas-raw/$Name/" + $_.Path).Length -gt $MaxPathLength })

$blocked = $false
if ($tooBig.Count -gt 0) {
    $blocked = $true
    Warn "$($tooBig.Count) file(s) >= 100 MB — GitHub would reject the push:"
    $tooBig | Sort-Object Bytes -Descending | Select-Object -First 20 | ForEach-Object { Note ("  {0,8:N1} MB  {1}" -f ($_.Bytes / 1MB), $_.Path) }
}
if ($tooLong.Count -gt 0) {
    $blocked = $true
    Warn "$($tooLong.Count) path(s) longer than $MaxPathLength characters:"
    $tooLong | Select-Object -First 20 | ForEach-Object { Note ("  {0}" -f $_.Path) }
}
if ($nestedGit.Count -gt 0 -and -not $ExcludeNestedGit) {
    $blocked = $true
    $repos = @($nestedGit | ForEach-Object { ($_.Path -replace '(^|/)\.git/.*$', '$1') } | Sort-Object -Unique)
    Warn "the material contains $($repos.Count) git repository/-ies; git would store them as submodule links and lose their contents:"
    $repos | Select-Object -First 20 | ForEach-Object { Note ("  {0}.git" -f $_) }
    Note 'Re-run with -ExcludeNestedGit to import everything except those .git directories (recorded in the manifest).'
}
if ($big.Count -gt 0) { Note "$($big.Count) file(s) between 50 and 100 MB — accepted, but GitHub will warn." }
if ($blocked) { Fail 'nothing was copied; resolve the points above first.' }

if ($InventoryOnly) { Step 'Inventory only — nothing copied.'; exit 0 }

# --- copy and verify ------------------------------------------------------

Step "Mirroring into docs/ideas-raw/$Name"
New-Item -ItemType Directory -Force -Path $landing | Out-Null
$robocopyArgs = @($Source, $destination, '/MIR', '/R:2', '/W:2', '/NFL', '/NDL', '/NJH', '/NJS', '/NP')
if ($ExcludeNestedGit) { $robocopyArgs += @('/XD', '.git') }
& robocopy.exe @robocopyArgs | Out-Null
if ($LASTEXITCODE -ge 8) { Fail "robocopy failed (exit $LASTEXITCODE)" }

Step 'Verifying the copy against the source'
$copyScan = Get-Inventory -Root $destination
if (@($copyScan.Failures).Count -gt 0) { Stop-OnUnreadable @($copyScan.Failures) $destination }
$copyFiles = @($copyScan.Items)
$sourceByPath = @{}; foreach ($file in $kept) { $sourceByPath[$file.Path] = $file }
$copyByPath = @{}; foreach ($file in $copyFiles) { $copyByPath[$file.Path] = $file }

$missing = @($kept | Where-Object { -not $copyByPath.ContainsKey($_.Path) })
$extra = @($copyFiles | Where-Object { -not $sourceByPath.ContainsKey($_.Path) })
$altered = @($kept | Where-Object { $copyByPath.ContainsKey($_.Path) -and $copyByPath[$_.Path].Hash -ne $_.Hash })

foreach ($set in @(@{ n = 'missing from the copy'; v = $missing }, @{ n = 'present only in the copy'; v = $extra }, @{ n = 'different content'; v = $altered })) {
    if ($set.v.Count -gt 0) {
        Warn "$($set.v.Count) file(s) $($set.n):"
        $set.v | Select-Object -First 20 | ForEach-Object { Note ("  {0}" -f $_.Path) }
    }
}
if ($missing.Count + $extra.Count + $altered.Count -gt 0) { Fail 'the copy is not identical to the source; nothing was committed.' }
Note "$($copyFiles.Count) files verified identical (SHA-256)."

# --- manifest -------------------------------------------------------------

Step "Writing docs/ideas-raw/$Name.manifest.tsv"
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.')
$lines.Add("# source: $Source")
$lines.Add("# files: $($kept.Count)  bytes: $keptBytes")
if ($ExcludeNestedGit -and $nestedGit.Count -gt 0) {
    foreach ($path in ($nestedGit | ForEach-Object { ($_.Path -replace '(^|/)\.git/.*$', '$1') } | Sort-Object -Unique)) {
        $lines.Add("# excluded (nested git repository): ${path}.git")
    }
}
$lines.Add("path`tbytes`tsha256")
foreach ($file in (Sort-ByPath $kept)) { $lines.Add("$($file.Path)`t$($file.Bytes)`t$($file.Hash)") }
[IO.File]::WriteAllText($manifestPath, ($lines -join "`n") + "`n", $utf8)

# --- git ------------------------------------------------------------------

Push-Location $Repo
try {
    $configuredEmail = (git config user.email)
    if ($configuredEmail -ne $AuthorEmail) {
        Fail @"
this clone commits as '$configuredEmail'. Set the identity of the work once:
    git config user.name  "Stavropoulos Law®"
    git config user.email $AuthorEmail
"@
    }

    if ($Branch) {
        Step "Branch $Branch"
        git fetch origin $Branch 2>$null | Out-Null
        if ((git rev-parse --verify --quiet "refs/heads/$Branch")) { git switch $Branch | Out-Null }
        elseif ((git rev-parse --verify --quiet "refs/remotes/origin/$Branch")) { git switch -c $Branch --track "origin/$Branch" | Out-Null }
        else { git switch -c $Branch | Out-Null }
        if ($LASTEXITCODE -ne 0) { Fail "could not switch to branch $Branch" }
    }
    $current = (git rev-parse --abbrev-ref HEAD).Trim()

    Step 'Staging'
    git add -A -- 'docs/ideas-raw' | Out-Null
    $staged = @((@(git ls-files -z -- "docs/ideas-raw/$Name") -join '') -split "`0" | Where-Object { $_ })
    if ($staged.Count -ne $kept.Count) {
        Warn "git holds $($staged.Count) of the $($kept.Count) copied files."
        $ignored = @(git -c core.quotepath=false ls-files -o -i --exclude-standard -- "docs/ideas-raw/$Name")
        if ($ignored.Count -gt 0) {
            Note "$($ignored.Count) file(s) excluded by .gitignore:"
            $ignored | Select-Object -First 20 | ForEach-Object { Note "  $_" }
        }
        Fail 'the repository would not hold the whole material; nothing was committed.'
    }

    git diff --cached --quiet
    if ($LASTEXITCODE -eq 0) { Step "Nothing changed since the last import ($current)."; exit 0 }

    Step 'Committing'
    $summary = "Raw material: $Name ($($kept.Count) files, {0:N1} MB)" -f ($keptBytes / 1MB)
    $body = "Verbatim copy of $Source, verified file by file against docs/ideas-raw/$Name.manifest.tsv (SHA-256). Input for the design; not edited or filtered."
    git commit -m $summary -m $body | Out-Null
    if ($LASTEXITCODE -ne 0) { Fail 'the commit failed.' }

    if ($Push) {
        Step "Pushing to origin/$current"
        $pushed = $false
        foreach ($delay in @(0, 2, 4, 8, 16)) {
            if ($delay -gt 0) { Note "retry in ${delay}s"; Start-Sleep -Seconds $delay }
            git push -u origin $current
            if ($LASTEXITCODE -eq 0) { $pushed = $true; break }
        }
        if (-not $pushed) { Fail 'the push failed after 5 attempts.' }
    } else {
        Note "Committed on $current. Push with:  git push -u origin $current"
    }
} finally {
    Pop-Location
}

Step ("Done in {0:N0}s." -f ([DateTime]::UtcNow - $started).TotalSeconds)
