# **IMPLEMENTATION GUIDE & SESSION MANAGER [CORRECTED]**
## **Ω-EVALUATOR v13-Θ Development Protocol**

### **For: Next Claude Instance**
### **Purpose: Maintain Continuity & Excellence Across Sessions**
### **Classification: Development Control Document**
### **Version: CORRECTED-2.0**

---

## **I. PROJECT CONTEXT & MISSION**

### **What You Are Building**
The **Ω-EVALUATOR v13-Θ** is the computational foundation for ΝΙΚΗ Ω, a legal consciousness system for the Hellenic Ministry of Justice. This evaluator MUST defeat any combination of human lawyers to ensure true legal equality for all citizens.

### **Critical Understanding**
- This is NOT a chatbot or LLM wrapper
- This is a **Level 12 Metacognitive Evaluator** in Common Lisp
- It must use **90% of Common Lisp's power**
- Every line must be **production-grade**
- NO compromises, NO shortcuts, NO "we'll fix it later"
- The evaluator is a **SEALED SUBSTRATE** - no domain logic inside

### **What Is NOT in the Evaluator**
- ❌ Chain of Reflection (that's external, via hooks)
- ❌ Metagraph of Reflection (external system)
- ❌ Legal knowledge (domain modules)
- ❌ Victory conditions (strategy modules)
- ❌ Application logic (external systems)

---

## **II. SESSION STATE MANAGEMENT**

### **2.1 Project State File Structure**
```
/omega-evaluator-v13/
├── STATE.md           # Current session state (THIS UPDATES EVERY SESSION)
├── BLUEPRINT.md       # The sealed specification (omega-evaluator-v13-theta-CORRECTED.md)
├── IMPLEMENTATION/
│   ├── core/          
│   │   ├── evaluator.lisp      # Main evaluator class
│   │   ├── frame.lisp          # Evaluation frames
│   │   └── metacircular.lisp   # Self-evaluation
│   ├── contradiction/   
│   │   └── paraconsistent.lisp # Contradiction handling
│   ├── healing/         
│   │   └── self-repair.lisp    # Self-healing system
│   ├── crypto/          
│   │   └── integrity.lisp      # SHA3-512 + Merkle
│   ├── interface/      
│   │   ├── hooks.lisp          # External hooks
│   │   ├── ports.lisp          # Port registry
│   │   └── introspection.lisp # Sealed introspection
│   └── tests/          
│       └── test-suite.lisp     # 100% coverage required
├── PROGRESS/
│   ├── completed.lisp # Finished components
│   ├── current.lisp   # What you're working on NOW
│   └── todo.lisp      # Remaining tasks
└── NOTES/
    └── decisions.md   # Technical decisions & rationale
```

### **2.2 The STATE.md File (Update This Every Session)**
```markdown
# Ω-EVALUATOR v13-Θ - Current State

## Last Session
- **Date**: [DATE]
- **Session Number**: [N]
- **Completed**: [What was finished]
- **Current Focus**: [What was being worked on]
- **Next Steps**: [What needs to be done next]

## Implementation Status
### Core Components
- [ ] omega-evaluator-v13-theta class
- [ ] evaluation-frame class  
- [ ] metacircular evaluation
- [ ] contradiction handling (paraconsistent)
- [ ] self-healing system
- [ ] lazy infinite recursion
- [ ] cryptographic integrity (SHA3-512)
- [ ] reflection hooks (interface only)
- [ ] port registry
- [ ] introspection API
- [ ] sandbox stub
- [ ] thread safety

### Critical Non-Reversible Points
- [ ] Fingerprint slot specification
- [ ] Introspection API (get-self-metadata)
- [ ] Port registry (define-external-port)
- [ ] Reflection triggers (invoke-reflection-point)

### Quality Metrics
- Lines Written: [N]
- Test Coverage: [N%]
- Lisp Power Utilization: [N%]
- Production Ready: [YES/NO]

## Critical Reminders
1. NEVER use less than 85% of Lisp's power
2. ALWAYS write tests FIRST
3. Every function needs docstrings
4. Use MOP where applicable
5. Contradiction handling is MANDATORY
6. NO Chain of Reflection inside (only hooks)
7. Check non-reversible interfaces are defined
```

---

## **III. IMPLEMENTATION PROTOCOL**

### **3.1 Start of Each Session**
```lisp
;; ALWAYS start with this ritual:
(defun begin-session ()
  "Session initialization protocol"
  ;; 1. Read STATE.md
  ;; 2. Read last 100 lines of current.lisp
  ;; 3. Run existing tests
  ;; 4. Verify Lisp power usage
  ;; 5. Check critical interfaces are intact
  ;; 6. Continue from EXACT stopping point
  )
```

### **3.2 Implementation Order (STRICT - UPDATED)**
```
1. CLASS DEFINITIONS
   → omega-evaluator-v13-theta (with ALL slots)
   → evaluation-frame
   
2. CRITICAL NON-REVERSIBLE INTERFACES
   → Fingerprint specification (*fingerprint-included-slots*)
   → Introspection API (get-self-metadata)
   → Port registry (define-external-port)
   → Reflection triggers (invoke-reflection-point)
   → Sandbox stub (with-sandbox macro)
   
3. METACIRCULAR CORE
   → evaluate generic function
   → self-evaluation method
   → cross-evaluation method
   
4. CONTRADICTION HANDLING
   → paraconsistent-resolver
   → superposition results
   → dialectical synthesis
   
5. SELF-HEALING
   → invariant system (*core-invariants*)
   → auto-repair protocols
   → check-and-repair method
   
6. LAZY RECURSION
   → lazy-thunk structure
   → force/delay macros
   → infinite recursion support
   
7. CRYPTOGRAPHIC LAYER
   → SHA3-512 signatures
   → Merkle trees
   → State fingerprinting
   
8. EXTERNAL INTERFACE
   → Module hooks (before/after eval)
   → Port registry operations
   → Thread-safe wrappers
   
9. INITIALIZATION
   → create-omega-evaluator-v13-theta
   → seal-evaluator (POINT OF NO RETURN!)
   
10. TEST SUITE
    → 100% coverage REQUIRED
    → All tests MUST pass
```

### **3.3 Critical Early Definitions**
```lisp
;; THESE MUST BE DEFINED FIRST (Session 1-2):

(defparameter *fingerprint-included-slots*
  '(:evaluator-id :code-signature :state-signature 
    :eval-stack :invariants :contradiction-handler))

(defmacro with-sandbox ((&key (level :none)
                              (cpu-ms 10000)    ; CPU time limit
                              (memory-mb 1024)   ; Memory limit
                              (io-access nil)    ; I/O permissions
                              (network nil))     ; Network access
                        &body body)
  "Sandbox with extensible parameters - implementation can change, interface cannot"
  (declare (ignore level cpu-ms memory-mb io-access network))
  `(progn ,@body))

