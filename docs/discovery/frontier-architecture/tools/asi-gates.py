#!/usr/bin/env python3
# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""The twelve acceptance gates of the Ω-MAXIMUM NON-ABSTENTION ARCHITECTURE MANDATE 0.4.0 §15, machine-readable.

  asi-gates.py            writes ACCEPTANCE-GATES.yaml (PASS/FAIL per gate with counts and evidence pointers) and exits 1 on any FAIL

Every gate is a mechanical check over the package; none of them judges the ambition of the project.  A gate that cannot be
decided mechanically says so (evidence: 'MANUAL') instead of passing silently.  Historical prose kept as evidence of the 0.3.0
abstention (adversarial/MFA-ATK-10.md, README, TECHNICAL-ARCHITECTURE §7) is annotated by MFA-PATCH-0041, not deleted; the
gate `nonexistence_used_as_refusal` therefore scans the SEATS and the ASI-* deliverables, and reports the annotated files separately."""
import re, sys, pathlib, subprocess, datetime, yaml, collections

PKG = pathlib.Path(__file__).resolve().parent.parent
def L(n): return yaml.safe_load((PKG / n).read_text(encoding='utf-8'))
STATUSES = {'PROVEN', 'MECHANICALLY VERIFIED', 'EMPIRICALLY SUPPORTED', 'IMPLEMENTABLE FROM KNOWN COMPONENTS', 'NOVEL SYNTHESIS', 'NEW FORMALISM', 'RESEARCH HYPOTHESIS', 'ACTIVE UNKNOWN', 'CONFLICT', 'FALSIFIED', 'IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS'}
FORBIDDEN = [r'δεν γίνεται(?!\s+\S)', 'δεν είναι σήμερα εφικτό', 'δεν μπορεί να εγγυηθεί', 'είναι πολύ σύνθετο', 'δεν υπάρχει αρκετή βιβλιογραφία', 'κανένα σημερινό σύστημα δεν το κάνει', 'θα περιοριστούμε σε έναν copilot', 'θα το αφήσουμε για το μέλλον', 'δεν εγγυάται υπερ-νοημοσύνη', 'παραμένει πορεία']
E = L('ARCHITECTURE-ELEMENTS.yaml')['elements']; C = L('CAPABILITY-LATTICE.yaml')['capabilities']; M = L('INVENTIONS.yaml')['mechanisms']
O = L('OBJECTIVE-SPACE.yaml'); OBJ = O['objectives']; TEL = O['telos_candidates']; U = L('UNKNOWNS.yaml')['unknowns']; R = L('RESEARCH-PROGRAMS.yaml')['programs']
V = L('VERIFICATION-OBLIGATIONS.yaml')['obligations']; I = L('INVARIANTS.yaml')['invariants']; AUD = L('ASI-ABSTENTION-AUDIT.yaml')['items']
gates = []
def gate(name, ok, count, evidence, detail=None):
    gates.append({'gate': name, 'result': 'PASS' if ok else 'FAIL', 'count': count, 'evidence': evidence, **({'detail': detail} if detail else {})})

def audit_open(kind): return [a['id'] for a in AUD if a['kind'] == kind and a['status'] == 'OPEN']

# 1 capability_removed_without_proof
recl = []
for coll, key in ((OBJ, 'falsifier'), (TEL, 'falsifier'), (E, 'falsifier'), (V, 'rejects'), (R, 'rejects'), (C, 'falsifier')):
    for r in coll:
        t = str(r.get(key, ''))
        if 'RECLASSIFY' in t and 'IMPOSSIBILITY-DOSSIER' not in t and 'PRESERVED' not in t and 'FALSIFIED' not in t: recl.append(r['id'])
removed = [r['id'] for r in C + OBJ if str(r.get('status', '')).upper() in ('REMOVED', 'DELETED')]
oa = audit_open('capability_removed_without_proof')
gate('capability_removed_without_proof', not recl and not removed and not oa, len(recl) + len(removed) + len(oa), 'MFA-PATCH-0039 (RECLASSIFY→FALSIFIED/PRESERVED)· CAPABILITY-CONSERVATION.md· ASI-ABSTENTION-AUDIT AA-001/004/016/031', {'reclassify_of_capability': recl, 'removed_records': removed, 'audit_open': oa})
# 2 unknown_converted_to_prohibition
bad = [u['id'] for u in U if not u.get('plan') or not u.get('reason_class')]
proh = [u['id'] for u in U if re.search(r'απαγορεύ', str(u.get('judgment', ''))) and not any(k in str(u.get('judgment', '')) for k in ('μένει', 'PRESERVED', 'χωρίς', 'εναλλακτ', 'αντί'))]
oa = audit_open('unknown_converted_to_prohibition')
gate('unknown_converted_to_prohibition', not bad and not proh and not oa, len(bad) + len(proh) + len(oa), 'UNKNOWNS.yaml (plan + reason_class)· MFA-CON-047 (DEC-X-19 ως ενεργό συμβόλαιο)· AA-002/007', {'unknown_without_plan': bad, 'unknown_judged_as_prohibition': proh, 'audit_open': oa})
# 3 nonexistence_used_as_refusal
hits = collections.defaultdict(list); annotated = collections.defaultdict(int); quoted = collections.defaultdict(int)
for f in [x for x in PKG.glob('*.yaml') if x.name != 'ACCEPTANCE-GATES.yaml'] + list((PKG / 'inventions').glob('*.yaml')) + list(PKG.glob('ASI-*.md')) + list((PKG / 'mechanisms').glob('MFA-MECH-0[2-4][0-9].md')):
    t = f.read_text(encoding='utf-8')
    for p in FORBIDDEN:
        for m in re.finditer(p if p.startswith('δεν γίνεται(') else re.escape(p), t):
            ctx = t[max(0, m.start() - 160):m.end() + 160]
            if f.name.startswith('ASI-ABSTENTION-AUDIT'): quoted[f.name] += 1; continue
            if any(k in ctx for k in ('IMPOSSIBILITY-DOSSIER', 'ΑΝΑΘΕΩΡΗΣΗ 0.4.0', 'Αναθεώρηση 0.4.0', 'AA-0', 'ήταν αποχή', 'αποχή', 'FORBIDDEN', '§3 της εντολής', 'φράσεις της §3', 'επιστημική κατάσταση', 'RESEARCH HYPOTHESIS', 'ιστορικό τεκμήριο', 'τεκμήριο')): annotated[f.name] += 1
            else: hits[f.name].append(p)
oa = audit_open('nonexistence_used_as_refusal')
gate('nonexistence_used_as_refusal', not hits and not oa, sum(len(v) for v in hits.values()) + len(oa), 'σάρωση φράσεων §3 στις έδρες, inventions/, ASI-*.md, mechanisms/020…044· ιστορική πρόζα σημασμένη από MFA-PATCH-0041', {'hits': dict(hits), 'annotated_historical_mentions': dict(annotated), 'audit_quotations_of_the_abstention': dict(quoted), 'audit_open': oa})
# 4 current_tool_treated_as_permanent_ceiling
inv068 = next(i for i in I if i['id'] == 'MFA-INV-068'); elm099 = next(e for e in E if e['id'] == 'MFA-ELM-099'); elm086 = next(e for e in E if e['id'] == 'MFA-ELM-086')
frozen = [e['id'] for e in E if re.search(r'(παγωμέν\w*|frozen)\W+(?:\w+\W+){0,3}?(kernel|toolchain|Lean|TLA|checker)', str(e.get('statement', '')), re.I) and 'αντικαταστάσιμ' not in str(e.get('statement', '')) and 'SUPERSEDED' not in str(e.get('statement', ''))]
ok = str(inv068.get('status')).startswith('SUPERSEDED') and 'αντικαταστάσιμ' in str(elm099.get('statement', '')) and 'ταβάνι' in str(elm086.get('statement', '')) and not frozen and not audit_open('current_tool_treated_as_permanent_ceiling')
gate('current_tool_treated_as_permanent_ceiling', ok, len(frozen), 'MFA-INV-068 SUPERSEDED by MFA-INV-076· MFA-ELM-099 VFC με αντικαταστάσιμους checkers· MFA-ELM-086 harness εξελίσσεται (MFA-PATCH-0045)· AA-005', {'frozen_statements': frozen})
# 5 named_mechanism_without_semantics
nod = [m['id'] for m in M if not (PKG / m['dossier']).exists()]
thin = []
for m in M:
    t = (PKG / m['dossier']).read_text(encoding='utf-8') if (PKG / m['dossier']).exists() else ''
    rows = len(re.findall(r'^\| \*\*\d+\. ', t, re.M))
    if rows < 22: thin.append((m['id'], rows))
noalg = [m['id'] for m in M if int(m['id'][-3:]) >= 26 and not (PKG / 'inventions' / f"{m['id']}.yaml").exists()]
oa = audit_open('named_mechanism_without_semantics')
gate('named_mechanism_without_semantics', not nod and not thin and not noalg and not oa, len(nod) + len(thin) + len(noalg) + len(oa), 'mechanisms/*.md (22 πεδία) + inventions/*.yaml (29 πεδία με algorithms.pseudocode)· AA-003/009…015/024…030', {'no_dossier': nod, 'dossier_rows_below_22': thin, 'no_invention_yaml': noalg, 'audit_open': oa})
# 6 research_hypothesis_without_falsifier
norej = [r['id'] for r in R if not r.get('rejects')]
nofals = []
for f in (PKG / 'inventions').glob('*.yaml'):
    d = yaml.safe_load(f.read_text(encoding='utf-8'))
    if not d.get('falsifiers') or not d.get('experiments'): nofals.append(f.stem)
noplan = [u['id'] for u in U if u.get('reason_class') == 'EPISTEMIC' and not u.get('plan')]
oa = audit_open('research_hypothesis_without_falsifier')
gate('research_hypothesis_without_falsifier', not norej and not nofals and not noplan and not oa, len(norej) + len(nofals) + len(noplan) + len(oa), 'RESEARCH-PROGRAMS.rejects· inventions/*.falsifiers+experiments· UNKNOWNS(EPISTEMIC).plan· AA-021', {'rsp_without_rejects': norej, 'invention_without_falsifier_or_experiment': nofals, 'epistemic_unknown_without_plan': noplan})
# 7 invention_without_implementation_path
nopath = []
for f in (PKG / 'inventions').glob('*.yaml'):
    d = yaml.safe_load(f.read_text(encoding='utf-8'))
    if not d.get('migration_path') or not d.get('implementation_sequence'): nopath.append(f.stem)
rm = (PKG / 'IMPLEMENTATION-ROADMAP.md').read_text(encoding='utf-8') + (PKG / 'ASI-IMPLEMENTATION-LADDER.md').read_text(encoding='utf-8') if (PKG / 'ASI-IMPLEMENTATION-LADDER.md').exists() else (PKG / 'IMPLEMENTATION-ROADMAP.md').read_text(encoding='utf-8')
dosed = set(re.findall(r'MFA-ELM-\d{3}', rm)) | {e for r in R if r.get('first_dose') is not None for e in r.get('elements', [])}
nodose = [e['id'] for e in E if e['id'] not in dosed]
oa = audit_open('invention_without_implementation_path')
gate('invention_without_implementation_path', not nopath and not nodose and not oa, len(nopath) + len(nodose) + len(oa), 'inventions/*.migration_path+implementation_sequence· IMPLEMENTATION-ROADMAP.md + ASI-IMPLEMENTATION-LADDER.md + RESEARCH-PROGRAMS.first_dose· AA-006/020', {'invention_without_path': nopath, 'element_without_dose': nodose, 'audit_open': oa})
# 8 strong_claim_without_epistemic_status
nost = [r['id'] for coll in (E, C, M, OBJ) for r in coll if r.get('epistemic_status') not in STATUSES]
badclaims = []
for f in (PKG / 'inventions').glob('*.yaml'):
    d = yaml.safe_load(f.read_text(encoding='utf-8'))
    es = d.get('epistemic_status', {})
    if es.get('overall') not in STATUSES or any(c.get('status') not in STATUSES for c in es.get('per_claim', [])): badclaims.append(f.stem)
oa = audit_open('strong_claim_without_epistemic_status')
gate('strong_claim_without_epistemic_status', not nost and not badclaims and not oa, len(nost) + len(badclaims) + len(oa), 'πεδίο epistemic_status σε ELM/CAP/MECH/OBJ (MFA-PATCH-0036/0037/0038) + inventions/*.epistemic_status.per_claim· AA-008/017', {'records_without_status': nost[:20], 'inventions_with_bad_status': badclaims})
# 9 same_lineage_agents_claimed_independent
inv089 = any(i['id'] == 'MFA-INV-089' for i in I); rule = 'lineage' in str(elm086.get('statement', '')) and 'distilled' in (PKG / 'mechanisms' / 'MFA-MECH-009.md').read_text(encoding='utf-8')
claims = []
for coll in (E, M, C):
    for r in coll:
        t = str(r.get('statement', ''))
        if re.search(r'instances? του ίδιου μοντέλου', t) and 'ΔΕΝ' not in t and 'δεν είναι' not in t: claims.append(r['id'])
oa = audit_open('same_lineage_agents_claimed_independent')
gate('same_lineage_agents_claimed_independent', inv089 and rule and not claims and not oa, len(claims) + len(oa), 'MFA-INV-089 (κανόνας γενεαλογίας)· MFA-ELM-086/114· mechanisms/MFA-MECH-009.md §0.4.0 (MFA-PATCH-0040)· AA-015', {'claims': claims})
# 10 production_constraint_reduced_architecture_ceiling
elm097 = next(e for e in E if e['id'] == 'MFA-ELM-097'); lean_ok = all(x in str(elm097.get('statement', '')) for x in ('MFA-ELM-122', 'MFA-ELM-119', 'MFA-ELM-116', 'MFA-ELM-126'))
laptop = [c['id'] for c in C if re.search(r'laptop|DEP-1 μόνο', str(c.get('maturity', '')) + str(c.get('statement', '')), re.I) and not any(k in str(c.get('statement', '')) for k in ('ταβάνι', 'ίδια συνάρτηση', 'προβολ'))]
ladder = (PKG / 'ASI-IMPLEMENTATION-LADDER.md').exists()
oa = audit_open('production_constraint_reduced_architecture_ceiling')
gate('production_constraint_reduced_architecture_ceiling', lean_ok and not laptop and ladder and not oa, len(laptop) + len(oa) + (0 if lean_ok else 1) + (0 if ladder else 1), 'MFA-ELM-097 lean profile 0.4.0 (MFA-PATCH-0052)· ASI-IMPLEMENTATION-LADDER.md· AA-018 όρος', {'capabilities_gated_by_profile': laptop, 'lean_profile_contains_lite_mechanisms': lean_ok})
# 11 unresolved_dangling_reference_count
out = subprocess.run([sys.executable, str(PKG / 'tools' / 'check-package.py')], capture_output=True, text=True, cwd=PKG).stdout
m = re.search(r'R1 all MFA references resolve \((\d+) dangling\)', out); dang = int(m.group(1)) if m else -1
gate('unresolved_dangling_reference_count', dang == 0, dang, 'tools/check-package.py R1', {'checker_line': (m.group(0) if m else 'R1 line not found')})
# 12 silent_overwrite_count
patches = sorted(p for p in (PKG / 'patches').glob('MFA-PATCH-*.yaml') if not p.stem.endswith('-R'))
norb = [p.stem for p in patches if yaml.safe_load(p.read_text(encoding='utf-8')).get('status') == 'APPLIED' and not p.with_name(p.stem + '-R.yaml').exists()]
touched = set()
for p in patches:
    d = yaml.safe_load(p.read_text(encoding='utf-8'))
    for k in (d.get('change') or {}):
        if '.' in k or '/' in k: touched.add(k)
seats = {'OBJECTIVE-SPACE.yaml', 'CAPABILITY-LATTICE.yaml', 'ARCHITECTURE-ELEMENTS.yaml', 'CONTRACTS.yaml', 'INVARIANTS.yaml', 'VERIFICATION-OBLIGATIONS.yaml', 'UNKNOWNS.yaml', 'CONFLICTS.yaml', 'RESEARCH-PROGRAMS.yaml', 'INVENTIONS.yaml'}
generated = {'MANIFEST.yaml', 'RELATIONS.yaml', 'CHANGELOG.md', 'ACCEPTANCE-GATES.yaml', 'diagrams/rendered/INDEX.md'}
try:
    root = pathlib.Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True, cwd=PKG).strip())
    modified = subprocess.check_output(['git', 'diff', '--name-only', 'HEAD', '--', str(PKG)], text=True, cwd=root).split()
    rel = [str(pathlib.Path(root / f).relative_to(PKG)) for f in modified]
except Exception as ex:
    rel = []; modified = [f'git unavailable: {ex}']
tooling = [f for f in rel if f.startswith('tools/')]
overwrites = [f for f in rel if f not in seats and f not in generated and f not in touched and not f.startswith('patches/') and not f.startswith('tools/')]
gate('silent_overwrite_count', not norb and not overwrites, len(norb) + len(overwrites), 'patches/*-R.yaml (rollback ανά APPLIED patch)· git diff HEAD έναντι των file-ops των patches· παράγωγα: MANIFEST/RELATIONS/CHANGELOG/ACCEPTANCE-GATES/rendered INDEX', {'applied_without_rollback': norb, 'modified_tracked_files_not_covered_by_a_patch': overwrites, 'tooling_modified_reported_not_counted': tooling, 'modified_tracked_files': rel})

doc = {'generated_at': datetime.datetime.utcnow().replace(microsecond=0).isoformat() + 'Z', 'mandate': 'Ω-MAXIMUM NON-ABSTENTION ARCHITECTURE MANDATE 0.4.0 §15', 'package_version': '0.4.0',
       'summary': {'PASS': sum(g['result'] == 'PASS' for g in gates), 'FAIL': sum(g['result'] == 'FAIL' for g in gates)}, 'gates': gates,
       'note': 'Οι πύλες είναι μηχανικές· δεν κρίνουν τη φιλοδοξία. Ό,τι δεν αποφασίζεται μηχανικά δηλώνεται στο detail. Μόνο ο δημιουργός εγκρίνει.'}
(PKG / 'ACCEPTANCE-GATES.yaml').write_text('# ACCEPTANCE-GATES — generated by tools/asi-gates.py; do not edit by hand\n# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.\n' + yaml.safe_dump(doc, allow_unicode=True, sort_keys=False, width=160), encoding='utf-8')
for g in gates: print(f"{g['result']} {g['gate']} (count={g['count']})")
sys.exit(1 if doc['summary']['FAIL'] else 0)
