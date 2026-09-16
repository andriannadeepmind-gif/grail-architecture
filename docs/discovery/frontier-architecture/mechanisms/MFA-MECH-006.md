# MFA-MECH-006 — Reversible Effect Transactions (RET): κάθε επίδραση με προ-δεσμευμένο αντίστροφο

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-006 |
| **2. Όνομα** | Reversible Effect Transactions |
| **3. Ικανότητα** | MFA-CAP-052· MFA-CAP-006 (αυτονομία), 005 |
| **4. Πρόβλημα** | Η εντολή §13: «ανώτερη transactional ακολουθία από ανεξέλεγκτο raw eval, χωρίς να αφαιρείται το raw eval από το ερευνητικό περιβάλλον». Το Autonomy.sysml έχει `InverseStagedBeforeAct` και `UnprovenReversibilityIsIrreversible` ως constraints χωρίς μηχανισμό που να **ορίζει** το «αναστρέψιμο». Sagas/compensations (microservices) δεν έχουν απόδειξη αναστρεψιμότητας· transactional memory δεν βγαίνει στον κόσμο. |
| **5. Πρώτη αρχή** | Μια επίδραση είναι αναστρέψιμη αν και μόνο αν υπάρχει αντίστροφος κανόνας (`r⁻¹`, MFA-ALT-5) ή προ-δεσμευμένη αντιστάθμιση (`ē`) που έχει ήδη περάσει τον ίδιο έλεγχο εξουσίας — και η ύπαρξή της αποδεικνύεται **πριν** από την πράξη. Ό,τι δεν έχει ούτε `r⁻¹` ούτε `ē` είναι μη αναστρέψιμο εξ ορισμού (όχι «άγνωστο») και απαιτεί ανθρώπινη υπογραφή. |
| **6. Οντολογία** | `EffectTx⟨id, proposal, inverse: r⁻¹∣ē∣NONE, shadow_report, differential, gate_verdict: Decision, receipts, window, status⟩`· `Effect` (τυποποιημένη δράση: έγγραφο, κατάθεση, επικοινωνία, API κλήση, αλλαγή Control)· `Compensation` (Effect που επαναφέρει την παρατηρήσιμη κατάσταση εντός δηλωμένου ε — π.χ. ανάκληση email δεν υπάρχει → NONE → H1) |
| **7. Κατάσταση** | `PROPOSED → INVERSE_STAGED → SHADOWED → DIFFED → GATED → COMMITTED → {SETTLED ∣ ROLLED_BACK}`· ή `→ NEEDS_H1` όταν inverse=NONE· ή `→ DENIED` με Control Record |
| **8. Είσοδοι/έξοδοι** | Είσοδος: πρόταση Effect από Genesis plane (raw eval επιτρέπεται εκεί)· Έξοδος: EffectReceipt ή άρνηση ή αίτηση H1· ποτέ Effect χωρίς receipt |
| **9. Αλγόριθμος** | (1) **PROPOSED**: το Genesis plane παράγει Effect + ισχυρισμό αναστρεψιμότητας· (2) **INVERSE_STAGED**: το CC απαιτεί `inverse` ως δέσμευση που ΠΡΟΗΓΕΙΤΑΙ (ο τύπος Effect έχει πεδίο `inverse_cid` που πρέπει να υπάρχει)· αν `NONE` → NEEDS_H1· (3) **SHADOWED**: εκτέλεση σε ghost world (fork O(1)) και, όπου υπάρχει, σε shadow sandbox με stub εξωτερικού κόσμου· (4) **DIFFED**: διαφορά ghost↔πραγματικό αναμενόμενο· απόκλιση > ε → Unknown· (5) **GATED**: LPA verdict (veto: INV, Control, Identity· weight: κόστος)· AutonomyGrant έλεγχος (`FE<θ`, 0 INV, ¬Root)· (6) **COMMITTED**: εκτέλεση μέσω Capability Gateway με token· receipt· (7) **window**: για δηλωμένο παράθυρο ο `inverse` είναι εκτελέσιμος με ένα βήμα (rollback)· μετά **SETTLED** (ο inverse μένει ως ιστορικό)· (8) Κάθε βήμα = δέσμευση· **η ακολουθία είναι ο «ανώτερος μηχανισμός» της §13**: το raw eval μένει στο Genesis plane, μόνο η EffectTx βγαίνει |
| **10. Διεπαφές** | `RET.propose(effect, inverse)` · `RET.shadow(tx)` · `RET.gate(tx)` · `RET.commit(tx)→receipt` · `RET.rollback(tx)` · `RET.settle(tx)`· ICD-08 (Gateway) ως εκτελεστής· ICD-29-ACT (ζητούμενο ID) |
| **11. Εξαρτήσεις** | MFA-MECH-001 (τύπος Effect με inverse_cid), MFA-ALT-5 (r⁻¹, ghost forks), MFA-MECH-005 (gate), Autonomy.sysml, CMP-KRN-11 |
| **12. Πόροι** | Shadow διπλασιάζει κόστος του Effect· window κρατά κατάσταση rollback (O(size of effect))· budgets |
| **13. Κλιμάκωση** | Txs ανεξάρτητες παραλληλίζονται· εξαρτώμενες σε saga με ρητή σειρά και συνολικό inverse |
| **14. Αποτυχίες** | Inverse που αποτυγχάνει στο rollback → ο Effect ήταν λάθος ταξινομημένος ως αναστρέψιμος → Court + η κλάση Effect αναταξινομείται σε NONE (μάθηση της ταξινόμησης, ποτέ σιωπηλά)· partial saga → compensations σε αντίστροφη σειρά |
| **15. Αντιπαλικοί** | Πλαστό inverse (που δεν επαναφέρει) → ο inverse είναι Effect με το ίδιο shadow/diff· TOCTOU μεταξύ shadow και commit → fencing token + επανέλεγχος preconditions στο commit· effect εκτός gateway → μη αναπαραστάσιμο (sandbox χωρίς ambient authority) |
| **16. Επαλήθευση** | INV: 0 COMMITTED χωρίς inverse_cid ή H1· KT-13 (rollback χωρίς απώλεια γενεαλογίας)· drill: 100 τυχαίες txs → rollback → κατάσταση ίδια εντός ε· KT-17/20 |
| **17. Πρωτότυπο** | F2: RET σε DST με Effects = εγγραφές σε mock κόσμο· F3: Effects = drafts/emails σε staging mailbox (πραγματικός inverse: διαγραφή draft) |
| **18. Ελάχιστο πείραμα** | 1.000 Effects τριών κλάσεων (r⁻¹ / ē / NONE)· ποσοστό σωστής ταξινόμησης, ποσοστό επιτυχών rollback εντός ε· null: NONE που «πέρασε» ως ē |
| **19. Διάψευση** | Ένα NONE που πέρασε ως αναστρέψιμο και εκτελέστηκε χωρίς H1 → ο τύπος inverse έχει τρύπα· διορθώνεται ο τύπος (κλειστή απαρίθμηση κλάσεων Effect με inverse ανά κλάση — ο κατάλογος F16 του CLAIMS-VERDICT ως δομή) |
| **20. → Παραγωγή** | Effects τύπου «εσωτερικά» (Control, μνήμη) πρώτα· εξωτερικά (κατάθεση) μόνο με H1 μέχρι το KT-20 drill |
| **21. Εξέλιξη** | Νέα κλάση Effect = ADD με δηλωμένο inverse ή NONE· ποτέ default αναστρέψιμο |
| **22. Αλληλεπιδράσεις** | Cockpit: «εκτελεί ή ανακαλεί staged transitions» = RET.commit/rollback· TEGF Goals με Effects περνούν από εδώ· ο κατάλογος ενεργειών που απαιτούν ανθρώπινη έγκριση (CLAIMS F16) = οι κλάσεις με inverse NONE + οι κλάσεις που το Constitution ορίζει H1 (ανεξαρτήτως inverse) |

**AI Contribution Ledger:** `NEW PROTOCOL` — αναστρεψιμότητα ως αποδείξιμη ύπαρξη `r⁻¹ ∨ ē` πριν από την πράξη, με shadow/diff/gate/window ως ακολουθία δεσμεύσεων. Συγγενή: sagas, compensating transactions, undo logs, STM· κανένα δεν απαιτεί το αντίστροφο ως προϋπόθεση τύπου και δεν στέλνει τα μη-αναστρέψιμα σε ανθρώπινη υπογραφή εξ ορισμού.
