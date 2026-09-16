# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Proves that the files on this disk are byte-for-byte the files that were committed, and names any that are not.

.DESCRIPTION
A deliverable that travels through a chat window, a return value or a network can be truncated or
altered without saying so. It already happened once in this project: a 169.771-character document
came back through the return channel as 77.510 characters, and only a byte count caught it. Nothing
here asks for trust; everything is arithmetic the creator runs himself.

Three independent checks, from the strongest outward:

  1. git fsck --full — every object in the repository is verified against its own hash. Git is
     content-addressed: an object whose bytes changed no longer matches its name. This alone
     proves that the history was not altered in transit.
  2. The working tree against the index and HEAD — git status must be empty, so that what is on
     the disk is what the commit says, not a local edit.
  3. docs/discovery/INTEGRITY.tsv — the SHA-256 of every tracked file, computed when the manifest
     was written. Each one is recomputed here and compared. The manifest cannot contain its own
     hash, so it is pinned by the commit that carries it, which check 1 verifies.

With -Commit <sha> the head of the branch is compared against a commit named independently — from
the chat, or from the repository page on github.com. Two channels that would have to be altered in
the same way at the same time for a difference to pass.

Exit code 0 means every check passed. Anything else names what differs.

.EXAMPLE
pwsh -File platform/verify-integrity.ps1

.EXAMPLE
pwsh -File platform/verify-integrity.ps1 -Commit 7161921
#>
[CmdletBinding()]
param(
    [string]$Repo = (Split-Path $PSScriptRoot -Parent),
    [string]$Commit,
    [switch]$Quiet
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
if (Test-Path variable:PSNativeCommandUseErrorActionPreference) { $PSNativeCommandUseErrorActionPreference = $false }
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)

function Step([string]$Message) { Write-Host "==> $Message" -ForegroundColor Cyan }
function Note([string]$Message) { if (-not $Quiet) { Write-Host "    $Message" } }
function Bad([string]$Message) { Write-Host "  $Message" -ForegroundColor Red }
function Good([string]$Message) { Write-Host "    $Message" -ForegroundColor Green }

$manifestPath = Join-Path $Repo 'docs/discovery/INTEGRITY.tsv'
$failures = 0

Push-Location $Repo
try {
    # --- 1. the repository verifies itself ---------------------------------
    Step 'git fsck — every object against its own hash'
    $fsck = & git fsck --full --strict 2>&1
    if ($LASTEXITCODE -ne 0) {
        $failures++
        Bad 'git fsck FAILED. The repository is corrupt or was altered:'
        $fsck | Select-Object -First 20 | ForEach-Object { Note "  $_" }
    } else {
        Good 'every object matches its hash'
    }

    $head = (& git rev-parse HEAD).Trim()
    $branch = (& git rev-parse --abbrev-ref HEAD).Trim()
    Note "HEAD $head  ($branch)"

    if ($Commit) {
        Step "Comparing against the commit named independently: $Commit"
        if ($head.StartsWith($Commit) -or $Commit.StartsWith($head)) {
            Good 'the head of this clone IS that commit'
        } else {
            $failures++
            Bad "MISMATCH. This clone is at $head, not at $Commit."
            Bad 'Either the clone is not up to date (git pull), or the two channels disagree.'
        }
    }

    # --- 2. the working tree against the commit ----------------------------
    Step 'Working tree against the commit'
    $dirty = @(& git status --porcelain --untracked-files=no)
    if ($dirty.Count -gt 0) {
        $failures++
        Bad "$($dirty.Count) tracked file(s) on disk differ from the commit:"
        $dirty | Select-Object -First 20 | ForEach-Object { Note "  $_" }
    } else {
        Good 'no tracked file was modified locally'
    }

    # --- 3. every file against the recorded SHA-256 ------------------------
    if (-not (Test-Path -LiteralPath $manifestPath)) {
        $failures++
        Bad "docs/discovery/INTEGRITY.tsv is missing: nothing to compare against."
    } else {
        Step 'Every file against the SHA-256 recorded when it was written'
        $checked = 0; $missing = 0; $changed = 0
        foreach ($line in [IO.File]::ReadAllLines($manifestPath)) {
            if ($line.StartsWith('#') -or $line -eq '' -or $line.StartsWith('path')) { continue }
            $parts = $line -split "`t"
            if ($parts.Count -lt 3) { continue }
            $relative, $bytes, $expected = $parts[0], [int64]$parts[1], $parts[2]
            $full = Join-Path $Repo $relative
            if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
                $missing++; Bad "MISSING  $relative"; continue
            }
            $actual = (Get-FileHash -LiteralPath $full -Algorithm SHA256).Hash.ToLowerInvariant()
            $size = ([System.IO.FileInfo]::new($full)).Length
            if ($actual -ne $expected) {
                $changed++
                Bad "CHANGED  $relative"
                Note "         recorded $expected  ($bytes bytes)"
                Note "         on disk  $actual  ($size bytes)"
            }
            $checked++
        }
        if ($missing -gt 0 -or $changed -gt 0) {
            $failures++
            Bad "$changed changed, $missing missing, out of $($checked + $missing) recorded files"
        } else {
            Good "$checked files, every one byte-for-byte as recorded"
        }
    }
} finally {
    Pop-Location
}

Write-Host ''
if ($failures -eq 0) {
    Write-Host 'PASS  What you are reading is exactly what was written. Nothing was cut, nothing was altered.' -ForegroundColor Green
    exit 0
}
Write-Host "FAIL  $failures check(s) did not pass. Do not trust the content above until they do." -ForegroundColor Red
exit 1
