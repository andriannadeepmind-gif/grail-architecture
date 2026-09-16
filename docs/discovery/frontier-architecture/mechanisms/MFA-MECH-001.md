# MFA-MECH-001 — Commitment Calculus (CC): το κανονικό σημασιολογικό υπόστρωμα

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-001 |
| **2. Όνομα** | Commitment Calculus — άλγεβρα υπογεγραμμένων τυποποιημένων δεσμεύσεων |
| **3. Ικανότητα** | MFA-CAP-003 (υπόστρωμα)· στηρίζει 004, 007, 008, 039, 040, 050, 051, 055 |
| **4. Πρόβλημα που οι υπάρχοντες μηχανισμοί δεν λύνουν** | Το corpus έχει ledger (KRN-01), σύστημα τύπων (LinkML/JSON Schema), αποδείξεις (Lean/TLA+), εξουσία (Cedar/tokens) και σχέδιο (SysML) ως **πέντε χωριστές έδρες** που συνδέονται με (URI, hash) — DEC-X-06 το ονομάζει «μωσαϊκό». Κάθε invariant ζει σε 2–3 έδρες. Το SysON κόβει σιωπηλά στην εισαγωγή. Κανένα σύστημα (Rekor/Sigstore = ledger χωρίς τύπους· Lean = τύποι χωρίς εξουσία· Cedar = εξουσία χωρίς αποδείξεις) δεν ενώνει τα πέντε. |
| **5. Πρώτη αρχή** | Μία δέσμευση φέρει ταυτόχρονα τι λέγεται (τύπος+φορτίο), ποιος το λέει (εξουσία), πότε ισχύει (διτεμπορικό), γιατί (τεκμήριο ή τυποποιημένη απουσία) και από πού (γενεαλογία). Οι κλειστότητες που θέλουμε ως invariants είναι θεωρήματα των κανόνων παραγωγής, όχι έλεγχοι. |
| **6. Εσωτερική οντολογία** | `Commitment⟨τ,ρ,α,[t_v,t_k],ε,λ,σ⟩`· `Type` (ανοιχτή απαρίθμηση με σχήμα εισαγωγής)· `Authority` (αλυσίδα tokens, `ceiling`, `depth`, `scope`, lease)· `Evidence ∈ {Proof(v,π,grade), Unknown(reason,plan,VOI), Both(π₁,π₂,collapse), Receipt(r)}`· `Lineage` (σύνολο CIDs + rule id)· `Store` (persistent διτεμπορικό υπεργράφημα, MFA-ALT-5)· `Rule ∈ {ASSERT, OBSERVE, DERIVE, DELEGATE, CONTEST, RESOLVE, REVOKE, FORGET}`· `Schema` (δεσμεύσεις που ορίζουν τύπους/κανόνες· επίπεδο 3 μόνο με κλειδί δημιουργού) |
| **7. Μεταβλητές κατάστασης** | Το store `S` (σύνολο δεσμεύσεων + δείκτες ανά τύπο/κλειδί/χρόνο)· `epoch` (allowlist αλγορίθμων)· `heads` ανά journal (ένας συγγραφέας ανά journal)· `nogoods` (ATMS περιβάλλοντα από CONTEST) |
| **8. Είσοδοι/έξοδοι** | Είσοδος: αιτήσεις εφαρμογής κανόνα `(rule, args, σ)`· Έξοδος: νέα δέσμευση με CID + receipt, ή τυποποιημένη άρνηση `{ERR_UNAUTHORIZED_CAPABILITY, ERR_INTEGRITY, ERR_INVALID}` — ποτέ σιωπή· ερωτήματα: `at(cut)`, `lineage(cid)`, `closure(key_lineage)`, `unknowns(filter)`, `conflicts()` |
| **9. Αλγόριθμοι / κανόνες μετάβασης** | Οι 8 κανόνες του `alternatives/MFA-ALT-1.md` §1. Εφαρμογή = (1) έλεγχος προϋπόθεσης στον ΤΥΠΟ (όχι σε όνομα), (2) υπολογισμός CID φορτίου (JCS+multihash), (3) έλεγχος `ceiling`/`scope`/lease, (4) έλεγχος allowlist(epoch) υπογραφής, (5) append στο journal του υπογράφοντος με HLC, (6) Merkle inclusion + witness cosign (async), (7) ενημέρωση δεικτών. Fold: `state = foldl(apply, genesis, journal_prefix)` ντετερμινιστικό. |
| **10. Διεπαφές/συμβόλαια** | `CC.apply(rule,args)→cid∣err` · `CC.read(query,cut)` · `CC.subscribe(type,from)` · `CC.prove(cid)→InclusionProof` · `CC.replay(prefix)→state_hash`· κάθε όργανο δηλώνει `produces: [types]`, `consumes: [types]`, `verifier_grade` (MFA-CON-*) |
| **11. Εξαρτήσεις** | MFA-ALT-5 δομή (persistent bitemporal hypergraph)· KRN-01/02/03/07 ως υλοποιητές (ledger, CAS, keys, time)· allowlist (MFA-CAP-037) |
| **12. Υπολογιστικό/πόροι** | Append O(log n) (Merkle)· read at cut O(log n + k)· closure O(k)· φορτίο σε CAS (S3-class), δείκτες σε PostgreSQL (παράγωγοι, rebuildable)· υπογραφές batched ανά journal |
| **13. Κλιμάκωση** | Γραμμική στον αριθμό δεσμεύσεων· journals ανά οντότητα/θεσμό ⇒ οριζόντια· cross-journal διάταξη μόνο για Verdicts (BFT, ADR-0031) |
| **14. Τρόποι αποτυχίας** | Δίσκος: Merkle+replicas· equivocation: witness gossip → πάγωμα journal + Court· απώλεια δεικτών: rebuild από journal· σπάσιμο αλγορίθμου: epoch re-anchor (KT-09) |
| **15. Αντιπαλικοί τρόποι αποτυχίας** | Πλαστή εξουσία → υπογραφή εκτός αλυσίδας απορρίπτεται στον τύπο· «laundering» δέσμευσης από άλλο trust domain → απαιτεί ρητή εισαγωγή με receipt (MFA-CAP-056)· εξάντληση με σκουπίδια → budgets ανά κλειδί (MFA-CAP-032)· payload με `#.(…)` → ποτέ eval στην ανάγνωση (CLAIMS F87) |
| **16. Μέθοδος επαλήθευσης** | Lean 4: θεώρημα κλειστότητας (4 ιδιότητες) με `#print axioms`· TLA+: journal protocol (refinement, machine closure, level-correctness — CLAIMS F84)· DST: replay 10⁶· mutation: σφραγισμένο σύνολο αντιφατικών εισόδων (VT-504) |
| **17. Σχέδιο πρωτοτύπου** | F1: Lean 4 spec των 8 κανόνων + εκτελέσιμος evaluator (`#eval`)· F2: Rust υλοποίηση journal+CAS με in-process DST· Common Lisp reference interpreter για N-version (ADR-0012) |
| **18. Ελάχιστο πείραμα** | CC-E1…E4 (MFA-ALT-1 §6): κλειστότητα σε Lean, round-trip προβολών, throughput 10⁵/s, replay byte-identical |
| **19. Συνθήκη διάψευσης** | Ένας κανόνας που δεν κλείνει (αντιπαράδειγμα στο Lean) → ο κανόνας διορθώνεται· αν καμία διόρθωση δεν κλείνει και τις 4 ιδιότητες ταυτόχρονα, η άλγεβρα δεν υπάρχει ως ενιαία και το σύστημα επιστρέφει σε 5 έδρες με crosswalk (DEC-X-06) — δηλωμένη έξοδος |
| **20. Πρωτότυπο → παραγωγή** | F1 spec → F2 Rust + Lisp N-version → F3 shadow πίσω από τα υπάρχοντα journals του LAWMAX-Ω (χωρίς αλλαγή εκεί) → F4 cutover με ORP → F5 multi-site witnesses |
| **21. Αντικατάσταση/εξέλιξη** | Νέος κανόνας = Schema-δέσμευση επιπέδου 3 + απόδειξη κλειστότητας + critical-pair έλεγχος (MFA-MECH-017)· ο διάδοχος CC ξαναπαράγει το store (MFA-MECH-003) |
| **22. Αλληλεπιδράσεις** | Όλα τα όργανα γράφουν μόνο μέσω CC.apply· το Genesis plane σκέφτεται εκτός store και δεσμεύει αποτελέσματα ως OBSERVE/DERIVE· το cockpit διαβάζει `at(cut)`· το πακέτο σχεδιασμού είναι Schema/Patch δεσμεύσεις |

**AI Contribution Ledger:** `NEW FORMALISM` — η ενοποίηση ledger/τύπων/αποδείξεων/εξουσίας/σχεδίου σε μία άλγεβρα με κλειστότητες ως θεωρήματα. Συγγενή προηγούμενα: proof-carrying code (Necula), authorization logics (Abadi), transparency logs (RFC 6962), Datomic (bitemporal facts) — κανένα δεν ενώνει και τα πέντε με Unknown/Both ως τιμές τεκμηρίου.
