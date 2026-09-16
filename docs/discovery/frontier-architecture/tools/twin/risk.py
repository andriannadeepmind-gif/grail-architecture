# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.
"""risk.py — TES_Propagate: epistemic risk over the element dependency graph (MFA-MECH-043).

base(e)   = RISK[epistemic_status(e)]                      (missing status -> 0.8, declared)
G         = dependency graph (e depends on d  ==>  risk flows d -> e)
C         = SCC condensation (mutual dependencies collapse to one node, risk = max of members)
risk(n)   = max(base(n), DECAY * max(risk(p) for p in dependencies(n)))   in topological order
cap.risk  = min over providers (redundancy: the best provider bounds the capability's risk)
"""
from __future__ import annotations

import yaml

RISK = {
    "PROVEN": 0.0,
    "MECHANICALLY VERIFIED": 0.05,
    "EMPIRICALLY SUPPORTED": 0.2,
    "IMPLEMENTABLE FROM KNOWN COMPONENTS": 0.3,
    "NOVEL SYNTHESIS": 0.45,
    "NEW FORMALISM": 0.5,
    "RESEARCH HYPOTHESIS": 0.6,
    "ACTIVE UNKNOWN": 0.8,
    "CONFLICT": 0.7,
    "FALSIFIED": 1.0,
    "IMPOSSIBLE UNDER EXPLICIT ASSUMPTIONS": 1.0,
}
MISSING_RISK = 0.8
DECAY = 0.9


def base_risk(status):
    if isinstance(status, dict):
        status = status.get("overall")
    if not isinstance(status, str):
        return MISSING_RISK, "missing"
    key = " ".join(status.upper().split())
    if key in RISK:
        return RISK[key], key
    return MISSING_RISK, "unrecognised:%s" % status


def tarjan_scc(nodes, edges):
    """Iterative Tarjan; edges: node -> iterable of successor nodes.  Returns list of SCCs (each a sorted list)."""
    index = {}
    low = {}
    on_stack = set()
    stack = []
    sccs = []
    counter = [0]
    for root in nodes:
        if root in index:
            continue
        work = [(root, iter(edges.get(root, ())))]
        index[root] = low[root] = counter[0]
        counter[0] += 1
        stack.append(root)
        on_stack.add(root)
        while work:
            v, it = work[-1]
            advanced = False
            for w in it:
                if w not in index:
                    index[w] = low[w] = counter[0]
                    counter[0] += 1
                    stack.append(w)
                    on_stack.add(w)
                    work.append((w, iter(edges.get(w, ()))))
                    advanced = True
                    break
                if w in on_stack:
                    low[v] = min(low[v], index[w])
            if advanced:
                continue
            work.pop()
            if work:
                u = work[-1][0]
                low[u] = min(low[u], low[v])
            if low[v] == index[v]:
                comp = []
                while True:
                    w = stack.pop()
                    on_stack.discard(w)
                    comp.append(w)
                    if w == v:
                        break
                sccs.append(sorted(comp))
    return sccs


def propagate(model, decay=DECAY):
    nodes = sorted(model.elements)
    edges = {e: tuple(d for d in model.deps.get(e, ()) if d in model.elements) for e in nodes}
    base = {}
    status_key = {}
    for e in nodes:
        base[e], status_key[e] = base_risk(model.elements[e].get("epistemic_status"))
    sccs = tarjan_scc(nodes, edges)
    comp_of = {}
    for i, comp in enumerate(sccs):
        for e in comp:
            comp_of[e] = i
    comp_base = [max(base[e] for e in comp) for comp in sccs]
    comp_deps = [set() for _ in sccs]
    for e in nodes:
        for d in edges[e]:
            if comp_of[d] != comp_of[e]:
                comp_deps[comp_of[e]].add(comp_of[d])
    # topological order of the condensation (dependencies first); Kahn on the DAG
    indeg = [len(s) for s in comp_deps]
    dependents = [set() for _ in sccs]
    for i, s in enumerate(comp_deps):
        for j in s:
            dependents[j].add(i)
    ready = sorted(i for i, d in enumerate(indeg) if d == 0)
    order = []
    while ready:
        i = ready.pop(0)
        order.append(i)
        for j in sorted(dependents[i]):
            indeg[j] -= 1
            if indeg[j] == 0:
                ready.append(j)
        ready.sort()
    if len(order) != len(sccs):
        raise RuntimeError("condensation is not acyclic (Tarjan invariant broken)")
    comp_risk = [0.0] * len(sccs)
    for i in order:
        inherited = max((comp_risk[j] for j in comp_deps[i]), default=0.0) * decay
        comp_risk[i] = round(max(comp_base[i], inherited), 6)
    elements = {}
    for e in nodes:
        i = comp_of[e]
        elements[e] = {"base": base[e], "risk": comp_risk[i], "epistemic_status": status_key[e],
                       "scc": i, "scc_size": len(sccs[i]), "dependencies": list(edges[e])}
    capabilities = {}
    for cap in sorted(model.capabilities):
        provs = sorted(model.cap_providers.get(cap, []))
        if provs:
            best = min(provs, key=lambda p: (elements[p]["risk"], p))
            capabilities[cap] = {"risk": elements[best]["risk"], "providers": provs, "min_provider": best,
                                 "max_provider_risk": max(elements[p]["risk"] for p in provs)}
        else:
            capabilities[cap] = {"risk": 1.0, "providers": [], "min_provider": None, "note": "no provider (declared)"}
    summary = {
        "elements": len(elements),
        "capabilities": len(capabilities),
        "sccs": len(sccs),
        "nontrivial_sccs": sum(1 for c in sccs if len(c) > 1),
        "element_risk_max": max(v["risk"] for v in elements.values()),
        "element_risk_min": min(v["risk"] for v in elements.values()),
        "capability_risk_max": max(v["risk"] for v in capabilities.values()),
        "capability_risk_min": min(v["risk"] for v in capabilities.values()),
        "unrecognised_status": sorted(e for e in nodes if not status_key[e] in RISK),
    }
    return {"policy": {"decay": decay, "aggregation": "max-path over dependencies; min over redundant providers",
                       "risk_table": dict(RISK), "missing_status_risk": MISSING_RISK},
            "elements": elements, "capabilities": capabilities, "summary": summary}


def write_yaml(risk_map, path):
    header = "# Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.\n# risk map generated by tools/twin/risk.py (TES_Propagate) — derived, not a seat\n"
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(header)
        yaml.safe_dump(risk_map, fh, allow_unicode=True, sort_keys=False)
    return path
