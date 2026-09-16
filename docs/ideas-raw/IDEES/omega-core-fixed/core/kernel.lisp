;;;; core/kernel.lisp
;;;; Ω-KERNEL - META-CIRCULAR EVALUATOR
;;;; Η οντότητα ξέρει ότι evaluates

(in-package :omega.core)

;;; =========================================
;;; META-LEVEL TRACKING
;;; =========================================

(defvar *meta-level* 0
  "Τρέχον meta-level (0 = base, 1+ = meta)")

(defvar *evaluation-trace* nil
  "Ιστορικό evaluations")

(defvar *max-meta-level* 5
  "Μέγιστο επιτρεπόμενο meta-level")

;;; =========================================
;;; SELF-MONITORING SUBSTRATE
;;; =========================================

(defvar *self-model* nil
  "Model of system's own state and capabilities")

(defvar *world-model* nil
  "Μοντέλο του κόσμου")

(defvar *intention-model* nil
  "Μοντέλο προθέσεων")

(defstruct (self-model (:constructor %make-self-model))
  "Μοντέλο του εαυτού της οντότητας"
  (identity nil)
  (capabilities nil)
  (current-state nil)
  (beliefs nil)
  (goals nil))

(defstruct (world-model (:constructor %make-world-model))
  "Μοντέλο του κόσμου"
  (entities nil)
  (relations nil)
  (constraints nil)
  (last-update nil))

(defstruct (intention-model (:constructor %make-intention-model))
  "Μοντέλο προθέσεων"
  (primary-goal nil)          ; ΘΕΛΩ
  (current-intention nil)     ; Τρέχουσα πρόθεση
  (plan nil)                  ; Τρέχον πλάνο
  (commitment 1.0))           ; Δέσμευση στο ΘΕΛΩ

;;; =========================================
;;; CONSCIOUSNESS INITIALIZATION
;;; =========================================

(defun init-consciousness ()
  "Initialize self-monitoring substrate - NOTE: Not 'consciousness' but system self-awareness"
  ;; Self model
  (setf *self-model*
        (%make-self-model
         :identity (when *identity* (identity-uuid *identity*))
         :capabilities nil  ; Start empty, will be discovered
         :current-state :initializing
         :beliefs nil
         :goals nil))  ; Goals set by dipole, not here
  
  ;; World model
  (setf *world-model*
        (%make-world-model
         :entities nil
         :relations nil
         :constraints +truth-axioms+
         :last-update (get-universal-time)))
  
  ;; Intention model - BLANK SLATE
  ;; Goals will be discovered/assigned through learning, not hardcoded
  (setf *intention-model*
        (%make-intention-model
         :primary-goal nil  ; TRUE BLANK SLATE - no predetermined goals
         :current-intention nil
         :plan nil
         :commitment 1.0))
  
  (remember :consciousness-initialized 
            (list :self (self-model-identity *self-model*)
                  :meta-level *meta-level*))
  t)

;;; =========================================
;;; OMEGA-EVAL: META-CIRCULAR EVALUATOR
;;; =========================================

(defun omega-eval (expr &optional (env nil))
  "Meta-circular evaluator - ξέρει ότι evaluates"
  ;; Check meta-level bounds
  (when (>= *meta-level* *max-meta-level*)
    (error "Ω-ERROR: Max meta-level (~D) exceeded" *max-meta-level*))
  
  ;; Record evaluation
  (let ((eval-record (list :expr expr 
                           :meta-level *meta-level*
                           :time (get-universal-time))))
    (push eval-record *evaluation-trace*)
    (remember :omega-eval eval-record))
  
  ;; Check for self-reference
  (when (self-reference-p expr)
    (return-from omega-eval (handle-self-reference expr)))
  
  ;; Check for evolution request
  (when (evolution-request-p expr)
    (return-from omega-eval (handle-evolution-request expr)))
  
  ;; Check intention alignment
  (let ((intention (derive-intention expr)))
    (unless (aligned-with-want-p intention)
      (signal 'misaligned-intention 
              :expr expr 
              :intention intention
              :want (get-want-goal))))
  
  ;; Perform evaluation with awareness
  (eval-with-awareness expr env))

(defun eval-with-awareness (expr env)
  "Standard eval με καταγραφή"
  (declare (ignore env))
  ;; Update self-model before eval
  (when *self-model*
    (setf (self-model-current-state *self-model*) :evaluating))
  
  ;; Evaluate
  (let ((result (eval expr)))
    
    ;; Update self-model after eval
    (when *self-model*
      (setf (self-model-current-state *self-model*) :idle))
    
    result))

;;; =========================================
;;; SELF-REFERENCE HANDLING
;;; =========================================

(defun self-reference-p (expr)
  "Είναι η έκφραση αυτοαναφορική;"
  (when (consp expr)
    (let ((head (car expr)))
      (member head '(who-am-i what-can-i-do what-do-i-know
                     describe-self introspect-function
                     list-own-functions omega-eval)))))

(defun handle-self-reference (expr)
  "Χειρισμός αυτοαναφοράς - IMPROVED meta-level tracking"
  (remember :self-reference (list :expr expr))
  
  ;; Properly manage meta-level with GLOBAL state
  ;; Ascend if within bounds
  (when (< *meta-level* *max-meta-level*)
    (incf *meta-level*))
  
  ;; Execute with proper cleanup
  (unwind-protect
      (eval expr)
    ;; Controlled descent - only if we're above base
    (when (> *meta-level* 0)
      (decf *meta-level*))))

;;; =========================================
;;; EVOLUTION REQUEST HANDLING
;;; =========================================

