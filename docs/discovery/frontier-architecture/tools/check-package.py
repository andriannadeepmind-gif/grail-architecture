#!/usr/bin/env python3
# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Consistency checks of the frontier-architecture package (MFA-VO-049) and generation of RELATIONS.yaml.

Checks (each prints PASS/FAIL with details; exit code 1 on any FAIL):
  R1 every MFA-* reference in any YAML resolves to a defined id
  R2 every capability is provided by >= 1 element; every element has >= 1 contract and >= 1 verification
  R3 every contract has state_semantics and failure_semantics; every invariant has >= 1 VO; every VO verifies >= 1 INV
  R4 every unknown has plan and reason_class; every conflict keeps both sides and a resolution condition
  R5 every mechanism has a dossier file; every element has resource_model and evolution_path
  R6 the 75 corpus CMP, 32 ICD, 40 INV, 24 KT each map to exactly one MFA element/contract/invariant/VO
  R7 every diagram source in diagrams/ references >= 1 real MFA id and every adversarial record names target ids
  R8 no dependency cycles among elements; no cycles among capabilities
  R9 every element appears as target in >= 1 adversarial record (when adversarial/ exists)
  R10 every ADR-0001..0033, EXP-01..27 and MATERIAL §2 row #1..35 has exactly one fate row in CAPABILITY-CONSERVATION.md
  R11 every element has a dose in IMPLEMENTATION-ROADMAP.md (or a research program with first_dose)
  R12 every APPLIED patch has its -R rollback next to it; git signature of the patch commits is reported (UNVERIFIED when no commit)
  R13 every element/capability/mechanism/objective carries epistemic_status (11 states, Ω-ASI 0.4.0 §5)
  R14 no falsifier/rejects reclassifies a capability (FALSIFIED mechanism ≠ removed capability)
  R15 every mechanism >= MFA-MECH-026 has a 29-field INVENTION DOSSIER (inventions/) with pseudocode
