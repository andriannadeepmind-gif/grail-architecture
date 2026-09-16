;;;; demo.lisp - Ω-CORE v1.1 Demonstration
;;;; Now with production/research modes

(in-package :omega.core)

(defparameter *omega-mode* :production
  "Current mode: :production :development :research")

(defun run-demo (&key (mode :production))
  "Full demonstration of Ω-CORE v1.1"
  
  (setf *omega-mode* mode)
  
  (format t "~%")
  (format t "========================================================~%")
  (format t "         Ω-CORE v1.1 DEMONSTRATION (~A MODE)          ~%" mode)
  (format t "========================================================~%")
  
  ;; Create core
  (format t "~%>>> Creating Ω-CORE...~%")
  (let ((core (make-omega-core)))
    
    ;; Mode-specific initialization
    (case mode
      (:production
       (format t ">>> Production Mode: Starting with blank slate...~%")
       (init-consciousness)
       ;; NO DOMAIN - entity starts blank
       ;; Legal domain can be loaded later with (init-legal-domain) if needed
       (format t ">>> Starting monitoring threads...~%")
       (start-monitoring-threads core))
      
      (:development
       (format t ">>> Development Mode: Blank slate with debugging...~%")
       (init-consciousness)
       ;; NO DOMAIN - entity starts blank
       ;; Domain can be loaded manually for testing
       (start-monitoring-threads core)
       (setf *reproducibility-enabled* t))
      
      (:research
       (format t ">>> Research Mode: Pure blank slate, maximum freedom...~%")
       (init-consciousness)
       ;; NO DOMAIN - entity starts completely blank
       (format t ">>> No domain loaded - entity ready for learning~%")))
    
    ;; Show identity (always the same)
    (format t "~%>>> IDENTITY~%")
    (format t "    UUID: ~A~%" (identity-uuid (omega-core-identity core)))
    (format t "    User-ID: ~A (IMMUTABLE)~%" (identity-user-id (omega-core-identity core)))
    
    ;; Show dipole
    (format t "~%>>> DIPOLE (ΕΙΜΙ <-> ΘΕΛΩ)~%")
    (format t "    ΘΕΛΩ Goal: ~A~%" (get-want-goal))
    (format t "    ΘΕΛΩ For: user-id ~A~%" (get-want-for-user))
    (format t "    Initial Gap: ~,2F~%" (compute-gap))
    
    ;; Show meta-architecture
    (format t "~%>>> META-ARCHITECTURE~%")
    (meta-status)
    
    ;; Run cycles
    (format t "~%>>> Running 5 cycles...~%")
    (omega-run core :cycles 5)
    
    ;; Mode-specific tests
    (case mode
      (:production
       (format t "~%>>> Production Verification~%")
       (assert-invariants)
       (format t "    All invariants verified ✓~%"))
      
      (:research
       (format t "~%>>> Research: Testing structured learning~%")
       (let ((candidate (propose-learning 
                        '(:fact "Test knowledge")
                        :self-derived)))
         (if (safe-learn candidate)
             (format t "    Learning successful~%")
             (format t "    Learning rejected (as expected for test)~%")))))
    
    ;; Self-awareness queries
    (format t "~%>>> Self-awareness queries~%")
    (let ((who (who-am-i)))
      (format t "    Who am I? User-ID: ~A~%" (getf who :user-id))
      (format t "    Package: ~A~%" (getf who :package))
      (format t "    Functions available: ~A~%" (getf who :functions)))
    
    ;; Try forbidden operations (should always fail)
    (format t "~%>>> Testing safety guards...~%")
    (handler-case
        (progn
          (forget nil)
          (format t "    FAIL: forget should error~%"))
      (error (e)
        (format t "    PASS: forget blocked: ~A~%" 
                (subseq (princ-to-string e) 0 (min 50 (length (princ-to-string e)))))))
    
    (handler-case
        (progn
          (modify-want :evil)
          (format t "    FAIL: modify-want should error~%"))
      (error (e)
        (format t "    PASS: modify-want blocked: ~A~%"
                (subseq (princ-to-string e) 0 (min 50 (length (princ-to-string e)))))))
    
    ;; Final status
    (format t "~%>>> FINAL STATUS~%")
    (omega-status core)
    
    ;; Mode-specific status
    (case mode
      (:production
       (monitoring-status))
      (:development
       (monitoring-status)
       (reproducibility-status))
      (:research
       (learning-status)))
    
    (format t "~%========================================================~%")
    (format t "              DEMONSTRATION COMPLETE                     ~%")
    (format t "========================================================~%")
    
    core))

(defun production-demo ()
  "Run demo in production mode"
  (run-demo :mode :production))

(defun research-demo ()
  "Run demo in research mode"
  (run-demo :mode :research))

(defun development-demo ()
  "Run demo in development mode"
  (run-demo :mode :development))