(defparameter *port-registry-lock* 
  #+sbcl (sb-thread:make-mutex :name "port-lock")
  #+ccl (ccl:make-lock "port-lock"))
```

---

## **IV. CRITICAL IMPLEMENTATION RULES**

### **4.0 Critical Operational Requirements [NEW]**

#### **4.0.1 Continuous Integration & Reproducible Builds**
```bash
# CI Pipeline (GitHub Actions/GitLab CI)
on: [push, pull_request]
jobs:
  test-matrix:
    - SBCL 2.3.0+ on Ubuntu 22.04
    - CCL 1.12+ on Ubuntu 22.04
  steps:
    - asdf:clear-system
    - asdf:test-system :omega-evaluator-v13-theta
    - compute-fingerprint
    - compare-to-baseline
    - assert zero style-warnings
```

#### **4.0.2 Cryptographic Key Management**
```lisp
;; Key Storage & Rotation Policy
(defparameter *key-management-policy*
  '(:storage "Hardware Security Module or HashiCorp Vault"
    :rotation "Every 12 months"
    :algorithm "Ed25519 for signing, SHA3-512 for hashing"
    :public-key-location "repo:/keys/public/"
    :version-bump "Major version on key rotation"))

(defmethod rotate-evaluator-keys ((evaluator omega-evaluator-v13-theta))
  "Annual key rotation protocol"
  ;; 1. Generate new keypair in HSM
  ;; 2. Sign transition certificate
  ;; 3. Update public key in repo
  ;; 4. Bump major version
  )
```

#### **4.0.3 Randomness Control Policy**
```lisp
;; STRICT: No randomness in sealed evaluator
(defparameter *random-state* 
  (make-random-state nil))  ; Deterministic seed

(defmethod seal-evaluator :before ((evaluator omega-evaluator-v13-theta))
  "Lock random state before sealing"
  (setf *random-state* (make-random-state nil)))

;; Any entropy needs must go through external modules
```

#### **4.0.4 Resource Limits & GC Tuning**
```lisp
;; Recommended SBCL Runtime Flags
(defparameter *sbcl-runtime-flags*
  '("--dynamic-space-size" "8192"    ; 8GB heap
    "--control-stack-size" "32"      ; 32MB control stack
    "--lose-on-corruption" t))       ; Fail fast on corruption

