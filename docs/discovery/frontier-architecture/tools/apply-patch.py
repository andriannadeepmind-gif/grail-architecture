#!/usr/bin/env python3
# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""Applies one patch of the package (PATCH-PROTOCOL.md §3–§4, §7).

  apply-patch.py patches/MFA-PATCH-nnnn.yaml [--dry-run]

Steps (§4): 1. base.file_hashes must equal the current SHA-256 of every file the patch touches;
2. preconditions hold; 3. the change is applied ONLY to the fields of the targets — every target record gets
version += 1 and a change_history entry; 4–5. MANIFEST/CHANGELOG/ledgers are the caller's job (build-manifest.py);
6. tools/check-package.py is the verification; 7. the patch is marked APPLIED and its rollback (-R) is written
next to it with the previous values, so the pair exists together (§3).

Change keys are either MFA ids (record edits in the seat file of the id's prefix) or file paths (file edits:
create / append / replace). Record changes are maps field -> value; the special key `_add: true` inserts a new
record after the last record of the same prefix; a value {__raw: text} is written verbatim (used by rollbacks).
Records are the one-line-per-field flow mappings of the seats ("- {<<: *d, id: ..., ...}"); the block-style
records of OBJECTIVE-SPACE.yaml ("- id: ..." + indented lines) are supported for MODIFY.
"""
import sys, re, hashlib, pathlib, datetime, yaml

PKG = pathlib.Path(__file__).resolve().parent.parent
SEAT = {'OBJ': 'OBJECTIVE-SPACE.yaml', 'TEL': 'OBJECTIVE-SPACE.yaml', 'CAP': 'CAPABILITY-LATTICE.yaml',
        'ELM': 'ARCHITECTURE-ELEMENTS.yaml', 'CON': 'CONTRACTS.yaml', 'INV': 'INVARIANTS.yaml',
        'VO': 'VERIFICATION-OBLIGATIONS.yaml', 'UNK': 'UNKNOWNS.yaml', 'CFL': 'CONFLICTS.yaml',
        'RSP': 'RESEARCH-PROGRAMS.yaml', 'MECH': 'INVENTIONS.yaml'}
TODAY = datetime.date.today().isoformat()

def sha(p): return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()

# ---------- value serialisation (flow style, matching the seats) ----------
BARE = re.compile(r'^[A-Za-z][A-Za-z0-9_./-]*$')
def ser(v):
    if isinstance(v, dict) and '__raw' in v: return v['__raw']
    if v is None: return 'null'
    if v is True: return 'true'
    if v is False: return 'false'
    if isinstance(v, (int, float)): return str(v)
    if isinstance(v, str):
        if BARE.match(v) and v not in ('null', 'true', 'false', 'yes', 'no', 'on', 'off'): return v
        return '"' + v.replace('\\', '\\\\').replace('"', '\\"') + '"'
    if isinstance(v, list): return '[' + ', '.join(ser(x) for x in v) + ']'
    if isinstance(v, dict): return '{' + ', '.join(f'{k}: {ser(x)}' for k, x in v.items()) + '}'
    raise TypeError(type(v))

# ---------- flow record handling ----------
def split_top(s):
    """split flow-mapping interior at top-level commas (outside quotes/brackets)"""
    segs, depth, q, cur, i = [], 0, None, '', 0
    while i < len(s):
        c = s[i]
        if q:
            cur += c
            if c == '\\' and q == '"' and i + 1 < len(s): cur += s[i + 1]; i += 1
            elif c == q: q = None
        elif c in '"\'': q = c; cur += c
        elif c in '{[': depth += 1; cur += c
        elif c in '}]': depth -= 1; cur += c
        elif c == ',' and depth == 0: segs.append(cur); cur = ''
        else: cur += c
        i += 1
    segs.append(cur)
    return segs

def find_flow(lines, rid):
    for i, l in enumerate(lines):
        if re.match(r'\s*-\s*\{<<: \*\w+, id: ' + re.escape(rid) + r'\b', l):
            depth, j = 0, i
            while True:
                depth += lines[j].count('{') - lines[j].count('}')
                if depth <= 0: break
                j += 1
            return i, j
    return None

def find_block(lines, rid):
    for i, l in enumerate(lines):
        if re.match(r'\s*-\s*id:\s*' + re.escape(rid) + r'\s*$', l):
            j = i + 1
            while j < len(lines) and (lines[j].startswith('    ') or lines[j].strip() == ''):
                j += 1
            while lines[j - 1].strip() == '': j -= 1
            return i, j - 1
    return None

def seg_key(seg):
    return seg.strip().split(':', 1)[0].strip()

def modify_flow(text, change, patch_id, op, summary):
    prefix_end = text.index('{')
    prefix, body = text[:prefix_end], text[prefix_end:]
    assert body.rstrip().endswith('}')
    inner = body.rstrip()[1:-1]
    segs = split_top(inner)
    old = {}
    def set_field(key, val):
        for k, s in enumerate(segs):
            if seg_key(s) == key:
                lead = s[:len(s) - len(s.lstrip())]
                old[key] = {'__raw': s.strip().split(':', 1)[1].strip()}
                segs[k] = lead + f'{key}: {ser(val)}'
                return
        old[key] = None
        segs.append(f'\n     {key}: {ser(val)}')
    for key, val in change.items():
        if key.startswith('_'): continue
        set_field(key, val)
    # version and change_history
    ver = None
    for s in segs:
        if seg_key(s) == 'version': ver = int(s.split(':', 1)[1])
    set_field('version', (ver or 1) + 1)
    entry = ser({'patch': patch_id, 'op': op, 'date': TODAY, 'summary': summary})
    ch = None
    for k, s in enumerate(segs):
        if seg_key(s) == 'change_history':
            v = s.strip().split(':', 1)[1].strip()
            lead = s[:len(s) - len(s.lstrip())]
            segs[k] = lead + 'change_history: ' + v.rstrip()[:-1].rstrip() + ', ' + entry + ']'
            ch = True
    if not ch:
        segs.append('\n     change_history: [{patch: MFA-PATCH-0000, op: ADD, date: 2026-09-16, summary: "αρχική δημιουργία"}, ' + entry + ']')
    old.pop('version', None); old.pop('change_history', None)
    return prefix + '{' + ','.join(segs) + '}', old

def modify_block(lines, i, j, change, patch_id, op, summary):
    old = {}
    block = lines[i:j + 1]
    def set_line(key, val):
        for k, l in enumerate(block):
            m = re.match(r'^(\s{4})' + re.escape(key) + r':\s*(.*)$', l)
            if m and not l.startswith('     '):
                old[key] = {'__raw': m.group(2)}
                block[k] = f'    {key}: {ser(val)}'
                return
        old[key] = None
        block.append(f'    {key}: {ser(val)}')
    for key, val in change.items():
        if key.startswith('_'): continue
        set_line(key, val)
    ver = None
    for l in block:
        m = re.match(r'^\s{4}version:\s*(\d+)', l)
        if m: ver = int(m.group(1))
    set_line('version', (ver or 1) + 1)
    entry = ser({'patch': patch_id, 'op': op, 'date': TODAY, 'summary': summary})
    for k, l in enumerate(block):
        m = re.match(r'^\s{4}change_history:\s*(\[.*\])\s*$', l)
        if m:
            block[k] = '    change_history: ' + m.group(1).rstrip()[:-1] + ', ' + entry + ']'
            break
    else:
        block.append('    change_history: [{patch: MFA-PATCH-0000, op: ADD, date: 2026-09-16, summary: "αρχική δημιουργία του πακέτου"}, ' + entry + ']')
    old.pop('version', None); old.pop('change_history', None)
    return block, old

def add_flow(lines, rid, fields, patch_id, summary):
    prefix = rid.split('-')[1]
    last = None
    for i, l in enumerate(lines):
        if re.match(r'\s*-\s*\{<<: \*\w+, id: MFA-' + prefix + r'-', l): last = i
    if last is None: raise SystemExit(f'no record with prefix {prefix} to append after')
    _, end = find_flow(lines, re.search(r'id: (MFA-[A-Z]+-[A-Za-z0-9]+)', lines[last]).group(1))
    items = [('id', rid)] + [(k, v) for k, v in fields.items() if not k.startswith('_') and k != 'id']
    items.append(('version', 1))
    items.append(('change_history', [{'patch': patch_id, 'op': 'ADD', 'date': TODAY, 'summary': summary}]))
    parts, out, n = [], ['  - {<<: *d'], 0
    for k, v in items:
        out.append(f'{k}: {ser(v)}')
    # wrap: id line, then ~3 fields per line
    text, cur, cnt = out[0] + ', ' + out[1], '', 0
    for piece in out[2:]:
        if cnt == 3: text += ',\n     ' + piece; cnt = 1
        else: text += ', ' + piece; cnt += 1
    text += '}'
    return end, text

# ---------- file ops ----------
def file_op(path, spec, dry):
    p = PKG / path
    inverse = {}
    if 'create' in spec:
        if p.exists(): raise SystemExit(f'{path} exists; create refused')
        inverse['append'] = f'\n\n<!-- WITHDRAWN by rollback: this file was created by a patch that has been rolled back; kept append-only (PATCH-PROTOCOL §4.7) -->\n'
        if not dry: p.parent.mkdir(parents=True, exist_ok=True); p.write_text(spec['create'], encoding='utf-8')
    if 'append' in spec:
        inverse['replace'] = [[spec['append'], '']]
        if not dry: p.write_text(p.read_text(encoding='utf-8') + spec['append'], encoding='utf-8')
    if 'replace' in spec:
        t = p.read_text(encoding='utf-8')
        inv = []
        for old, new in spec['replace']:
            if t.count(old) != 1: raise SystemExit(f'{path}: replace target occurs {t.count(old)} times (must be 1): {old[:80]!r}')
            t = t.replace(old, new); inv.append([new, old])
        inverse['replace'] = inverse.get('replace', []) + inv[::-1]
        if not dry: p.write_text(t, encoding='utf-8')
    return inverse

# ---------- main ----------
def apply(patch_path, dry=False):
    patch = yaml.safe_load(pathlib.Path(patch_path).read_text(encoding='utf-8'))
    pid, op = patch['id'], patch['operation']
    if patch.get('status') == 'APPLIED': raise SystemExit(f'{pid} already APPLIED')
    # 1. base hashes
    for f, h in (patch.get('base', {}).get('file_hashes') or {}).items():
        if (PKG / f).exists() and sha(PKG / f) != h:
            raise SystemExit(f'{pid}: base hash mismatch for {f} — rewrite the patch on the new base (PATCH-PROTOCOL §4.1)')
    # 2. preconditions ("MFA-X.field == VALUE")
    for pre in patch.get('preconditions') or []:
        m = re.match(r'^(MFA-[A-Z]+-[A-Za-z0-9]+)\.(\w+)\s*==\s*(.+)$', pre)
        if not m: continue
        rid, field, want = m.groups()
        f = PKG / SEAT[rid.split('-')[1]]
        lines = f.read_text(encoding='utf-8').split('\n')
        loc = find_flow(lines, rid) or find_block(lines, rid)
        if loc is None: raise SystemExit(f'{pid}: precondition target {rid} not found')
        text = '\n'.join(lines[loc[0]:loc[1] + 1])
        m2 = re.search(r'\b' + field + r':\s*("([^"]*)"|\S+)', text)
        have = (m2.group(2) if m2 and m2.group(2) is not None else (m2.group(1) if m2 else 'PROPOSED')).strip(',}')
        if have != want.strip(): raise SystemExit(f'{pid}: precondition failed: {pre} (have {have})')
    # 3. changes
    inverse_change = {}
    summary = patch.get('title', '')
    touched = set()
    for key, spec in patch['change'].items():
        if '.' in key or '/' in key:  # file op
            inverse_change[key] = file_op(key, spec, dry); touched.add(key); continue
        rid = key
        seat = SEAT[rid.split('-')[1]]
        f = PKG / seat
        lines = f.read_text(encoding='utf-8').split('\n')
        if spec.get('_add'):
            if find_flow(lines, rid): raise SystemExit(f'{pid}: {rid} already exists')
            end, text = add_flow(lines, rid, spec, pid, summary)
            lines[end + 1:end + 1] = text.split('\n')
            inverse_change[rid] = {'status': 'WITHDRAWN', '_note': 'rollback of ADD keeps the record (append-only) and withdraws it'}
        else:
            loc = find_flow(lines, rid)
            if loc:
                i, j = loc
                new, old = modify_flow('\n'.join(lines[i:j + 1]), spec, pid, op, summary)
                lines[i:j + 1] = new.split('\n')
            else:
                loc = find_block(lines, rid)
                if not loc: raise SystemExit(f'{pid}: {rid} not found in {seat}')
                i, j = loc
                block, old = modify_block(lines, i, j, spec, pid, op, summary)
                lines[i:j + 1] = block
            inverse_change[rid] = {k: (v if v is not None else {'__raw': 'null'}) for k, v in old.items()}
        touched.add(seat)
        if not dry: f.write_text('\n'.join(lines), encoding='utf-8')
    # 7. rollback + status
    rb = {'id': pid + '-R', 'title': 'Rollback of ' + pid + ': ' + patch.get('title', ''), 'operation': 'RESTORE',
          'targets': patch.get('targets'), 'base': {'package_version': patch.get('base', {}).get('package_version'),
          'file_hashes': {f: (sha(PKG / f) if (PKG / f).exists() else None) for f in sorted(touched)} if not dry else {}},
          'preconditions': [f'{pid}.status == APPLIED'], 'change': inverse_change,
          'rationale': f'Αντίστροφο του {pid}, γραμμένο μαζί (PATCH-PROTOCOL §3)· επαναφέρει τις προηγούμενες τιμές των πεδίων· οι ADD εγγραφές μένουν με status WITHDRAWN (append-only).',
          'evidence': ['καμία — μηχανική αντιστροφή'], 'affected_dependencies': patch.get('affected_dependencies', []),
          'capability_impact': {'gained': patch.get('capability_impact', {}).get('at_risk', []), 'at_risk': patch.get('capability_impact', {}).get('gained', []),
                                'ledger_entry': patch.get('capability_impact', {}).get('ledger_entry')},
          'migration': 'ό,τι αναφέρεται στα νέα πεδία επιστρέφει στα παλιά· νέα IDs μένουν WITHDRAWN', 'verification': 'tools/check-package.py',
          'rollback': pid, 'author': patch.get('author'), 'status': 'PROPOSED'}
    if not dry:
        rbp = pathlib.Path(patch_path).with_name(pid + '-R.yaml')
        rbp.write_text('# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.\n' + yaml.safe_dump(rb, allow_unicode=True, sort_keys=False, width=160), encoding='utf-8')
        patch['status'] = 'APPLIED'; patch['applied_on'] = TODAY
        pathlib.Path(patch_path).write_text('# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.\n' + yaml.safe_dump(patch, allow_unicode=True, sort_keys=False, width=160), encoding='utf-8')
    print(f'{pid}: {"dry-run ok" if dry else "APPLIED"} — {len(patch["change"])} targets, files: {sorted(touched)}')

if __name__ == '__main__':
    apply(sys.argv[1], dry='--dry-run' in sys.argv)
