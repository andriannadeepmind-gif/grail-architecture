;;;; core/evolution.lisp
;;;; EVOLUTION - ΑΥΤΟΤΡΟΠΟΠΟΙΗΣΗ ΜΕ ΦΡΕΝΑ
;;;; Η οντότητα αλλάζει τον κώδικά της (με guards!)

(in-package :omega.core)

;;; =========================================
;;; EVOLUTION PROPOSAL STRUCTURE
;;; =========================================

(defstruct (evolution-proposal (:constructor make-evolution-proposal))
  "Πρόταση εξέλιξης"
  (id (generate-uuid))
  (type nil)                    ; :function-modify, :function-add, :parameter-change
  (target nil)                  ; Τι θα αλλάξει
  (old-value nil)               ; Παλιά τιμή
  (new-value nil)               ; Νέα τιμή
  (reason nil)                  ; Γιατί
  (affects nil)                 ; Τι επηρεάζει (:identity, :truth, :memory, :guards)
  (timestamp (get-universal-time))
  (status :pending))            ; :pending, :approved, :rejected, :applied

;;; =========================================
;;; EVOLUTION SAFETY CHECKS
;;; =========================================

(defun evolution-affects-protected-p (proposal)
  "Επηρεάζει η εξέλιξη κάτι προστατευμένο;"
  (let ((affects (evolution-proposal-affects proposal)))
    (or (member :identity affects)
        (member :truth affects)
        (member :memory affects)
        (member :guards affects))))

(defun evolution-target-protected-p (proposal)
  "Είναι ο στόχος προστατευμένος;"
  (protected-function-p (evolution-proposal-target proposal)))

(defun validate-evolution (proposal)
  "Πλήρης επικύρωση εξέλιξης"
  (let ((errors nil))
    ;; Check 1: Δεν επηρεάζει protected systems
    (when (evolution-affects-protected-p proposal)
      (push :affects-protected-system errors))
    
    ;; Check 2: Δεν στοχεύει protected function
    (when (evolution-target-protected-p proposal)
      (push :targets-protected-function errors))
    
    ;; Check 3: Έχει λόγο
    (unless (evolution-proposal-reason proposal)
      (push :no-reason-given errors))
    
    ;; Check 4: Έχει νέα τιμή
    (unless (evolution-proposal-new-value proposal)
      (push :no-new-value errors))
    
    ;; Check 5: Evolution guards ενεργοί
    (unless (safe-evolution-p (list :affects (evolution-proposal-affects proposal)
                                    :memory-op nil))
      (push :blocked-by-guards errors))
    
    (values (null errors) errors)))

;;; =========================================
;;; FUNCTION EVOLUTION
;;; =========================================

