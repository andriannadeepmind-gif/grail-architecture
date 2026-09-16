# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""model.py — TES.load(package) -> Model  (MFA-MECH-043, transition rule LOAD).

The Model is the canonical package M = <ELM, CON, INV, CAP, OBJ, TEL, VO, UNK, CFL, RSP, MECH> loaded
from the YAML seats, plus the derived graphs the interpreter needs:
  * element dependency graph        (field `dependencies`)
  * contract -> provider element    (field `provider`, first MFA-ELM id in the string)
  * capability -> provider elements (elements whose `capabilities` list contains the capability)
  * contract -> operation names     (parsed from the contract `statement`)
Nothing here mutates the seats.
"""
from __future__ import annotations

import functools
import hashlib
import json
import pathlib
import re

import yaml

SEATS = (
    ("elements", "ARCHITECTURE-ELEMENTS.yaml", "elements"),
    ("contracts", "CONTRACTS.yaml", "contracts"),
    ("invariants", "INVARIANTS.yaml", "invariants"),
    ("capabilities", "CAPABILITY-LATTICE.yaml", "capabilities"),
    ("objectives", "OBJECTIVE-SPACE.yaml", "objectives"),
    ("telos", "OBJECTIVE-SPACE.yaml", "telos_candidates"),
    ("obligations", "VERIFICATION-OBLIGATIONS.yaml", "obligations"),
    ("unknowns", "UNKNOWNS.yaml", "unknowns"),
    ("conflicts", "CONFLICTS.yaml", "conflicts"),
    ("programs", "RESEARCH-PROGRAMS.yaml", "programs"),
    ("mechanisms", "INVENTIONS.yaml", "mechanisms"),
)
SEAT_KINDS = ("OBJ", "TEL", "CAP", "ELM", "CON", "INV", "VO", "UNK", "CFL", "RSP", "MECH")
PROSE_KINDS = ("ALT", "ATK", "DIA", "PATCH", "DEC", "DEP")

# Reversible-Effect-Transaction classes (MFA-CON-034 / MFA-ELM-010).  None = genesis-plane event.
RET_CLASSES = ("REVERSIBLE", "COMPENSABLE", "DISCLOSE", "IRREVERSIBLE_PREAUTHORIZED", "IRREVERSIBLE")
ESCROW_CLASSES = ("IRREVERSIBLE", "IRREVERSIBLE_PREAUTHORIZED")

_IDENT = r"[A-Za-z_][A-Za-z0-9_]*"
_CALL = re.compile(r"(?<![A-Za-z0-9_])(?:%s\.)?(%s)\(" % (_IDENT, _IDENT))
_BARE_EXACT = re.compile(r"^(?:%s\.)?(%s)$" % (_IDENT, _IDENT))
_BARE_LEAD = re.compile(r"^(?:%s\.)?(%s)\s+(?:[^\x00-\x7F]|\()" % (_IDENT, _IDENT))
_ELM = re.compile(r"MFA-ELM-\d{3}")


def _json_default(o):
    return str(o)


def canonical(obj) -> str:
    """Deterministic JSON: sorted keys, ASCII, no whitespace (the twin's only serialisation)."""
    return json.dumps(obj, sort_keys=True, ensure_ascii=True, separators=(",", ":"), default=_json_default)


def sha256(obj) -> str:
    return hashlib.sha256(canonical(obj).encode("ascii")).hexdigest()


def parse_ops(statement: str) -> tuple:
    """Operation names of a contract, parsed from its prose `statement`.

    Rules (F1 heuristic; an explicit `operations` field is the F2 fix):
      * sentences are split on '·' / '‖'; parts on '/' and ' + ';
      * only the head of a part (before '→') is inspected;
      * `name(` call forms count (an optional `Prefix.` is dropped);
      * a bare identifier counts if it is the whole head, or — in a multi-part sentence — is followed by a
        non-Latin word or a parenthesis (e.g. 'Subscribe ΚΡΑΤΟΥΝΤΑΙ', 'RegisterContract (17 πεδία');
      * fallback for pure prose statements: comma-separated identifiers.
    """
    ops = []

    def add(name):
        if name not in ops:
            ops.append(name)

    for sentence in re.split(r"[·‖]", statement or ""):
        parts = re.split(r"/| \+ ", sentence)
        multi = len(parts) > 1
        for part in parts:
            head = part.split("→", 1)[0].strip().rstrip(".").strip()
            if not head:
                continue
            calls = _CALL.findall(head)
            for name in calls:
                add(name)
            if calls:
                continue
            m = _BARE_EXACT.match(head) or (multi and _BARE_LEAD.match(head))
            if m:
                add(m.group(1))
    if not ops:
        for piece in re.split(r",", statement or ""):
            m = re.match(r"^\s*(%s)\s*(?:$|\()" % _IDENT, piece.strip())
            if m:
                add(m.group(1))
    return tuple(ops)


class Model:
    """The loaded package.  Every seat is a dict keyed by id; derived maps are built once."""

    def __init__(self, pkg_path):
        self.path = pathlib.Path(pkg_path).resolve()
        self.raw = {}
        self.seats = {}
        for attr, fname, key in SEATS:
            if fname not in self.raw:
                self.raw[fname] = yaml.safe_load((self.path / fname).read_text(encoding="utf-8"))
            items = self.raw[fname].get(key) or []
            self.seats[attr] = {it["id"]: it for it in items if isinstance(it, dict) and "id" in it}
        # objective contradictions carry MFA-CFL ids that CONFLICTS.yaml supersets; register the missing ones
        for it in self.raw["OBJECTIVE-SPACE.yaml"].get("objective_contradictions") or []:
            self.seats["conflicts"].setdefault(it["id"], it)
        self.elements = self.seats["elements"]
        self.contracts = self.seats["contracts"]
        self.invariants = self.seats["invariants"]
        self.capabilities = self.seats["capabilities"]
        self.objectives = self.seats["objectives"]
        self.telos = self.seats["telos"]
        self.obligations = self.seats["obligations"]
        self.unknowns = self.seats["unknowns"]
        self.conflicts = self.seats["conflicts"]
        self.programs = self.seats["programs"]
        self.mechanisms = self.seats["mechanisms"]
        self.ids = set()
        for d in self.seats.values():
            self.ids.update(d)
        # derived graphs
        self.deps = {e: tuple(x for x in (rec.get("dependencies") or []) if isinstance(x, str))
                     for e, rec in self.elements.items()}
        self.contract_provider = {}
        self.contract_providers_all = {}
        for c, rec in self.contracts.items():
            found = _ELM.findall(str(rec.get("provider") or ""))
            self.contract_provider[c] = found[0] if found else None
            self.contract_providers_all[c] = tuple(found)
        self.cap_providers = {c: [] for c in self.capabilities}
        for e, rec in self.elements.items():
            for c in rec.get("capabilities") or []:
                self.cap_providers.setdefault(c, []).append(e)
        self.contract_ops = {c: parse_ops(rec.get("statement") or "") for c, rec in self.contracts.items()}
        self.element_contracts = {}
        for c, e in self.contract_provider.items():
            if e:
                self.element_contracts.setdefault(e, []).append(c)
        self.telos_hash = self._telos_hash()
        self.constitution_hash = self._constitution_hash()

    # ---- accessors -------------------------------------------------------------------------------
    def contract(self, cid):
        return self.contracts.get(cid)

    def provider_of(self, cid):
        return self.contract_provider.get(cid)

    def ops_of(self, cid):
        return self.contract_ops.get(cid, ())

    def contracts_of(self, elm):
        return tuple(self.element_contracts.get(elm, ()))

    def contracts_without_ops(self):
        return sorted(c for c, ops in self.contract_ops.items() if not ops)

    def tier0_invariants(self):
        return sorted(i for i, rec in self.invariants.items() if rec.get("tier") == 0)

    def counts(self):
        return {attr: len(d) for attr, d in self.seats.items()}

    # ---- hashes that the twin treats as constants of the cut -------------------------------------
    def _telos_hash(self):
        rec = None
        for t in self.telos.values():
            if t.get("status") == "RECOMMENDED":
                rec = t
        if rec is None and self.telos:
            rec = self.telos[sorted(self.telos)[-1]]
        if rec is None:
            return sha256({"telos": None})
        return sha256({"id": rec["id"], "statement": rec.get("statement"), "includes": rec.get("includes")})

    def _constitution_hash(self):
        return sha256([(i, self.invariants[i].get("statement")) for i in self.tier0_invariants()])

    # ---- R1: references ----------------------------------------------------------------------------
    def check_references(self):
        """Dangling MFA-* ids referenced by the seat YAML files.

        Seat kinds resolve against the loaded ids; prose-defined kinds (ALT/ATK/DIA/PATCH from their
        directories, DEC/DEP from DECISION-LOG.md / TECHNICAL-ARCHITECTURE.md) resolve against those
        sources when present and are otherwise ignored (they live only in prose).
        """
        known = set(self.ids)
        for sub, pat in (("alternatives", "MFA-ALT-*.md"), ("adversarial", "MFA-ATK-*.md"),
                         ("diagrams", "MFA-DIA-*.mmd"), ("patches", "MFA-PATCH-*.yaml")):
            d = self.path / sub
            if d.is_dir():
                known.update(p.stem for p in d.glob(pat))
        known.add("MFA-PATCH-0000")
        prose_available = set()
        for fname, pat in (("DECISION-LOG.md", r"MFA-DEC-\d{3}"), ("TECHNICAL-ARCHITECTURE.md", r"MFA-DEP-\d")):
            p = self.path / fname
            if p.exists():
                prose_available.update(re.findall(pat, p.read_text(encoding="utf-8")))
        known.update(prose_available)
        refre = re.compile(r"MFA-(%s)-\d+(?:-R)?" % "|".join(SEAT_KINDS + PROSE_KINDS))
        dangling = set()
        for fname in sorted({f for _, f, _ in SEATS}):
            text = (self.path / fname).read_text(encoding="utf-8")
            for m in refre.finditer(text):
                ref = m.group(0)
                base = ref[:-2] if ref.endswith("-R") else ref
                kind = m.group(1)
                if base in known:
                    continue
                if kind in ("DEC", "DEP") and not prose_available:
                    continue  # defined only in prose that is not present
                dangling.add(base)
        return sorted(dangling)


@functools.lru_cache(maxsize=4)
def _load_cached(path_str):
    return Model(path_str)


def load(pkg_path) -> Model:
    """TES.load(package) -> Model.  Cached per resolved path (the seats are read-only for the twin)."""
    return _load_cached(str(pathlib.Path(pkg_path).resolve()))
