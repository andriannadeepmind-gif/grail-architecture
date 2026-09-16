# MFA-MECH-018 — Civilization Quorum (CQ): N ≥ 3f+1+1 ανεξάρτητοι Πολιτισμοί με έναν που μόνο κρίνει

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-018 |
| **2. Όνομα** | Civilization Quorum |
| **3. Ικανότητα** | MFA-OBJ-014· MFA-CAP-075, 035, 029, 056 |
| **4. Πρόβλημα** | Το προοίμιο του δημιουργού ορίζει «5 ανεξάρτητους Πολιτισμούς» χωρίς λόγο στο corpus· ADR-0031 έχει BFT μόνο για διάταξη verdicts· MATERIAL §9.18 ανεξαρτησία evaluator άλυτη. Χωρίς μηχανισμό, «Πολιτισμός» είναι όνομα deployment. |
| **5. Πρώτη αρχή** | Ένας Πολιτισμός είναι trust domain = {δική του γενεαλογία κλειδιών, δική του supply chain, δικό του evaluator lineage, δική του εγκατάσταση συντάγματος (ίδιο κείμενο), δική του οικονομία}. Για ανεκτικότητα f Byzantine Πολιτισμών στη διάταξη ετυμηγοριών χρειάζονται n ≥ 3f+1 που ΨΗΦΙΖΟΥΝ· για αξιολόγηση που δεν μπορεί να καταληφθεί από τους ψηφίζοντες χρειάζεται ≥1 που ΔΕΝ ψηφίζει ποτέ (held-out). f=1 ⇒ 4+1 = 5. Το «5» του δημιουργού παίρνει λόγο· το N είναι παράμετρος. |
| **6. Οντολογία** | `Civilization⟨id, role ∈ {VOTING, HELD_OUT}, key_lineage, supply_chain_root, evaluator_lineage, constitution_install_cid, economy, sites⟩`· `Quorum⟨n, f, voting: [civ], held_out: [civ]⟩`· `VerdictOrdering` (HotStuff-family μεταξύ VOTING)· `SealedSets` (Battery, AffinityTest, AnchorSet, SeededFaults — κατοχή μόνο HELD_OUT)· `CrossDomainImport⟨from, to, object_cid, receipt⟩` |
| **7. Κατάσταση** | Quorum config (επίπεδο 3, δημιουργός)· κατάσταση BFT· EIM μετρήσεις μεταξύ Πολιτισμών |
| **8. Είσοδοι/έξοδοι** | Είσοδος: Verdicts προς διάταξη, αιτήσεις αξιολόγησης (KT, Battery, EIM, GCP verdict)· Έξοδος: διατεταγμένα Verdicts (accountable safety: δύο αντικρουόμενα checkpoints ⇒ υπογεγραμμένη μαρτυρία κατά ≥2q−n)· αξιολογήσεις από HELD_OUT με sealed sets· CrossDomainImports με receipts |
| **9. Αλγόριθμος** | (1) **Ρόλοι**: 4 VOTING, 1 HELD_OUT (f=1)· ο HELD_OUT δεν εκδίδει Verdicts, δεν αλλάζει σύνταγμα, δεν έχει Effects εκτός αξιολόγησης· (2) **Ανεξαρτησία**: EIM(civ_i, civ_j) PASS για κάθε ζεύγος (supply/data/behaviour ≥ threshold_Tier0)· αποτυχία → ο Πολιτισμός χάνει VOTING ρόλο μέχρι αποκατάσταση· (3) **Διάταξη Verdicts**: BFT μεταξύ VOTING· τα υπόλοιπα επίπεδα (μαρτυρία) CRDT, χωρίς συντονισμό· (4) **Αξιολόγηση**: κάθε KT/Battery/AffinityTest/EIM τρέχει από τον HELD_OUT με sealed sets που οι VOTING δεν βλέπουν· (5) **Εισαγωγή**: αντικείμενο περνά σύνορο Πολιτισμού μόνο ως CrossDomainImport με receipt και ετικέτα trust domain (MFA-CAP-056)· (6) **Κατάληψη HELD_OUT**: ο ρόλος εναλλάσσεται περιοδικά (rotation) με νέο sealed set από τον νέο HELD_OUT· ο παλιός HELD_OUT γίνεται VOTING μόνο αφού περάσει EIM· (7) **Παραμετρικότητα**: N = 3f+1+h (h held-out)· ο δημιουργός ορίζει f, h με patch· (8) **Το ίδιο σύνταγμα**: constitution_install_cid ίδιο κείμενο· η επιβολή ανά Πολιτισμό (CLAIMS H1: δύο εγκαταστάσεις, ένα κείμενο) |
| **10. Διεπαφές** | `CQ.order(verdict)` · `CQ.evaluate(request)→held_out_result` · `CQ.import(object, from, to)→receipt` · `CQ.rotate_held_out()` · `CQ.independence()→matrix`· ICD-14 (verdicts), ICD-27 (harness) |
| **11. Εξαρτήσεις** | MFA-MECH-009 (EIM), 012 (sealed sets), ADR-0031 BFT, MFA-CAP-056, KT-04 |
| **12. Πόροι** | 5 εγκαταστάσεις (μπορούν να είναι 5 microVMs σε ένα workstation για DP-1, 5 sites για DP-4)· BFT μόνο για Verdicts (χαμηλός ρυθμός) |
| **13. Κλιμάκωση** | N αυξάνει με f· τα sealed sets κοστίζουν O(1) ανά Πολιτισμό |
| **14. Αποτυχίες** | Πολιτισμός εκτός → f-1 ανοχή δηλωμένη· HELD_OUT εκτός → αξιολογήσεις παγώνουν (fail-closed, καμία προαγωγή) |
| **15. Αντιπαλικοί** | Συμπαιγνία VOTING (≥2) → accountable safety παράγει μαρτυρία· κατάληψη HELD_OUT → rotation + EIM· κοινή supply chain «κρυφά» → EIM d_supply |
| **16. Επαλήθευση** | KT-04, KT-19· VO: EIM matrix PASS· VO: 0 Verdicts από HELD_OUT· drill rotation ανά φάση |
| **17. Πρωτότυπο** | F2: 5 DST instances με διαφορετικά seeds και stub verifiers· F3: 5 microVMs |
| **18. Ελάχιστο πείραμα** | Seeded Byzantine Πολιτισμός (ψευδή verdicts): ανίχνευση + μαρτυρία· seeded κατάληψη HELD_OUT: rotation αποκαθιστά |
| **19. Διάψευση** | Αν οι 5 εγκαταστάσεις δεν περνούν EIM (κοινή καταγωγή αναπόφευκτη, π.χ. ένας μόνο πάροχος LLM) → η ανεξαρτησία δηλώνεται ως ΜΕΡΙΚΗ με το μετρημένο διάνυσμα, και το f ισχύει μόνο για τις διαστάσεις που πέρασαν — όχι ψευδής ασφάλεια |
| **20. → Παραγωγή** | Δόση 2 (DST), Δόση 4 (sites) |
| **21. Εξέλιξη** | f, h παράμετροι επιπέδου 3· νέος ρόλος (π.χ. ARCHIVE) = ADD |
| **22. Αλληλεπιδράσεις** | Battery/AnchorSet/AffinityTest ζουν στον HELD_OUT· GCP verdict signers από διαφορετικούς Πολιτισμούς· CGP δείχνει Πολιτισμούς ως περιοχές με σύνορα |

**AI Contribution Ledger:** `FIRST-PRINCIPLES DERIVATION` — n ≥ 3f+1 (ψηφίζοντες) + h ≥ 1 (held-out) ως ο λόγος του «5», με held-out ως κάτοχο όλων των sealed sets και rotation. Συγγενή: BFT quorums, held-out test sets, separation of duties· η σύνθεση σε trust domains με EIM πύλη είναι δική μου.