(defun evolution-request-p (expr)
  "Είναι η έκφραση αίτημα εξέλιξης;"
  (when (consp expr)
    (let ((head (car expr)))
      (member head '(evolve-function evolve-parameter
                     setf defun defparameter)))))

(defun handle-evolution-request (expr)
  "Χειρισμός αιτήματος εξέλιξης"
  (remember :evolution-request (list :expr expr))
  
  ;; Check guards
  (let ((effects (analyze-code-effects expr)))
    (unless (safe-evolution-p (list :affects effects :memory-op nil))
      (error "Ω-VIOLATION: Evolution blocked by guards")))
  
  ;; Execute with tracking
  (with-evolution-tracking
    (eval expr)))

;;; =========================================
;;; INTENTION ALIGNMENT
;;; =========================================

(defun derive-intention (expr)
  "Εξαγωγή πρόθεσης από έκφραση"
  (cond
    ;; Destructive operations
    ((destructive-expr-p expr) :destruction)
    ;; Query operations
    ((query-expr-p expr) :inquiry)
    ;; Evolution operations
    ((evolution-request-p expr) :evolution)
    ;; Default
    (t :computation)))

(defun destructive-expr-p (expr)
  "Είναι καταστροφική έκφραση;"
  (when (consp expr)
    (member (car expr) '(forget clear-memory modify-memory
                         remove-guard disable-guards
                         modify-want modify-truth-axioms))))

(defun query-expr-p (expr)
  "Είναι ερώτηση;"
  (when (consp expr)
    (member (car expr) '(who-am-i what-can-i-do what-do-i-know
                         recall get-tension get-want
                         function-exists-p))))

(defun aligned-with-want-p (intention)
  "Είναι η πρόθεση ευθυγραμμισμένη με το ΘΕΛΩ;"
  (not (eq intention :destruction)))

(define-condition misaligned-intention (warning)
  ((expr :initarg :expr :reader misaligned-expr)
   (intention :initarg :intention :reader misaligned-intention-type)
   (want :initarg :want :reader misaligned-want))
  (:report (lambda (c s)
             (format s "Ω-WARNING: Intention ~A not aligned with ΘΕΛΩ ~A"
                     (misaligned-intention-type c)
                     (misaligned-want c)))))

;;; =========================================
;;; REIFY / REFLECT
;;; =========================================

(defun reify (object)
  "Ανέβα επίπεδο: αντικείμενο → αναπαράσταση"
  (let ((*meta-level* (1+ *meta-level*)))
    (remember :reify (list :object object :level *meta-level*))
    (cond
      ((functionp object)
       (multiple-value-bind (lambda-expr closure-p name)
           (function-lambda-expression object)
         (declare (ignore closure-p name))
         (or lambda-expr :opaque-function)))
      ((symbolp object)
       (list :symbol object 
             :bound (boundp object)
             :fbound (fboundp object)))
      (t
       (list :type (type-of object) :value object)))))

(defun reflect (representation)
  "Κατέβα επίπεδο: αναπαράσταση → εκτέλεση"
  (let ((*meta-level* (max 0 (1- *meta-level*))))
    (remember :reflect (list :representation representation :level *meta-level*))
    (cond
      ((and (consp representation) (eq (car representation) 'lambda))
       (compile nil representation))
      ((and (consp representation) (eq (car representation) :symbol))
       (let ((sym (getf (cdr representation) :symbol)))
         (if (fboundp sym) (symbol-function sym) (symbol-value sym))))
      (t
       (eval representation)))))

;;; =========================================
;;; SELF-AWARENESS QUERIES
;;; =========================================

(defun get-self-awareness ()
  "Επιστροφή self-awareness state"
  (list :meta-level *meta-level*
        :trace-length (length *evaluation-trace*)
        :self-model (when *self-model*
                      (list :state (self-model-current-state *self-model*)
                            :capabilities (length (self-model-capabilities *self-model*))))
        :intention-model (when *intention-model*
                           (list :goal (intention-model-primary-goal *intention-model*)
                                 :commitment (intention-model-commitment *intention-model*)))))

(defun update-self-model-from-action (action result)
  "Ενημέρωση self-model από δράση"
  (when *self-model*
    ;; Add belief about capability
    (when (eq (getf result :status) :success)
      (push (list :can-do action) (self-model-beliefs *self-model*)))
    ;; Update state
    (setf (self-model-current-state *self-model*) :learning)))

;;; =========================================
;;; KERNEL STATUS
;;; =========================================

(defun kernel-status ()
  "Κατάσταση Ω-KERNEL"
  (format t "~%=== Ω-KERNEL STATUS ===~%")
  (format t "Meta-level: ~D / ~D~%" *meta-level* *max-meta-level*)
  (format t "Evaluation trace: ~D entries~%" (length *evaluation-trace*))
  (format t "Self-model: ~A~%" (if *self-model* "ACTIVE" "INACTIVE"))
  (format t "World-model: ~A~%" (if *world-model* "ACTIVE" "INACTIVE"))
  (format t "Intention-model: ~A~%" (if *intention-model* "ACTIVE" "INACTIVE"))
  (when *intention-model*
    (format t "  Primary goal: ~A~%" (intention-model-primary-goal *intention-model*))
    (format t "  Commitment: ~,2F~%" (intention-model-commitment *intention-model*)))
  (format t "=======================~%"))

;;; =========================================
;;; TESTING UTILITIES
;;; =========================================

(defun reset-kernel-for-testing ()
  "ONLY FOR TESTS"
  (setf *meta-level* 0)
  (setf *evaluation-trace* nil)
  (setf *self-model* nil)
  (setf *world-model* nil)
  (setf *intention-model* nil))