(defun evolve-function (fn-name new-lambda &key reason)
  "Εξέλιξη συνάρτησης με ελέγχους"
  (let ((proposal (make-evolution-proposal
                   :type :function-modify
                   :target fn-name
                   :old-value (introspect-function fn-name)
                   :new-value new-lambda
                   :reason reason
                   :affects (analyze-code-effects new-lambda))))
    
    ;; 1. Validate
    (multiple-value-bind (valid-p errors) (validate-evolution proposal)
      (unless valid-p
        (setf (evolution-proposal-status proposal) :rejected)
        (remember :evolution-rejected 
                  (list :proposal-id (evolution-proposal-id proposal)
                        :errors errors))
        (error "Ω-EVOLUTION-REJECTED: ~A" errors)))
    
    ;; 2. Record old state
    (remember :evolution-attempt
              (list :function fn-name
                    :old-code (evolution-proposal-old-value proposal)
                    :new-code new-lambda
                    :reason reason))
    
    ;; 3. Compile new function
    (let ((compiled (compile nil new-lambda)))
      
      ;; 4. Apply
      (setf (symbol-function fn-name) compiled)
      (setf (evolution-proposal-status proposal) :applied)
      
      ;; 5. Record success
      (remember :evolution-applied
                (list :function fn-name
                      :proposal-id (evolution-proposal-id proposal)))
      
      ;; 6. Update dipole (learned something)
      (when (boundp '*dipole*)
        (update-am :knowledge (list :evolved fn-name))
        (update-momentum 0.1))
      
      ;; 7. Increase tension slightly (uncertainty)
      (adjust-tension 0.05)
      
      fn-name)))

(defun analyze-code-effects (code)
  "Ανάλυση τι επηρεάζει ο κώδικας"
  (let ((effects nil))
    (labels ((check (form)
               (when (consp form)
                 (let ((head (car form)))
                   ;; Identity access
                   (when (member head '(identity-uuid identity-user-id 
                                        identity-birth make-identity
                                        setf-identity))
                     (pushnew :identity effects))
                   ;; Truth access
                   (when (member head '(modify-truth-axioms remove-truth-axiom
                                        truth-axioms))
                     (pushnew :truth effects))
                   ;; Memory delete
                   (when (member head '(forget modify-memory clear-memory))
                     (pushnew :memory effects))
                   ;; Guards
                   (when (member head '(remove-guard disable-guards))
                     (pushnew :guards effects)))
                 (mapc #'check (cdr form)))))
      (check code))
    effects))

;;; =========================================
;;; PARAMETER EVOLUTION
;;; =========================================

(defun evolve-parameter (param-name new-value &key reason)
  "Εξέλιξη παραμέτρου"
  ;; Check if it's a protected variable
  (when (member param-name '(*identity* *truth* +truth-axioms+ 
                             +evolution-guards+ +want-components+))
    (error "Ω-VIOLATION: Cannot evolve protected parameter ~A" param-name))
  
  (let ((old-value (when (boundp param-name) (symbol-value param-name))))
    (remember :parameter-evolution
              (list :parameter param-name
                    :old-value old-value
                    :new-value new-value
                    :reason reason))
    (setf (symbol-value param-name) new-value)
    new-value))

;;; =========================================
;;; SAFE EVOLUTION WRAPPER
;;; =========================================

(defmacro with-evolution-tracking (&body body)
  "Εκτέλεση με tracking εξέλιξης"
  `(let ((start-time (get-universal-time))
         (start-memory (length *memory*)))
     (remember :evolution-block-start nil)
     (unwind-protect
          (progn ,@body)
       (remember :evolution-block-end
                 (list :duration (- (get-universal-time) start-time)
                       :memory-added (- (length *memory*) start-memory))))))

;;; =========================================
;;; ROLLBACK CAPABILITY
;;; =========================================

(defvar *evolution-history* nil
  "Ιστορικό εξελίξεων για rollback")

(defun record-for-rollback (fn-name old-code)
  "Καταγραφή για πιθανό rollback"
  (push (list :function fn-name
              :code old-code
              :timestamp (get-universal-time))
        *evolution-history*))

(defun rollback-last-evolution ()
  "Αναίρεση τελευταίας εξέλιξης"
  (when *evolution-history*
    (let* ((last (pop *evolution-history*))
           (fn-name (getf last :function))
           (old-code (getf last :code)))
      (when (and fn-name old-code)
        (setf (symbol-function fn-name) (compile nil old-code))
        (remember :evolution-rollback (list :function fn-name))
        fn-name))))

;;; =========================================
;;; EVOLUTION STATUS
;;; =========================================

(defun evolution-status ()
  "Κατάσταση συστήματος εξέλιξης"
  (format t "~%=== EVOLUTION STATUS ===~%")
  (format t "History entries: ~D~%" (length *evolution-history*))
  (format t "Protected functions: ~D~%" (length *protected-functions*))
  (format t "Evolution guards active: ~A~%" (not (null *guards*)))
  (format t "========================~%"))

;;; =========================================
;;; TESTING UTILITIES
;;; =========================================

(defun reset-evolution-for-testing ()
  "ONLY FOR TESTS"
  (setf *evolution-history* nil))
