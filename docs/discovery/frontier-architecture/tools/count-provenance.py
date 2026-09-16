#!/usr/bin/env python3
# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Reproduces every number of COUNT-PROVENANCE.md from the files it names.

Run from the repository root:  python3 docs/discovery/frontier-architecture/tools/count-provenance.py
Each line prints  <ledger row>  <value>  <set definition / rule>.  A row that cannot be reproduced
from repository files prints NOT-IN-REPO with the reason; it is never silently filled in.
"""
import json, re, subprocess, collections, sys, pathlib

ROOT = pathlib.Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
def read(p): return (ROOT / p).read_text(encoding='utf-8')
def row(k, v, rule): print(f"{k:<28} {str(v):<10} {rule}")

# --- L1..L5  GAP-ANALYSIS appendix: one row per canonical ID, verdict in column 3 -----------------
lines = read('docs/discovery/GAP-ANALYSIS.md').split('\n')
start = next(i for i, l in enumerate(lines) if l.startswith('## Παράρτημα'))
idre = re.compile(r'^(REQ|CMP|ICD|INV|KT|EXP|ADR|EP)-[A-Z0-9]+(?:-[0-9]+)?$')
rows = []
for l in lines[start:]:
    if not l.startswith('|'): continue
    c = [x.strip() for x in l.strip().strip('|').split('|')]
    if len(c) >= 3 and idre.match(c[0]): rows.append(c)
def verdict(c):
    c = c.replace('*', '')
    for k, tag in (('ισχύει', 'holds'), ('υπάρχει αυστηρά ανώτερο', 'superior'), ('κενό', 'gap'), ('δεν ξέρω', 'unknown')):
        if c.startswith(k): return tag
    return 'OTHER'
vc = collections.Counter(verdict(r[2]) for r in rows)
ids = [r[0] for r in rows]
row('L1 classified IDs', len(set(ids)), 'unique IDs in GAP-ANALYSIS.md appendix rows (col 1 matches ^(REQ|CMP|ICD|INV|KT|EXP|ADR|EP)-); duplicates=' + str(len(ids) - len(set(ids))))
row('L2 holds', vc['holds'], "appendix col 3 startswith 'ισχύει' (incl. 'ισχύει → αλλάζει με')")
row('L3 superior', vc['superior'], "appendix col 3 startswith 'υπάρχει αυστηρά ανώτερο'")
row('L4 gaps', vc['gap'], "appendix col 3 startswith 'κενό'")
row('L5 unknowns', vc['unknown'], "appendix col 3 startswith 'δεν ξέρω'; IDs=" + ','.join(r[0] for r in rows if verdict(r[2]) == 'unknown'))
row('L5a changed-by', sum(1 for r in rows if 'αλλάζει με' in r[2]), "subset of L2 whose col 3 contains 'αλλάζει με'")
row('L5b per prefix', dict(sorted(collections.Counter(i.split('-')[0] for i in set(ids)).items())), 'L1 grouped by prefix')
row('L5c feasibility', dict(collections.Counter(r[3] for r in rows if len(r) > 3)), 'appendix col 4')

# --- L6  invented IDs withdrawn: names removed from model/*.sysml in commit f5baa98 ---------------
diff = subprocess.check_output(['git', 'show', 'f5baa98', '--format=', '--', 'model/'], text=True, cwd=ROOT)
removed = sorted(set(re.findall(r"<'([^']+)'>", '\n'.join(l for l in diff.split('\n') if l.startswith('-') and not l.startswith('---') and l.endswith('') and '.sysml' not in l))))
row('L6 invented IDs removed', len(removed), "distinct <'NAME'> tokens on '-' lines of `git show f5baa98 -- model/` (sysml files only): " + ' '.join(removed))

# --- L7..L9  MATERIAL-SYNTHESIS headline numbers (stated in the file; reproduced by regex) --------
ms = read('docs/discovery/MATERIAL-SYNTHESIS.md')
m = re.search(r'\*\*Πέντε άξονες σύγκρουσης, (\d+) ευρήματα:\*\* υποβαθμίσεις (\d+) · έδρες (\d+) · κενά (\d+) · παραδείγματα (\d+) · υπεροχή (\d+)\. Κατά σοβαρότητα: \*\*blocking (\d+) · significant (\d+) · minor (\d+)', ms)
if m:
    n = list(map(int, m.groups()))
    row('L7 conflict findings', n[0], f'MATERIAL-SYNTHESIS.md Σύνοψη; axes {n[1]}+{n[2]}+{n[3]}+{n[4]}+{n[5]}={sum(n[1:6])}; severity {n[6]}+{n[7]}+{n[8]}={sum(n[6:9])}')
else: row('L7 conflict findings', 'NOT-FOUND', 'headline sentence not matched')
m = re.search(r'~(\d+) μοναδικά σημεία SUPERIOR/NEW μετά την αφαίρεση επικαλύψεων \((\d+) πριν\), κατανεμημένα ([^.]+)\.', ms)
if m:
    parts = dict(re.findall(r'([A-Z]+) (\d+)', m.group(3)))
    row('L8 superior/new pre-dedup', m.group(2), 'MATERIAL-SYNTHESIS.md Σύνοψη; per layer ' + str(parts) + ' sum=' + str(sum(map(int, parts.values()))))
    row('L9 superior/new dedup', '~' + m.group(1), 'stated as approximate in MATERIAL-SYNTHESIS.md; the deduplicated list itself was not persisted → exact value NOT-IN-REPO')
m = re.search(r'\| Ισχυροί ισχυρισμοί \| (\d+) \|', ms); strong = int(m.group(1)) if m else None
m2 = re.search(r'\*\*(\d+) ελεγμένοι από τους (\d+): (\d+) HOLDS, (\d+) FAILS, (\d+) UNPROVEN', ms)
row('L10 strong claims', strong, 'MATERIAL-SYNTHESIS.md Σύνοψη table «Ισχυροί ισχυρισμοί»')
if m2: row('L10a checked in §7', m2.group(1), f'§7: {m2.group(3)} HOLDS, {m2.group(4)} FAILS, {m2.group(5)} UNPROVEN')
row('L10b remaining claims', (strong - int(m2.group(1))) if (strong and m2) else 'n/a', 'L10 − L10a = the set the claims-verdict workflow verified (CLAIMS-VERDICT.md)')

# --- L11  cross-layer contradictions and duplicate seats ------------------------------------------
cj = json.loads(read('docs/discovery/data/critic-contradictions.json'))
row('L11 contradictions', len(cj['contradictions']), 'len(critic-contradictions.json["contradictions"])')
row('L11a duplicate seats', len(cj['duplicate_seats']), 'len(critic-contradictions.json["duplicate_seats"])')

# --- L12..L14  requirement, invariant and component families -----------------------------------------
row('L12 requirements', len(set(re.findall(r'\bREQ-[A-Z]+-\d{3}\b', read('docs/architecture-draft/_unmerged-parts/29.md')))), 'distinct REQ-XXX-nnn in _unmerged-parts/29.md (the REQ register); same set as L5b[REQ]')
sv = read('docs/architecture-draft/spine-vocab.md')
row('L13 invariants', len(set(re.findall(r'\bINV-[A-Z]\d{2}\b', sv))), 'distinct INV-Xnn in spine-vocab.md; _unmerged-parts/19.md register gives the same')
corpus = read('docs/architecture-draft/GRAIL_WORLD_OS_MASTER_ARCHITECTURE_v1.0.md') + ''.join(read(f'docs/architecture-draft/_unmerged-parts/{f}.md') for f in ('6.4', '15', '19', '29'))
cmps = set(re.findall(r'\bCMP-[A-Z]{3}-\d{2}\b', corpus))
row('L14 components', len(cmps), 'distinct CMP-XXX-nn in master + unmerged 6.4/15/19/29; master §6.3 states 76 and enumerates ' + str(len(cmps)) + ' — ' + str(dict(sorted(collections.Counter(c.split('-')[1] for c in cmps).items()))))
for p, pat, src in (('ICD', r'\bICD-\d{2}\b', sv), ('KT', r'\bKT-\d{2}\b', sv), ('EXP', r'\bEXP-\d{2}\b', sv), ('EP', r'\bEP-\d{2}\b', sv), ('ADR', r'\bADR-\d{4}\b', read('docs/architecture-draft/_unmerged-parts/22.md'))):
    row(f'L14a {p}', len(set(re.findall(pat, src))), f'distinct {p} ids in ' + ('spine-vocab.md' if src is sv else '_unmerged-parts/22.md'))

# --- L15  raw material ------------------------------------------------------------------------------
mf = [l for l in read('docs/ideas-raw/IDEES.manifest.tsv').split('\n') if l and not l.startswith('#')]
hdr = mf[0].split('\t'); data = [l.split('\t') for l in mf[1:]]
size_col = next((i for i, h in enumerate(hdr) if 'byte' in h.lower() or 'size' in h.lower()), None)
nbytes = sum(int(r[size_col]) for r in data if size_col is not None and len(r) > size_col and r[size_col].isdigit())
row('L15 IDEES files', len(data), 'data rows of docs/ideas-raw/IDEES.manifest.tsv (comment and header lines excluded); bytes=' + str(nbytes) + '; header=' + ','.join(hdr))
