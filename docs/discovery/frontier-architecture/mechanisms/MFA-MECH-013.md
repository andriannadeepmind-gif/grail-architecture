# MFA-MECH-013 — Organ Activation Planner (OAP): η βέλτιστη απλότητα ως υπολογισμός, όχι ως απόφαση

Copyright (c) 2026 STAVROPOULOS LAW. All Rights Reserved.

| Πεδίο | Περιεχόμενο |
|---|---|
| **1. ID** | MFA-MECH-013 |
| **2. Όνομα** | Organ Activation Planner |
| **3. Ικανότητα** | MFA-CAP-054, 032· MFA-OBJ-022, 030 |
| **4. Πρόβλημα** | Εντολή §15/§22: η μέγιστη αρχιτεκτονική πρέπει να συμπτύσσεται σε ισοδύναμο lean profile και να χωρά σε laptop χωρίς υποβάθμιση κλάσης απόδειξης· MATERIAL §9.7: χωρίς ablation το σύστημα συσσωρεύει όργανα που κανείς δεν τολμά να αφαιρέσει· §9.8: το κόστος του πολυκεντρικού σχήματος δεν μετρήθηκε ποτέ. Κανένα σύστημα δεν επιλέγει αυτόματα το ελάχιστο σύνολο οργάνων που διατηρεί δηλωμένη κλάση απόδειξης για δεδομένο έργο. |
| **5. Πρώτη αρχή** | Κάθε όργανο έχει (α) ικανότητες που παρέχει (lattice), (β) κόστος (CPU/RAM/VRAM/latency/ενέργεια/χρήμα), (γ) κλάση απόδειξης που στηρίζει. Για δεδομένο matter με απαιτούμενες ικανότητες και απαιτούμενη κλάση απόδειξης, το ελάχιστο-κόστους σύνολο οργάνων που καλύπτει τις ικανότητες στην κλάση είναι weighted set cover — NP-hard γενικά, μικρό στην πράξη (≤ 100 όργανα), λύνεται ακριβώς με ILP ή με απόδειξη σε SMT. Ό,τι δεν καλύπτεται δηλώνεται ως typed degraded mode, ποτέ ως σιωπηλή απώλεια. |
| **6. Οντολογία** | `OrganProfile⟨id, provides: {(cap, grade)}, cost: ResourceVector, requires: [organs], fault_model, fidelity⟩`· `MatterRequirement⟨caps_needed: {(cap, min_grade)}, budget: ResourceVector, deployment: MFA-DEP-n⟩`· `Profile⟨active_organs, covered, degraded: [(cap, reason)], cost, proof_class_preserved: bool⟩`· `DegradedMode` (typed: «εύρος μειωμένο σε X», ποτέ «PASS») |
| **7. Κατάσταση** | Μητρώο OrganProfiles (από registry KRN-04 + ablation results KT-24)· cache προφίλ ανά (requirement, deployment) |
| **8. Είσοδοι/έξοδοι** | Είσοδος: MatterRequirement + DeploymentProfile· Έξοδος: Profile με απόδειξη κάλυψης (ποιο όργανο καλύπτει ποια ικανότητα σε ποιο grade) ή Unknown(UNDECIDABLE_IN_BUDGET) αν ο ILP δεν λύνει εντός budget |
| **9. Αλγόριθμος** | (1) Συλλογή `provides` από registry (**μόνο με evidence**, MFA-CAP-002)· (2) ILP: `min Σ cost(o)·x_o` s.t. `∀(cap, g) ∈ needed: Σ_{o provides (cap, ≥g)} x_o ≥ 1`, `requires` closure, `Σ cost ≤ budget`· (3) Αν infeasible: **λεξικογραφική χαλάρωση** (LPA): πρώτα ΠΟΤΕ η κλάση απόδειξης (veto), μετά εύρος (αφαίρεση caps με χαμηλότερα stakes) → DegradedMode με ρητή λίστα· (4) **Επαλήθευση**: SMT ελέγχει ότι το Profile καλύπτει τη needed στη δηλωμένη κλάση (απόδειξη κάλυψης ως δέσμευση)· (5) **Ενεργοποίηση**: τα μη επιλεγμένα όργανα δεν φορτώνονται (lazy materialization) — deferred simulations/offloading σύμφωνα με το DeploymentProfile· (6) **Ablation feedback**: KT-24 ενημερώνει `provides` (όργανο χωρίς οριακή αξία → provides=∅ → ποτέ επιλέγεται → υποψήφιο απόσυρσης με Court) |
| **10. Διεπαφές** | `OAP.plan(requirement, deployment)→Profile` · `OAP.explain(profile)` · `OAP.compare(profile_a, profile_b)` (9 άξονες έναντι MFA-ALT-6)· ICD-11 (resources), ICD-04 (registry) |
| **11. Εξαρτήσεις** | KRN-04 registry με evidence, KRN-08 budgets, KT-24, MFA-MECH-005 (χαλάρωση), DeploymentProfiles (TECHNICAL-ARCHITECTURE) |
| **12. Πόροι** | ILP ≤ 100 μεταβλητών: ms· SMT απόδειξη κάλυψης: s |
| **13. Κλιμάκωση** | Ανά matter· cache· τα Profiles είναι δεσμεύσεις (επαναχρησιμοποιήσιμα) |
| **14. Αποτυχίες** | Registry με ψευδή provides → μόνο evidence (KRN-04)· ILP timeout → Unknown, fallback στο τελευταίο γνωστό Profile με σήμανση |
| **15. Αντιπαλικοί** | Όργανο που «δηλώνει» φθηνό κόστος → κόστος μετρημένο από receipts (SPL προβλέψεις κόστους!)· matter που ζητά «όλα» → budget veto |
| **16. Επαλήθευση** | VO: κάθε Profile με SMT απόδειξη κάλυψης· VO: 0 Profiles που υποβαθμίζουν κλάση απόδειξης· KT-24· LEAN-E1 (9 άξονες έναντι Copilot) |
| **17. Πρωτότυπο** | F1: ILP πάνω στα 75 CMP + κόστη εκτίμησης από DeploymentProfiles· F2: DST με μετρημένα κόστη stubs |
| **18. Ελάχιστο πείραμα** | 20 matters × 3 deployments: lean profile κόστος vs πλήρες· κλάση απόδειξης αμετάβλητη (SMT)· σύγκριση έναντι ALT-6 |
| **19. Διάψευση** | Αν για matters τυπικού γραφείου το lean profile δεν είναι ≤ 2× του Copilot σε κόστος με ίδια κλάση απόδειξης → το robust substrate είναι πολύ βαρύ και ξανασχεδιάζεται (όχι το κριτήριο) |
| **20. → Παραγωγή** | Δόση 1 (στατικά προφίλ), Δόση 3 (δυναμικός planner) |
| **21. Εξέλιξη** | Νέος άξονας κόστους = ADD· η αντικειμενική συνάρτηση = πολιτική |
| **22. Αλληλεπιδράσεις** | Deployment profiles (MFA-DEP-1…5) είναι είσοδοι· cockpit δείχνει ενεργά/ανενεργά όργανα· SPL προβλέπει κόστος· KT-24 ενημερώνει |

**AI Contribution Ledger:** `NEW ALGORITHM` — set-cover πάνω σε evidence-backed capability lattice με veto στην κλάση απόδειξης και typed degraded mode. Συγγενή: feature selection, service mesh autoscaling, ILP resource allocation· κανένα δεν έχει «κλάση απόδειξης» ως veto.