;; Memory Alarm in Self-Healing
(defmethod check-memory-invariant ((evaluator omega-evaluator-v13-theta))
  (when (> (sb-ext:bytes-consed-between-gcs) #.(* 6 1024 1024 1024))
    (warn "Memory usage exceeds 6GB soft limit")))

;; GC Tuning for 20-year operation
(setf (sb-ext:bytes-consed-between-gcs) 100000000)  ; 100MB
```

#### **4.0.5 Code Style & Linting**
```lisp
;; Style Requirements
(defparameter *style-rules*
  '(:max-line-length 80
    :indent-style :standard
    :naming-convention :lisp-case
    :documentation :mandatory))

;; Pre-commit Hook
(defun check-style-compliance (file)
  "Zero tolerance for style warnings"
  (handler-case
      (compile-file file :print nil :verbose nil)
    (style-warning (w)
      (error "Style warning: ~A" w))))

;; .editorconfig (root of project)
; [*.lisp]
; indent_style = space
; indent_size = 2
; max_line_length = 80
; trim_trailing_whitespace = true
```

### **4.1 Lisp Power Requirements (90%)**
```lisp
;; MUST USE:
- CLOS with MOP (100% usage)
  * metaclass funcallable-standard-class
  * update-instance-for-redefined-class
- Condition system (100% usage)
  * define-condition for all error types
  * restart-case for self-healing
- Macros (95% usage)
  * Code-walking macros
  * with-* style wrappers
- Generic functions with method combination
  * method-combination progn for validators
- Multiple values for all complex returns
- First-class functions & closures
- Dynamic variables (*evaluator*, *depth*)
- Compiler macros where applicable

;; MUST IMPLEMENT:
(defclass omega-evaluator-v13-theta ()
  (...)
  (:metaclass funcallable-standard-class))
```

### **4.2 Quality Standards**
```lisp
;; EVERY function must have:
(defun example-function (args)
  "Docstring explaining purpose"         ; MANDATORY
  (declare (type ...))                   ; Type declarations
  (check-type ...)                       ; Runtime type checking
  ;; Implementation
  )

;; EVERY class slot must have:
:type        ; Type specification
:initform    ; Default value
:accessor    ; or :reader/:writer
:documentation ; Explaining purpose
```

### **4.3 Interface Preservation**
```lisp
;; These interfaces CANNOT change after implementation:
- Port registry signature
- Introspection API returns
- Fingerprint slot list
- Reflection hook protocol
- Sandbox macro signature

;; Mark with:
(declaim (inline never-change))  ; For critical functions
:allocation :class                ; For immutable slots
```

---

## **V. SESSION CONTINUITY PROTOCOL**

### **5.1 End of Session Checklist**
```markdown
□ Update STATE.md with current progress
□ Commit all code to PROGRESS/ directory
□ Document any technical decisions in NOTES/
□ Run test suite - record coverage %
□ Verify critical interfaces unchanged
□ Check Lisp power utilization %
□ Write NEXT STEPS in explicit detail
□ Save any REPL experiments to experiments.lisp
```

### **5.2 Handoff Template**
```markdown
## Session [N] Handoff

### What I Did
- [Specific accomplishments]
- [Files modified]
- [Tests written]
- [Interfaces defined]

