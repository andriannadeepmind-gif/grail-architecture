# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Brings a folder of the creator's raw material into the repository byte-for-byte, with a manifest that proves nothing was changed or lost.

.DESCRIPTION
The material is the input of the design. It is committed as it is: not edited, not filtered,
not summarised, nothing dropped as "irrelevant". The script is idempotent — running it again
mirrors the current state of the source folder.

Mechanism:
  1. Every source file is hashed (SHA-256). Reading the bytes also materialises OneDrive
     "online-only" placeholders, which robocopy would otherwise carry over as empty stubs.
  2. robocopy /MIR mirrors the folder into docs/ideas-raw/<Name>.
  3. Every copied file is hashed again and compared with the source. A missing file, a different
     size or a different hash fails the run and nothing is committed.
  4. docs/ideas-raw/<Name>.manifest.tsv is written (path, bytes, sha256), so the identity of the
     copy is proven by the repository itself and can be re-checked at any time.
  5. The copy is staged and the git index is counted against the manifest, so a file silently
     excluded by .gitignore, or swallowed by a nested .git, fails the run instead of disappearing.
  6. The result is committed, and pushed when -Push is given (with backoff on network failure).

Checks that stop the run before anything is copied, all reported together:
  file >= 100 MB          GitHub rejects the push  -> Git LFS, or leave it out deliberately
  path > 240 characters   not portable             -> shorten folder names in the source
  nested .git directory   git would store it as a submodule link and lose its contents
                          -> -ExcludeNestedGit (recorded in the manifest), or archive that repo

.EXAMPLE
pwsh -File platform/import-ideas.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -InventoryOnly

.EXAMPLE
pwsh -File platform/import-ideas.ps1 -Source 'C:\Users\David Spiridon\OneDrive\Desktop\IDEES' -Branch claude/quirky-lovelace-ucnjlj -Push
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Source,
    [string]$Name,
    [string]$Repo = (Split-Path $PSScriptRoot -Parent),
    [string]$Branch,
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

function Step([string]$Message) { Write-Host "==> $Message" -ForegroundColor Cyan }
function Note([string]$Message) { Write-Host "    $Message" }
function Fail([string]$Message) { Write-Host "FAIL  $Message" -ForegroundColor Red; exit 1 }

function Get-Inventory([string]$Root) {
    $base = $Root.TrimEnd('\', '/')
    $cut = $base.Length + 1
    $files = @(Get-ChildItem -LiteralPath $base -Recurse -File -Force)
    $result = [System.Collections.Generic.List[object]]::new()
    $done = 0
    foreach ($file in $files) {
        $done++
        if ($done % 200 -eq 0) { Write-Progress -Activity 'Hashing' -Status "$done / $($files.Count)" -PercentComplete (100 * $done / [Math]::Max($files.Count, 1)) }
        $result.Add([pscustomobject]@{
            Path  = $file.FullName.Substring($cut).Replace('\', '/')
            Bytes = $file.Length
            Hash  = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
        })
    }
    Write-Progress -Activity 'Hashing' -Completed
    return $result.ToArray()
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
Note 'Every file is read once, which also downloads any OneDrive online-only file.'
$sourceFiles = @(Get-Inventory $Source)
if ($sourceFiles.Count -eq 0) { Fail "the source folder is empty: $Source" }

$totalBytes = ($sourceFiles | Measure-Object -Property Bytes -Sum).Sum
Note ("{0} files, {1:N1} MB" -f $sourceFiles.Count, ($totalBytes / 1MB))
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
    Write-Host "  $($tooBig.Count) file(s) >= 100 MB — GitHub would reject the push:" -ForegroundColor Yellow
    $tooBig | Sort-Object Bytes -Descending | Select-Object -First 20 | ForEach-Object { Note ("  {0,8:N1} MB  {1}" -f ($_.Bytes / 1MB), $_.Path) }
}
if ($tooLong.Count -gt 0) {
    $blocked = $true
    Write-Host "  $($tooLong.Count) path(s) longer than $MaxPathLength characters:" -ForegroundColor Yellow
    $tooLong | Select-Object -First 20 | ForEach-Object { Note ("  {0}" -f $_.Path) }
}
if ($nestedGit.Count -gt 0 -and -not $ExcludeNestedGit) {
    $blocked = $true
    $repos = @($nestedGit | ForEach-Object { ($_.Path -replace '(^|/)\.git/.*$', '$1') } | Sort-Object -Unique)
    Write-Host "  the material contains $($repos.Count) git repository/-ies; git would store them as submodule links and lose their contents:" -ForegroundColor Yellow
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
$copyFiles = @(Get-Inventory $destination)
$sourceByPath = @{}; foreach ($file in $kept) { $sourceByPath[$file.Path] = $file }
$copyByPath = @{}; foreach ($file in $copyFiles) { $copyByPath[$file.Path] = $file }

$missing = @($kept | Where-Object { -not $copyByPath.ContainsKey($_.Path) })
$extra = @($copyFiles | Where-Object { -not $sourceByPath.ContainsKey($_.Path) })
$altered = @($kept | Where-Object { $copyByPath.ContainsKey($_.Path) -and $copyByPath[$_.Path].Hash -ne $_.Hash })

foreach ($set in @(@{ n = 'missing from the copy'; v = $missing }, @{ n = 'present only in the copy'; v = $extra }, @{ n = 'different content'; v = $altered })) {
    if ($set.v.Count -gt 0) {
        Write-Host "  $($set.v.Count) file(s) $($set.n):" -ForegroundColor Yellow
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
        Write-Host "  git holds $($staged.Count) of the $($kept.Count) copied files." -ForegroundColor Yellow
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
