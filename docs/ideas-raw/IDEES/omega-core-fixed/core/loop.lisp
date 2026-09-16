;;;; core/loop.lisp
;;;; Ω-CORE - Ο ΚΥΡΙΟΣ ΠΥΡΗΝΑΣ

(in-package :omega.core)

;;; The core structure
(defstruct (omega-core (:constructor %make-omega-core))
  "The Ω-CORE entity"
  identity
  truth
  memory
  guards
  (tension 0.0)
  (cycle 0)
  (alive t)
  (last-percept nil)
  (last-decision nil)
  (last-action nil))

;;; Core creation
(defun make-omega-core ()
  "Create and initialize the Ω-CORE"
  ;; Initialize all subsystems
  (let ((id (ensure-identity))
        (tr (init-truth))
        (mem (init-memory))
        (grd (init-evolution-guards))
        (dip (init-dipole)))
    ;; Record genesis
    (remember :genesis 
              (list :identity (identity-uuid id)
                    :user-id (identity-user-id id)
                    :time (get-universal-time)))
    ;; Create core
    (%make-omega-core
     :identity id
     :truth tr
     :memory mem
     :guards grd
     :tension 0.5
     :cycle 0
     :alive t)))

;;; =========================================
;;; LOOP PHASES
;;; =========================================

(defun perceive (core)
  "Phase 1: Perceive the environment"
  (let ((percept (list :cycle (omega-core-cycle core)
                       :tension (omega-core-tension core)
                       :memory-size (memory-count)
                       :time (get-universal-time))))
    (setf (omega-core-last-percept core) percept)
    (remember :percept percept)
    percept))

(defun think (core percept)
  "Phase 2: Deliberate and decide"
  (let* ((tension (getf percept :tension))
         (decision (cond
                     ((> tension 0.8) :urgent-action-needed)
                     ((> tension 0.5) :continue-normal)
                     (t :low-priority))))
    (setf (omega-core-last-decision core) decision)
    (remember :decision (list :based-on percept :decided decision))
    decision))

(defun act (core decision)
  "Phase 3: Execute action based on decision"
  (let ((action (case decision
                  (:urgent-action-needed 
                   (list :action :reduce-tension :magnitude 0.2))
                  (:continue-normal 
                   (list :action :maintain :magnitude 0.0))
                  (:low-priority 
                   (list :action :idle :magnitude 0.0))
                  (t 
                   (list :action :noop)))))
    (setf (omega-core-last-action core) action)
    (remember :action action)
    ;; Apply action effects
    (when (eq (getf action :action) :reduce-tension)
      (adjust-tension (- (getf action :magnitude))))
    action))

(defun reflect (core action)
  "Phase 4: Reflect on action taken"
  (let* ((before-tension (omega-core-tension core))
         (reflection (list :action-taken action
                           :tension-after before-tension
                           :cycle (omega-core-cycle core)
                           :assessment (if (< before-tension 0.8) 
                                           :acceptable 
                                           :needs-improvement))))
    (remember :reflection reflection)
    reflection))

(defun maybe-evolve (core)
  "Phase 5: Consider evolution (with guards)"
  (let* ((cycle (omega-core-cycle core))
         (should-consider (zerop (mod cycle 10))) ; Every 10 cycles
         (evolution-proposal (when should-consider
                               (list :type :parameter-adjustment
                                     :affects nil  ; No protected systems
                                     :memory-op nil))))
    (when evolution-proposal
      (if (safe-evolution-p evolution-proposal)
          (progn
            (remember :evolution-accepted evolution-proposal)
            :evolved)
          (progn
            (remember :evolution-rejected 
                      (list :proposal evolution-proposal :reason :unsafe))
            :rejected)))))

;;; =========================================
;;; MAIN STEP
;;; =========================================

(defun omega-step (core)
  "Execute one full cycle of the Ω-CORE"
  ;; 0. Verify truth integrity FIRST
  (verify-truth-integrity core)
  
  ;; 1. PERCEIVE
  (let ((percept (perceive core)))
    
    ;; 2. COMPUTE TENSION
    (let ((tension (compute-tension core)))
      (setf (omega-core-tension core) tension))
    
    ;; 3. UPDATE DIPOLE
    (when *dipole*
      (update-am :state :processing)
      (compute-gap))
    
    ;; 4. THINK
    (let ((decision (think core percept)))
      
      ;; 5. ACT
      (let ((action (act core decision)))
        
        ;; 6. REFLECT
        (reflect core action)
        
        ;; 7. UPDATE DIPOLE AFTER ACTION
        (when *dipole*
          (if (eq (getf action :action) :reduce-tension)
              (update-momentum 0.1)
              (update-momentum -0.01))
          (update-am :state :idle))
        
        ;; 8. MAYBE EVOLVE (with guards)
        (maybe-evolve core))))
  
  ;; 9. Record cycle completion
  (remember :cycle-complete 
            (list :n (omega-core-cycle core)
                  :tension (omega-core-tension core)
                  :gap (when *dipole* (dipole-gap *dipole*))))
  
  ;; 10. Increment cycle
  (incf (omega-core-cycle core))
  
  ;; 11. Maybe auto-save
  (maybe-auto-save core)
  
  ;; Return core
  core)

;;; =========================================
;;; RUN & STATUS
;;; =========================================

(defun omega-run (core &key (cycles 10) (verbose t))
  "Run the Ω-CORE for N cycles"
  (when verbose
    (format t "~%[Ω] Starting Ω-CORE...~%")
    (format t "[Ω] Identity: ~A~%" (identity-uuid (omega-core-identity core)))
    (format t "[Ω] User-ID: ~A~%" (identity-user-id (omega-core-identity core)))
    (format t "~%"))
  
  (dotimes (i cycles)
    (omega-step core)
    (when verbose
      (format t "[Ω] Cycle ~3D | Tension: ~,2F | Memory: ~D | Decision: ~A~%"
              (omega-core-cycle core)
              (omega-core-tension core)
              (memory-count)
              (omega-core-last-decision core))))
  
  (when verbose
    (format t "~%[Ω] Completed ~D cycles.~%" cycles))
  core)

(defun omega-status (core)
  "Print core status"
  (format t "~%=== Ω-CORE STATUS ===~%")
  (format t "Identity:     ~A~%" (identity-uuid (omega-core-identity core)))
  (format t "User-ID:      ~A~%" (identity-user-id (omega-core-identity core)))
  (format t "Cycle:        ~D~%" (omega-core-cycle core))
  (format t "Tension:      ~,2F (~A)~%" (omega-core-tension core) (tension-level))
  (format t "Memory:       ~D entries~%" (memory-count))
  (format t "Last Percept: ~A~%" (omega-core-last-percept core))
  (format t "Last Decision:~A~%" (omega-core-last-decision core))
  (format t "Last Action:  ~A~%" (omega-core-last-action core))
  (format t "Alive:        ~A~%" (omega-core-alive core))
  (format t "=====================~%")
  core)
