# MFA-MECH-016 — Legal Source Compilation with Named Failure (LSC): η νομική είσοδος ως μεταγλώττιση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-016 |
| **2. Όνομα** | Legal Source Compilation with Named Failure |
| **3. Ικανότητα** | MFA-CAP-012, 042, 043· MFA-OBJ-026 |
| **4. Πρόβλημα** | Mercury: «ο νευροσυμβολικός compiler υπαγωγής γεφυρώνει το Grounding Gap» (CLAIMS FAILS) και αναθέτει ΟΛΗ την κωδικοποίηση σε εμπορικό frontier μοντέλο offline, ανέλεγκτα (παράβαση ADR-0008)· ULTIMA-LEX ξεκινά από έτοιμο LawGraph· EXOUSIA δεν περιγράφει τη διαδρομή κείμενο→ratio· το repo F-11 ξεκινά από το intake (τρία στάδια λείπουν, CLAIMS F77). Το ingestion μετρά «πόσο πήραμε» αντί «τι απέτυχε και πού». |
| **5. Πρώτη αρχή** | Η κωδικοποίηση πηγής δικαίου είναι μεταγλώττιση: front-end (νευρωνικό/OCR, P1, απομονωμένο) → **επικυρώσιμο IR** (LinkML έδρα, D1 έλεγχος) → back-end (ντετερμινιστικό, D2). Ό,τι δεν μεταγλωττίζεται παράγει Compilation Error που **ονομάζει τη σελίδα/παράγραφο** και μπαίνει στο void ledger· από το IR και πέρα μηδέν στοχαστικότητα. Ο νευρωνικός front-end είναι ανταγωνιστικά ελεγμένος (differential + δειγματοληπτικός άνθρωπος + Court για αμφισβητούμενα). |
| **6. Οντολογία** | `Source⟨cid, kind ∈ {ΦΕΚ, απόφαση, θεωρία, σύμβαση}, jurisdiction, attestation⟩`· `IR` (LinkML σχήμα: Norm⟨conditions, consequence, scope, temporal⟨enactment, commencement, repeal⟩, hierarchy, modifies_scope⟩· Decision⟨ratio: [Step], obiter, legal_graph, attack_edges, conflict_dimensions, bitemporal_per_node⟩· Citation⟨target, span, supports?: Unknown∣bool⟩)· `CompilationError⟨source_cid, locus: page/para/span, reason ∈ {AMBIGUOUS, UNSUPPORTED_CONSTRUCT (π.χ. ανοιχτή στάθμιση — CLAIMS F18), MISSING_REFERENCE, OCR_LOW_CONFIDENCE, CONTRADICTION_WITH_IR}, void_cid⟩`· `Stage ∈ {S0 acquisition+attestation, S1 layout/OCR, S2 segmentation, S3 IR extraction (P1), S4 IR validation (D1), S5 back-end (D2), S6 differential, S7 admission}` — τα S0–S2 είναι τα «τρία στάδια που λείπουν» |
| **7. Κατάσταση** | Corpus IR εκδοσιοποιημένο (διτεμπορικό)· void ledger εγγραφές ανά error· differential στατιστικά ανά front-end |
| **8. Είσοδοι/έξοδοι** | Είσοδος: Source με attestation (χωρίς attestation → μη δεκτή, INV-E04)· Έξοδος: IR δεσμεύσεις (D2, VERIFIED μετά S6) ή CompilationErrors (ονομασμένες) — **ποτέ σιωπηλή μερική είσοδος** |
| **9. Αλγόριθμος** | S0: λήψη με TSR/υπογραφή, quarantine· S1: OCR με provenance-confidence ανά span· S2: segmentation σε άρθρα/σκέψεις με CID ανά span· S3: **front-end P1** (LLM ή rule-based) παράγει IR υποψήφιο· S4: **D1 validation** έναντι LinkML σχήματος + SHACL + διτεμπορική συνέπεια· κάθε αποτυχία = CompilationError με locus· S5: **D2 back-end** παράγει LexDSL/KG triples ντετερμινιστικά από IR· S6: **differential**: δεύτερος ανεξάρτητος front-end (EIM PASS) στο ίδιο span· διαφωνία → CONTESTED → Court/δειγματοληπτικός άνθρωπος· S7: admission ως δεσμεύσεις με lineage μέχρι raw bytes· **Ratio decidendi**: S3 για αποφάσεις παράγει Decision IR· attack_edges/conflict_dimensions πολυαξονικά (CLAIMS F67 υπόλειμμα)· χωρίς ψυχολογικό προφίλ (F70)· argumentative_strength ΟΧΙ ως 0–1 τεκμήριο (EXOUSIA FAILS) — ως δηλωμένο πεδίο με υπεύθυνο |
| **10. Διεπαφές** | `LSC.compile(source)→{ir_cids, errors}` · `LSC.errors(filter)` · `LSC.differential_stats()`· ICD-18 (ingest), ICD-17 (KG), ICD-30 (citation verifier 5 σκελών) |
| **11. Εξαρτήσεις** | LinkML έδρα σχήματος (DEC-X-06), CMP-KNW-04, CMP-LAW-02 (υπάρχουσες έδρες: FEK compiler, version-graph — ο LSC τις ΕΠΕΚΤΕΙΝΕΙ, δεν τις αντικαθιστά), MFA-MECH-015 (τύποι), 009 (differential ανεξαρτησία), 002 (voids) |
| **12. Πόροι** | S3 κυρίαρχο κόστος (LLM)· S4–S5 ms· differential διπλασιάζει S3 (δειγματοληπτικά μετά από βαθμονόμηση) |
| **13. Κλιμάκωση** | Ανά πηγή, παράλληλο· incremental (νέα ΦΕΚ) |
| **14. Αποτυχίες** | OCR χαμηλής βεβαιότητας → error, όχι εικασία· ανοιχτή στάθμιση αρχών → UNSUPPORTED_CONSTRUCT (η αρχή μπαίνει ως Norm με κενή condition και σήμανση «απαιτεί Carneades/ASPIC+ επίπεδο»)· κύκλοι ιεραρχίας (lex specialis/posterior) → Conflict αντικείμενα, όχι σπάσιμο διάταξης (CLAIMS F19) |
| **15. Αντιπαλικοί** | Δηλητηριασμένη πηγή → attestation + multi-witness + taint (KT-06)· injection μέσα σε ΦΕΚ κείμενο → S3 έξοδος είναι δεδομένα, ποτέ τελεστής (13ος νόμος)· front-end που «μαθαίνει» το differential → EIM |
| **16. Επαλήθευση** | VO: 100% errors με locus· differential agreement ≥ κατώφλι ανά kind· round-trip IR→κείμενο→IR σε σφραγισμένο σύνολο· KT-06, KT-17 |
| **17. Πρωτότυπο** | F2: LinkML σχήμα + S4 validator + stub S3· F3: πραγματικά ΦΕΚ με τον υπάρχοντα FEK compiler ως ένας front-end και LLM ως δεύτερος |
| **18. Ελάχιστο πείραμα** | 100 άρθρα ΦΕΚ + 20 αποφάσεις ΑΠ: ποσοστό μεταγλώττισης, ποσοστό errors με σωστό locus (ανθρώπινος έλεγχος), differential agreement |
| **19. Διάψευση** | Αν ο differential agreement < 50% σε αποφάσεις → ο front-end δεν είναι ώριμος για Decision IR· το Decision IR μένει EXP και οι αποφάσεις μπαίνουν ως κείμενο με citation-only (δηλωμένη υποχώρηση εύρους) |
| **20. → Παραγωγή** | Επεκτείνει τις έδρες του LAWMAX-Ω (χωρίς αλλαγή εκεί)· Δόση 2 |
| **21. Εξέλιξη** | Νέα δικαιοδοσία = νέο front-end + ίδιο IR· νέο IR construct = ADD στο LinkML με migration |
| **22. Αλληλεπιδράσεις** | Void ledger (errors)· Court (CONTESTED)· citation verifier (σκέλη 1–5)· KG (ICD-17)· cockpit: errors ως ομίχλη πάνω στην πηγή |

**AI Contribution Ledger:** `CROSS-SOURCE SYNTHESIS` (Mercury Meta-Compiler + ULTIMA-LEX IR + EXOUSIA Decision object + repo F-11) με `NEW` στοιχείο: **Compilation Error με locus ως void** και τα τρία στάδια S0–S2 ρητά· `CORRECTED` κατά CLAIMS F18/F19/F67/F70/F77.
