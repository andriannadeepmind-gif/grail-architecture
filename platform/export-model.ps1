# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
<#
.SYNOPSIS
Exports a SysON project as byte-exact SysON JSON plus a SysML v2 text view of each document, with a fidelity report.

.DESCRIPTION
SysON keeps no model history (its SysML v2 API reports a single commit per project), so the files
written here, once committed, are the model's history.

Mechanism, verified against SysON v2026.7.0:
  project id        GET  /api/rest/projects                                   (exact name match)
  editing context   POST /api/graphql  viewer.project.currentEditingContext.id
  document list     GET  /api/projects/{projectId}                            (zip: <project>/manifest.json)
  SysON JSON        <project>/documents/{doc}.json inside the same zip        (complete model)
  SysML v2 text     GET  /api/editingcontexts/{ec}/documents/{doc}  with  Accept: text/html
                    (SysON's SysMLv2DocumentExporter answers only to text/html)

The JSON is the complete model. The text is a readable view, and SysON v2026.7.0 prints some constructs
wrongly or not at all (tested 2026-09-15), so each export is checked and the result recorded in
.syson/text-fidelity.txt: element names absent from the text, constructs known to be misprinted,
and messages the exporter logged in the SysON container. A document with any finding is marked LOSSY,
also in a note line at the top of its .sysml file.

Output (everything is staged and checked before the output directory is touched):
  <Out>/<document>.sysml            SysML v2 text view (documents whose name ends in .sysml), preceded by
                                    note lines (// ...), which the SysML v2 parser ignores
  <Out>/.syson/<document>.json      SysON JSON, byte-for-byte
  <Out>/.syson/manifest.json        SysON manifest (document id -> name)
  <Out>/.syson/text-fidelity.txt    fidelity of each text view

The script fails (exit 1, output untouched) when the export itself fails; a LOSSY text view is not a failure.

.EXAMPLE
pwsh -File platform/export-model.ps1 -Project GRAIL-World-OS
#>
[CmdletBinding()]
param(
    [string]$Project = 'GRAIL-World-OS',
    [string]$Out = (Join-Path (Split-Path $PSScriptRoot -Parent) 'model'),
    [string]$SysonUrl = 'http://localhost:8180',
    [string]$Container = 'grail-syson-app-1'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$utf8 = [System.Text.UTF8Encoding]::new($false)
$started = [DateTime]::UtcNow

# Constructs SysON v2026.7.0 stores but misprints in the text view (each observed on 2026-09-15).
$misprinted = [ordered]@{
    'Dependency'                 = 'omitted from the text'
    'FramedConcernMembership'    = "printed as 'assume concern' instead of 'frame concern'"
    'InterfaceUsage'             = "printed as 'connection' instead of 'interface'"
    'VerificationCaseDefinition' = 'omitted from the text'
}

function Find-Node($Node, [string]$EClass, [System.Collections.Generic.List[object]]$Found) {
    if ($Node -is [System.Management.Automation.PSCustomObject]) {
        $classProperty = $Node.PSObject.Properties['eClass']
        if ($classProperty -and $classProperty.Value -eq "sysml:$EClass") { $Found.Add($Node) }
        foreach ($property in $Node.PSObject.Properties) { Find-Node $property.Value $EClass $Found }
    } elseif ($Node -is [System.Collections.IEnumerable] -and $Node -isnot [string]) {
        foreach ($item in $Node) { Find-Node $item $EClass $Found }
    }
}

# Findings for one document: what the complete model (JSON) holds that its text view does not show faithfully.
function Get-TextFindings([string]$Json, [string]$Text) {
    $findings = [System.Collections.Generic.List[string]]::new()

    $absent = @([regex]::Matches($Json, '"declared(?:Short)?Name":"((?:[^"\\]|\\.)*)"') |
        ForEach-Object { [regex]::Unescape($_.Groups[1].Value) } |
        Where-Object { -not $Text.Contains($_) } | Sort-Object -Unique)
    if ($absent.Count -gt 0) {
        $findings.Add("element names absent from the text ($($absent.Count)): $(($absent | Select-Object -First 25) -join ', ')")
    }

    $counts = @{}
    foreach ($m in [regex]::Matches($Json, '"eClass":"sysml:(\w+)"')) { $counts[$m.Groups[1].Value] = 1 + [int]$counts[$m.Groups[1].Value] }
    foreach ($construct in $misprinted.Keys) {
        if ($counts[$construct]) { $findings.Add("$construct x$($counts[$construct]): $($misprinted[$construct])") }
    }

    $tree = if ($counts['VariantMembership'] -or ($counts['ConstraintDefinition'] -and $counts['ResultExpressionMembership'])) { ($Json | ConvertFrom-Json).content }

    # Variants lose the 'variant' keyword. Enumeration values are variant memberships too, but print correctly.
    if ($counts['VariantMembership']) {
        $memberships = [System.Collections.Generic.List[object]]::new()
        Find-Node $tree 'VariantMembership' $memberships
        $variants = @($memberships | Where-Object {
                $values = [System.Collections.Generic.List[object]]::new()
                Find-Node $_ 'EnumerationUsage' $values
                $values.Count -eq 0
            }).Count
        if ($variants -gt 0) { $findings.Add("VariantMembership x${variants}: printed as a plain usage (the 'variant' keyword is lost)") }
    }

    # A constraint definition's body cannot refer to its own features: the import leaves the references
    # unresolved and the exporter prints no expression. require/assert constraint bodies are unaffected.
    if ($counts['ConstraintDefinition'] -and $counts['ResultExpressionMembership']) {
        $definitions = [System.Collections.Generic.List[object]]::new()
        Find-Node $tree 'ConstraintDefinition' $definitions
        $withBody = @($definitions | Where-Object {
                $bodies = [System.Collections.Generic.List[object]]::new()
                Find-Node $_ 'ResultExpressionMembership' $bodies
                $bodies.Count -gt 0
            }).Count
        if ($withBody -gt 0) {
            $findings.Add("ConstraintDefinition with a body expression x${withBody}: the expression is absent from the text (its references to the definition's own features are unresolved in SysON)")
        }
    }
    return , $findings
}

# Project and editing context.
$found = @(Invoke-RestMethod -Uri "$SysonUrl/api/rest/projects" | Where-Object { $_.name -ceq $Project })
if ($found.Count -ne 1) { throw "export-model: expected exactly one SysON project named '$Project', found $($found.Count)." }
$projectId = $found[0].'@id'

$query = @{
    query     = 'query($id: ID!) { viewer { project(projectId: $id) { currentEditingContext { id } } } }'
    variables = @{ id = $projectId }
} | ConvertTo-Json -Depth 4
$editingContextId = (Invoke-RestMethod -Method Post -Uri "$SysonUrl/api/graphql" -ContentType 'application/json' -Body $query).data.viewer.project.currentEditingContext.id
if (-not $editingContextId) { throw "export-model: SysON returned no editing context for project '$Project'." }

$work = Join-Path ([System.IO.Path]::GetTempPath()) "syson-export-$([guid]::NewGuid())"
$stage = Join-Path $work 'out'
$stageSyson = Join-Path $stage '.syson'
New-Item -ItemType Directory -Path $stageSyson -Force | Out-Null
try {
    # Document list and JSON copies, from the project zip.
    $zip = Join-Path $work 'project.zip'
    Invoke-WebRequest -Uri "$SysonUrl/api/projects/$projectId" -OutFile $zip
    Expand-Archive -LiteralPath $zip -DestinationPath (Join-Path $work 'zip')
    $manifestFiles = @(Get-ChildItem -LiteralPath (Join-Path $work 'zip') -Recurse -File -Filter 'manifest.json')
    if ($manifestFiles.Count -ne 1) { throw "export-model: the project zip holds $($manifestFiles.Count) manifest.json files, expected 1." }
    $zipRoot = $manifestFiles[0].DirectoryName
    Copy-Item -LiteralPath $manifestFiles[0].FullName -Destination (Join-Path $stageSyson 'manifest.json')

    $manifest = Get-Content -Raw -LiteralPath $manifestFiles[0].FullName | ConvertFrom-Json
    $documents = @($manifest.documentIdsToName.PSObject.Properties |
        ForEach-Object { [pscustomobject]@{ Id = $_.Name; Name = [string]$_.Value } } | Sort-Object Name)
    if ($documents.Count -eq 0) { throw "export-model: project '$Project' has no documents." }
    # File names are case-insensitive on Windows and macOS.
    if (@($documents.Name | ForEach-Object { $_.ToLowerInvariant() } | Select-Object -Unique).Count -ne $documents.Count) {
        throw "export-model: two documents of '$Project' share a name (case-insensitively)."
    }

    $fidelity = [System.Collections.Generic.List[string]]::new()
    $fidelity.Add("Text fidelity of the SysML v2 views exported from SysON project '$Project' (platform/export-model.ps1).")
    $fidelity.Add('The complete model of each document is .syson/<document>.json; the .sysml files are readable views.')
    $fidelity.Add('')

    $report = foreach ($doc in $documents) {
        if ($doc.Name -notmatch '^[A-Za-z0-9][A-Za-z0-9._ -]*$') { throw "export-model: document name '$($doc.Name)' is not a safe file name." }
        $jsonFile = Join-Path $zipRoot "documents/$($doc.Id).json"
        if (-not (Test-Path -LiteralPath $jsonFile -PathType Leaf)) { throw "export-model: the project zip lacks the JSON of document '$($doc.Name)'." }
        Copy-Item -LiteralPath $jsonFile -Destination (Join-Path $stageSyson "$($doc.Name).json")

        if ($doc.Name -notlike '*.sysml') {
            $fidelity.Add("$($doc.Name): no text view (the document name does not end in .sysml)")
            continue
        }
        $raw = Join-Path $work "$($doc.Id).txt"
        $response = Invoke-WebRequest -Uri "$SysonUrl/api/editingcontexts/$editingContextId/documents/$($doc.Id)" -Headers @{ Accept = 'text/html' } -OutFile $raw -PassThru
        if ([string]$response.Headers['Content-Type'] -notlike 'text/html*') { throw "export-model: SysON did not return SysML text for '$($doc.Name)'." }
        $text = [System.IO.File]::ReadAllText($raw, $utf8)

        $findings = Get-TextFindings -Json ([System.IO.File]::ReadAllText($jsonFile, $utf8)) -Text $text
        if ($findings.Count -eq 0) {
            $fidelity.Add("$($doc.Name): no loss detected")
        } else {
            $fidelity.Add("$($doc.Name): LOSSY")
            $findings | ForEach-Object { $fidelity.Add("  - $_") }
        }

        $header = "// Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.`n" +
                  "// Exported from SysON project '$Project', document '$($doc.Name)'. The model lives in SysON; do not edit this file by hand.`n"
        if ($findings.Count -gt 0) {
            $header += "// LOSSY text view: see .syson/text-fidelity.txt; the complete model is .syson/$($doc.Name).json`n"
        }
        $target = Join-Path $stage $doc.Name
        [System.IO.File]::WriteAllText($target, $header + $text, $utf8)
        [pscustomobject]@{
            Document = $doc.Name
            Text     = if ($findings.Count -eq 0) { 'no loss detected' } else { 'LOSSY' }
            Bytes    = (Get-Item -LiteralPath $target).Length
            Sha256   = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash.ToLowerInvariant()
        }
    }

    # Messages the exporter logged while serializing (e.g. "... are not yet handled : <element id>").
    $fidelity.Add('')
    if (Get-Command docker -ErrorAction SilentlyContinue) {
        $since = $started.AddSeconds(-5).ToString('yyyy-MM-ddTHH:mm:ssZ')
        $ErrorActionPreference = 'Continue'
        $log = @(& docker logs --since $since $Container 2>&1 | ForEach-Object { "$_" })
        $dockerExit = $LASTEXITCODE
        $ErrorActionPreference = 'Stop'
        if ($dockerExit -ne 0) {
            $fidelity.Add("Exporter log: not checked (could not read the log of container '$Container').")
        } else {
            $messages = @($log | Where-Object { $_ -like '*SysMLv2DocumentExporter*' } |
                ForEach-Object { ($_ -split 'SysMLv2DocumentExporter\s*:\s*', 2)[-1] } | Sort-Object -Unique)
            if ($messages.Count -eq 0) {
                $fidelity.Add('Exporter log: no messages.')
            } else {
                $fidelity.Add("Exporter log: $($messages.Count) message(s):")
                $messages | ForEach-Object { $fidelity.Add("  - $_") }
            }
        }
    } else {
        $fidelity.Add('Exporter log: not checked (docker not found).')
    }
    [System.IO.File]::WriteAllText((Join-Path $stageSyson 'text-fidelity.txt'), ($fidelity -join "`n") + "`n", $utf8)

    # Replace the previous export only now that everything is staged.
    $outSyson = Join-Path $Out '.syson'
    New-Item -ItemType Directory -Path $outSyson -Force | Out-Null
    Get-ChildItem -LiteralPath $Out -File -Filter '*.sysml' | Remove-Item
    Get-ChildItem -LiteralPath $outSyson -File | Remove-Item
    Copy-Item -Path (Join-Path $stage '*.sysml') -Destination $Out
    Copy-Item -Path (Join-Path $stageSyson '*') -Destination $outSyson

    $report | Format-Table -AutoSize | Out-String | Write-Host
    $lossy = @($report | Where-Object Text -eq 'LOSSY').Count
    Write-Host "export-model: $($documents.Count) document(s) of '$Project' -> $Out ($lossy LOSSY text view(s); see .syson/text-fidelity.txt)"
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