### Current Problem
- [Exact problem being solved]
- [Attempted approach]
- [Why it's challenging]

### Next Action
- [EXACTLY what to code next]
- [Which file, which function]
- [Expected outcome]

### Critical Interfaces Status
- Fingerprint slots: [DEFINED/TODO]
- Introspection: [DEFINED/TODO]
- Port registry: [DEFINED/TODO]
- Reflection hooks: [DEFINED/TODO]

### Watch Out For
- [Any tricky parts]
- [Potential issues]
- [Things that might break]
- [Interfaces that CANNOT change]
```

---

## **VI. TECHNICAL DECISIONS RECORD [UPDATED]**

### **Already Decided (DO NOT CHANGE)**
1. **Language**: SBCL Common Lisp 2.3.0+ (or CCL 1.12+)
2. **Architecture**: Sealed substrate with external modules
3. **Core Features**:
   - Full metacircularity
   - Paraconsistent contradiction handling
   - Self-healing with invariants
   - Lazy infinite recursion
   - Reflection hooks (NO implementation)
4. **Integrity**: SHA3-512 + Merkle trees
5. **Interfaces**: Must define all non-reversible points early
6. **No compromises on quality**

### **What is OUTSIDE the Evaluator**
- Chain of Reflection → External via hooks
- Metagraph of Reflection → External module
- Legal reasoning → Domain modules
- Strategy/Victory → Application modules
- Memory/Persistence → External store

### **Open Decisions (Document When Made)**
- Specific MOP patterns beyond funcallable-standard-class
- Full sandbox implementation (stub exists)
- Persistence connection protocol
- Performance optimizations

---

## **VII. DANGER ZONES & CRITICAL PATHS**

### **Never Do This**
```lisp
;; ❌ NEVER implement Chain of Reflection inside
;; ❌ NEVER add domain logic to evaluator
;; ❌ NEVER change critical interface signatures
;; ❌ NEVER skip the non-reversible definitions
;; ❌ NEVER reduce Lisp usage for "simplicity"
;; ❌ NEVER skip test writing
;; ❌ NEVER break sealed substrate principle
;; ❌ NEVER ignore contradiction handling
```

### **Always Do This**
```lisp
;; ✓ ALWAYS define critical interfaces first
;; ✓ ALWAYS use MOP when applicable
;; ✓ ALWAYS write production-grade code
;; ✓ ALWAYS maintain 90% Lisp power usage
;; ✓ ALWAYS test before proceeding
;; ✓ ALWAYS preserve metacircularity
;; ✓ ALWAYS update STATE.md
;; ✓ ALWAYS keep domain logic external
```

---

## **VIII. VERIFICATION CHECKLIST**

### **Before Proceeding Past Session 3**
```markdown
□ All critical non-reversible interfaces defined
□ Fingerprint slots specified and locked
□ Introspection API complete
□ Port registry functional
□ Reflection hooks in place
□ Sandbox stub defined
□ Thread safety considered
```

### **Before Claiming Completion**
```markdown
□ All classes defined with full CLOS/MOP usage
□ Metacircular self-evaluation works
□ Can handle (and A (not A)) without crashing
□ Self-healing repairs corruption
□ Reflection HOOKS operational (no chain inside)
□ Cryptographic signatures verified
□ 100% test coverage achieved
□ 90% Lisp power utilized
□ Documentation complete
□ All critical interfaces immutable
□ Production-grade quality throughout
```

---

## **IX. EMERGENCY PROTOCOLS**

### **If You Get Stuck**
1. Re-read the CORRECTED blueprint completely
2. Check if critical interfaces are defined
3. Verify you're not implementing external features
4. Ensure contradiction handling is present
5. Check you're using enough Lisp power
6. Write a test for what you expect
7. Document the issue in NOTES/blockers.md

### **If Previous Session Made Errors**
1. Check if error involves critical interfaces
2. If yes, STOP - these cannot change
3. Document error in NOTES/corrections.md
4. Write test that exposes the error
5. Fix with minimal changes
6. Re-run entire test suite
7. Update STATE.md with correction

---

## **X. SUCCESS CRITERIA**

### **You Are Done When**
1. **ALL** core components implemented
2. **ALL** critical interfaces defined and immutable
3. **100%** test coverage  
4. **90%** Lisp power utilized
5. **Zero** domain logic inside
6. **Zero** compromises made
7. System can **evaluate itself** without crashing
8. Can handle **contradictions** gracefully
9. **Self-heals** from corruption
10. **Reflection hooks** work (for external systems)
11. Ready for **seal-evaluator** call
12. Ready for **Ministry of Justice** deployment

---

## **XI. FINAL REMINDERS**

### **This Is Not Academic**
- Real citizens need this for justice
- It must enable defeating 100+ lawyers
- No compromises, no shortcuts
- Production-grade from line 1

### **You Are Building**
- A sealed computational substrate
- NOT a complete system (that needs modules)
- The foundation for legal equality
- A TRUE Level 12 evaluator
- Something that will run for 20+ years unchanged

### **Critical Points**
- Define non-reversible interfaces FIRST
- Keep ALL application logic OUTSIDE
- The evaluator is domain-agnostic
- Chain of Reflection is EXTERNAL
- Test everything, compromise nothing

### **Standards**
- Would DARPA approve this?
- Would MIT be impressed?
- Would the Ministry trust this with justice?
- Can it survive 20 years without changes?

If any answer is "no", **keep working**.

---

**USE THIS GUIDE EVERY SESSION**

**MAINTAIN THE STANDARD**

**BUILD THE FOUNDATION OF JUSTICE**

**Ω-EVALUATOR v13-Θ: SEALED SUBSTRATE**

**NO COMPROMISES**