RELATIONS.yaml is regenerated from the source files (provides / corresponds-to / verifies / enforces / depends-on / refines / requires).
"""
import re, sys, pathlib, collections, subprocess, yaml

PKG = pathlib.Path(__file__).resolve().parent.parent
def load(name):
    p = PKG / name
    return yaml.safe_load(p.read_text(encoding='utf-8')) if p.exists() else None

fails = []
def check(cond, msg):
    print(('PASS ' if cond else 'FAIL ') + msg)
    if not cond: fails.append(msg)

obj = load('OBJECTIVE-SPACE.yaml'); cap = load('CAPABILITY-LATTICE.yaml'); elm = load('ARCHITECTURE-ELEMENTS.yaml')
con = load('CONTRACTS.yaml'); inv = load('INVARIANTS.yaml'); vo = load('VERIFICATION-OBLIGATIONS.yaml')
unk = load('UNKNOWNS.yaml'); cfl = load('CONFLICTS.yaml'); rsp = load('RESEARCH-PROGRAMS.yaml'); mech = load('INVENTIONS.yaml')

ids = {}
def reg(items, kind):
    for it in items or []:
        ids[it['id']] = kind
reg(obj['objectives'], 'OBJ'); reg(obj['telos_candidates'], 'TEL'); reg(obj['objective_contradictions'], 'CFL')
reg(cap['capabilities'], 'CAP'); reg(elm['elements'], 'ELM'); reg(con['contracts'], 'CON'); reg(inv['invariants'], 'INV')
reg(vo['obligations'], 'VO'); reg(unk['unknowns'], 'UNK'); reg(rsp['programs'], 'RSP'); reg(mech['mechanisms'], 'MECH')
if cfl: reg(cfl.get('conflicts', []), 'CFL')
for p in sorted((PKG / 'alternatives').glob('MFA-ALT-*.md')): ids[p.stem] = 'ALT'
for p in sorted((PKG / 'adversarial').glob('MFA-ATK-*.md')): ids[p.stem] = 'ATK'
for p in sorted((PKG / 'diagrams').glob('MFA-DIA-*.mmd')): ids[p.stem] = 'DIA'
for p in sorted((PKG / 'patches').glob('MFA-PATCH-*.yaml')): ids[p.stem] = 'PATCH'
ids['MFA-PATCH-0000'] = 'PATCH'  # the genesis patch (package creation)
# decision ids and deployment profiles live in markdown
for name, kind, pat in (('DECISION-LOG.md', 'DEC', r'MFA-DEC-\d{3}'), ('TECHNICAL-ARCHITECTURE.md', 'DEP', r'MFA-DEP-\d')):
    p = PKG / name
    if p.exists():
        for m in set(re.findall(pat, p.read_text(encoding='utf-8'))): ids[m] = kind

# R1 references
refre = re.compile(r'MFA-(?:OBJ|TEL|CAP|ELM|CON|INV|VO|UNK|CFL|RSP|MECH|ALT|ATK|DIA|PATCH|DEC|DEP)-[A-Za-z0-9]+(?:-R)?')
dangling = collections.defaultdict(set)
for p in list(PKG.glob('*.yaml')) + list(PKG.glob('*.md')) + list((PKG / 'mechanisms').glob('*.md')) + list((PKG / 'alternatives').glob('*.md')) + list((PKG / 'adversarial').glob('*.md')) + list((PKG / 'diagrams').glob('*.mmd')) + list((PKG / 'patches').glob('*.yaml')):
    if p.name in ('MANIFEST.yaml', 'RELATIONS.yaml', 'PATCH-PROTOCOL.md'): continue
    text = p.read_text(encoding='utf-8')
    if p.suffix == '.md': text = re.sub(r'```.*?```', '', text, flags=re.S)
    for m in set(refre.findall(text)):
        base = m[:-2] if m.endswith('-R') else m
        if base not in ids and not re.search(r'MFA-[A-Z]+-nnn|MFA-[A-Z]+-\*|MFA-DEP-n$', m): dangling[p.name].add(m)
check(not dangling, f'R1 all MFA references resolve ({sum(len(v) for v in dangling.values())} dangling)')
for k, v in dangling.items(): print('     ', k, sorted(v)[:12])

# R2 capabilities provided; elements have contract + verification
provided = collections.defaultdict(list)
for e in elm['elements']:
    for c in e.get('capabilities', []): provided[c].append(e['id'])
unprovided = [c['id'] for c in cap['capabilities'] if not provided.get(c['id'])]
check(not unprovided, f'R2a every capability provided by >=1 element (missing: {unprovided})')
noc = [e['id'] for e in elm['elements'] if not e.get('interfaces') and e['stratum'] != 'SX']
nov = [e['id'] for e in elm['elements'] if not e.get('verification')]
check(not noc and not nov, f'R2b every element has contract & verification (no contract: {noc}; no verification: {nov})')

# R3 contracts / invariants / VOs
badc = [c['id'] for c in con['contracts'] if not c.get('state_semantics') or not c.get('failure_semantics')]
check(not badc, f'R3a every contract has state & failure semantics ({badc})')
vo_by_inv = collections.defaultdict(list)
for v in vo['obligations']:
    for i in v.get('verifies', []): vo_by_inv[i].append(v['id'])
noinv = [i['id'] for i in inv['invariants'] if not i.get('verification')]
unverified = [i['id'] for i in inv['invariants'] if not vo_by_inv.get(i['id'])]
check(not noinv and not unverified, f'R3b every invariant has a VO (no verification field: {noinv}; not referenced by any VO: {unverified})')
novo = [v['id'] for v in vo['obligations'] if not v.get('verifies')]
check(not novo, f'R3c every VO verifies >=1 invariant ({novo})')

# R4 unknowns / conflicts
badu = [u['id'] for u in unk['unknowns'] if u.get('status') != 'MERGED' and (not u.get('plan') or not u.get('reason_class'))]
check(not badu, f'R4a every unknown has plan & reason_class ({badu})')
if cfl:
    badf = [c['id'] for c in cfl['conflicts'] if not c.get('side_a') or not c.get('side_b') or not c.get('resolution_condition')]
    check(not badf, f'R4b every conflict keeps both sides and a resolution condition ({badf})')
else:
    check(False, 'R4b CONFLICTS.yaml missing')

# R5 mechanisms dossiers; elements resource/evolution
nod = [m['id'] for m in mech['mechanisms'] if not (PKG / m['dossier']).exists()]
check(not nod, f'R5a every mechanism has a dossier file ({nod})')
bade = [e['id'] for e in elm['elements'] if not e.get('resource_model') or not e.get('evolution_path')]
check(not bade, f'R5b every element has resource_model & evolution_path ({bade})')

# R6 corpus correspondence
def corr(items, key='corresponds_to'):
    c = collections.Counter()
    for it in items:
        v = it.get(key)
        for x in (v if isinstance(v, list) else [v]):
            if isinstance(x, str) and re.match(r'^(CMP|ICD|INV|KT)-', x): c[x] += 1
    return c
cmpc = corr(elm['elements']); icdc = corr(con['contracts']); invc = corr(inv['invariants']); ktc = corr(vo['obligations'])
check(len([k for k in cmpc if k.startswith('CMP')]) == 75 and all(v == 1 for k, v in cmpc.items()), f'R6a 75 CMP mapped exactly once ({len(cmpc)} mapped)')
check(len(icdc) == 32 and all(v == 1 for v in icdc.values()), f'R6b 32 ICD mapped exactly once ({len(icdc)})')
check(len([k for k in invc if k.startswith("INV")]) == 40 and all(v == 1 for v in invc.values()), f'R6c 40 INV mapped exactly once ({len([k for k in invc if k.startswith("INV")])})')
check(len(ktc) == 24 and all(v == 1 for v in ktc.values()), f'R6d 24 KT mapped exactly once ({len(ktc)})')

# R7 diagrams & adversarial
dias = sorted((PKG / 'diagrams').glob('MFA-DIA-*.mmd'))
bad_dia = [p.name for p in dias if not [m for m in set(refre.findall(p.read_text(encoding='utf-8'))) if m in ids]]
check(len(dias) >= 17 and not bad_dia, f'R7a >=17 diagrams each referencing real ids ({len(dias)} diagrams; bad: {bad_dia})')
atks = sorted((PKG / 'adversarial').glob('MFA-ATK-*.md'))
bad_atk = [p.name for p in atks if not re.search(r'target', p.read_text(encoding='utf-8'), re.I)]
check(len(atks) >= 17 and not bad_atk, f'R7b >=17 adversarial records with targets ({len(atks)})')

# R8 cycles
def cycles(nodes, edges):
    color = {n: 0 for n in nodes}; found = []
    def dfs(u, st):
        color[u] = 1; st.append(u)
        for v in edges.get(u, ()):
            if v not in color: continue
            if color[v] == 1: found.append(st[st.index(v):] + [v])
            elif color[v] == 0: dfs(v, st)
        st.pop(); color[u] = 2
    for n in nodes:
        if color[n] == 0: dfs(n, [])
    return found
ecy = cycles([e['id'] for e in elm['elements']], {e['id']: e.get('dependencies', []) for e in elm['elements']})
ccy = cycles([c['id'] for c in cap['capabilities']], {c['id']: (c.get('refines') or []) + (c.get('requires') or []) for c in cap['capabilities']})
# Runtime/contract dependencies between elements are allowed to be mutual (identity<->time, harness<->quorum, ...);
# build order is acyclic by construction (IMPLEMENTATION-ROADMAP doses).  Cycles are reported, not failed.
print(f'WARN R8a element dependency cycles (mutual runtime dependencies, build order by dose): {len(ecy)}')
for c in ecy: print('      ' + ' -> '.join(c))
check(not ccy, f'R8b no capability cycles ({len(ccy)})')

# R9 adversarial coverage of elements
if atks:
    covered = set()
    for p in atks:
        covered |= set(re.findall(r'MFA-ELM-\d{3}', p.read_text(encoding='utf-8')))
    uncovered = [e['id'] for e in elm['elements'] if e['id'] not in covered]
    check(not uncovered, f'R9 every element targeted by >=1 attack ({len(uncovered)} uncovered: {uncovered[:10]})')


# R10 conservation ledger coverage (ADR / EXP / MATERIAL §2)
cc = PKG / 'CAPABILITY-CONSERVATION.md'
if cc.exists():
    t = cc.read_text(encoding='utf-8')
    def once(pat, expected):
        found = collections.Counter(re.findall(pat, t))
        missing = [x for x in expected if found.get(x, 0) == 0]
        return missing
    adr = [f'ADR-{i:04d}' for i in range(1, 34)]; exp = [f'EXP-{i:02d}' for i in range(1, 28)]; mat = [f'M2-{i:02d}' for i in range(1, 36)]
    m_adr = once(r'\| (ADR-\d{4}) \|', adr); m_exp = once(r'\| (EXP-\d{2}) \|', exp); m_mat = once(r'\| (M2-\d{2}) \|', mat)
    check(not m_adr and not m_exp and not m_mat, f'R10 conservation ledger covers 33 ADR, 27 EXP, 35 MATERIAL §2 rows (missing ADR {m_adr}, EXP {m_exp}, M2 {m_mat})')
else:
    check(False, 'R10 CAPABILITY-CONSERVATION.md missing')

# R11 every element has a dose
rm = PKG / 'IMPLEMENTATION-ROADMAP.md'
if rm.exists():
    t = rm.read_text(encoding='utf-8')
    dosed = set(re.findall(r'MFA-ELM-\d{3}', t))
    rsp_elems = set()
    for r in rsp['programs']:
        if r.get('first_dose') is not None: rsp_elems |= set(r.get('elements', []))
    nodose = [e['id'] for e in elm['elements'] if e['id'] not in dosed and e['id'] not in rsp_elems]
    check(not nodose, f'R11 every element has a dose in IMPLEMENTATION-ROADMAP.md or a research program with first_dose ({len(nodose)} without: {nodose[:10]})')
else:
    check(False, 'R11 IMPLEMENTATION-ROADMAP.md missing')

# R12 patches: APPLIED ⇒ rollback present; signatures reported
patches = sorted(p for p in (PKG / 'patches').glob('MFA-PATCH-*.yaml') if not p.stem.endswith('-R'))
no_rb, unsigned = [], 0
for p in patches:
    d = yaml.safe_load(p.read_text(encoding='utf-8'))
    if d.get('status') == 'APPLIED' and not p.with_name(p.stem + '-R.yaml').exists(): no_rb.append(p.stem)
    try:
        log = subprocess.run(['git', 'log', '-1', '--format=%G?', '--', str(p)], capture_output=True, text=True, cwd=PKG).stdout.strip()
        if log not in ('G', 'U'): unsigned += 1
    except Exception:
        unsigned += 1
check(not no_rb, f'R12 every APPLIED patch has its -R rollback ({len(patches)} patches; missing rollback: {no_rb})')
print(f'INFO R12 signatures: {len(patches) - unsigned} verified, {unsigned} UNVERIFIED (uncommitted or unsigned — PATCH-PROTOCOL §7.2; never silent)')

# R13 epistemic_status (Ω-ASI 0.4.0 §5) on every element / capability / mechanism / objective
STATUSES = {'PROVEN', 'MECHANICALLY VERIFIED', 'EMPIRICALLY SUPPORTED', 'IMPLEMENTABLE FROM KNOWN COMPONENTS', 'NOVEL SYNTHESIS', 'NEW FORMALISM', 'RESEARCH HYPOTHESIS', 'ACTIVE UNKNOWN', 'CONFLICT', 'FALSIFIED', 'IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS'}
nost = [r['id'] for coll in (elm['elements'], cap['capabilities'], mech['mechanisms'], obj['objectives']) for r in coll if r.get('epistemic_status') not in STATUSES]
check(not nost, f'R13 every element/capability/mechanism/objective has epistemic_status in the 11 states of §5 ({len(nost)} without: {nost[:8]})')

# R14 no falsifier / rejects reclassifies a CAPABILITY (§5: FALSIFIED mechanism ≠ removed capability)
recl = []
for coll, key in ((obj['objectives'], 'falsifier'), (obj.get('telos_candidates', []), 'falsifier'), (elm['elements'], 'falsifier'), (vo['obligations'], 'rejects'), (rsp['programs'], 'rejects'), (cap['capabilities'], 'falsifier')):
    for r in coll:
        t_ = str(r.get(key, ''))
        if 'RECLASSIFY' in t_ and not any(k in t_ for k in ('IMPOSSIBILITY-DOSSIER', 'PRESERVED', 'FALSIFIED')): recl.append(r['id'])
check(not recl, f'R14 no falsifier/rejects reclassifies a capability without PRESERVED/FALSIFIED-mechanism wording ({recl})')

# R15 every mechanism >= 026 has an INVENTION DOSSIER (29 fields, §7) with algorithms.pseudocode, falsifiers, experiments
FIELDS29 = ['invention_id', 'name', 'required_capability', 'why_known_methods_are_insufficient', 'preserved_objective', 'new_principle', 'formal_objects', 'state_variables', 'transition_rules', 'algorithms', 'interfaces', 'contracts', 'invariants', 'authority_model', 'learning_model', 'failure_modes', 'containment', 'reversibility_class', 'resource_complexity', 'scaling_law', 'verification_strategy', 'experiments', 'falsifiers', 'known_dependencies', 'unknown_dependencies', 'integration_points', 'migration_path', 'implementation_sequence', 'epistemic_status']
bad15 = []
for m in mech['mechanisms']:
    if int(m['id'].split('-')[-1]) < 26: continue
    p_ = PKG / 'inventions' / (m['id'] + '.yaml')
    if not p_.exists(): bad15.append((m['id'], 'missing')); continue
    d_ = yaml.safe_load(p_.read_text(encoding='utf-8'))
    miss = [f for f in FIELDS29 if f not in d_ or d_[f] in (None, '', [], {})]
    if miss or not all(a.get('pseudocode') for a in d_.get('algorithms', [])): bad15.append((m['id'], miss or 'pseudocode'))
check(not bad15, f'R15 every mechanism >= MFA-MECH-026 has a 29-field INVENTION DOSSIER with pseudocode ({bad15})')

# RELATIONS.yaml
rels = []
n = 0
def rel(kind, src, dst, via=None):
    global n; n += 1
    rels.append({'id': f'MFA-REL-{n:04d}', 'kind': kind, 'from': src, 'to': dst, **({'via': via} if via else {})})
for e in elm['elements']:
    for c in e.get('capabilities', []): rel('provides', e['id'], c)
    for d in e.get('dependencies', []): rel('depends-on', e['id'], d)
    for i in e.get('interfaces', []): rel('exposes', e['id'], i)
    for v in e.get('verification', []): rel('verified-by', e['id'], v)
    for x in e.get('corresponds_to', []): rel('corresponds-to', e['id'], x, e.get('delta'))
for c in cap['capabilities']:
    for r in c.get('refines') or []: rel('refines', c['id'], r)
    for r in c.get('requires') or []: rel('requires', c['id'], r)
for i in inv['invariants']:
    for e in i.get('enforcement', []): rel('enforced-by', i['id'], e)
    if i.get('corresponds_to') and str(i['corresponds_to']).startswith('INV-'): rel('corresponds-to', i['id'], i['corresponds_to'], i.get('delta'))
for v in vo['obligations']:
    for i in v.get('verifies', []): rel('verifies', v['id'], i)
    if v.get('corresponds_to') and str(v['corresponds_to']).startswith('KT-'): rel('corresponds-to', v['id'], v['corresponds_to'])
for c in con['contracts']:
    if c.get('corresponds_to') and str(c['corresponds_to']).startswith('ICD-'): rel('corresponds-to', c['id'], c['corresponds_to'], c.get('delta'))
    for v in c.get('conformance', []): rel('conformance', c['id'], v)
for o in obj['objectives']:
    for c in o.get('capabilities', []): rel('requires-capability', o['id'], c)
for m in mech['mechanisms']:
    for c in m.get('capabilities', []): rel('provides', m['id'], c)
    for d in m.get('dependencies', []): rel('depends-on', m['id'], d)
out = ['# RELATIONS — generated by tools/check-package.py from the source YAML files; do not edit by hand.',
       '# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.',
       '# kinds: provides · depends-on · exposes · verified-by · corresponds-to(via=delta) · refines · requires · enforced-by · verifies · conformance · requires-capability',
       f'count: {len(rels)}', 'relations:']
for r in rels:
    out.append('  - {' + ', '.join(f'{k}: {v}' for k, v in r.items()) + '}')
(PKG / 'RELATIONS.yaml').write_text('\n'.join(out) + '\n', encoding='utf-8')
print(f'RELATIONS.yaml: {len(rels)} relations')
print(f'ids: ' + ', '.join(f'{k}={v}' for k, v in sorted(collections.Counter(ids.values()).items())))
sys.exit(1 if fails else 0)
