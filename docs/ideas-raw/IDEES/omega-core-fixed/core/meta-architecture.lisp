;;;; core/meta-architecture.lisp
;;;; META-LEVEL ARCHITECTURE - Clear definitions and rules
;;;; NOT "consciousness" - but structured reasoning levels

(in-package :omega.core)

;;; =========================================
;;; META-LEVEL DEFINITIONS
;;; =========================================

(defconstant +META-LEVEL-RULES+
  '((0 :object-reasoning 
     :description "Direct reasoning about facts, laws, cases"
     :allowed (:facts :laws :logic :precedents)
     :forbidden (:modify-self :modify-strategy))
    
    (1 :strategy-reasoning
     :description "Reasoning about how to reason"  
     :allowed (:tactics :heuristics :plan-selection)
     :forbidden (:modify-axioms :modify-identity))
    
    (2 :strategy-evolution
     :description "Modifying reasoning strategies"
     :allowed (:modify-tactics :optimize-heuristics)
     :forbidden (:modify-truth :modify-guards))
    
    (3 :immutable-zone
     :description "Protected core - NO modifications allowed"
     :forbidden (:all-modifications)))
  "Strict hierarchy of meta-reasoning levels")

;;; =========================================
;;; META-LEVEL ENFORCEMENT
;;; =========================================

(defun meta-level-allowed-p (level operation)
  "Check if operation is allowed at this meta-level"
  (let ((rules (find level +META-LEVEL-RULES+ :key #'first)))
    (when rules
      (let ((allowed (getf (rest rules) :allowed))
            (forbidden (getf (rest rules) :forbidden)))
        (cond
          ((member :all-modifications forbidden) nil)
          ((member operation forbidden) nil)
          ((member operation allowed) t)
          (t nil))))))  ; Default deny

(defun enforce-meta-level-constraint (level operation)
  "Enforce meta-level constraints - throws error if violated"
  (unless (meta-level-allowed-p level operation)
    (error "Ω-META-VIOLATION: Operation ~A forbidden at meta-level ~D"
           operation level)))

;;; =========================================
;;; META-LEVEL TRANSITIONS
;;; =========================================

(defun can-ascend-p (from-level to-level reason)
  "Check if ascending from one meta-level to another is permitted"
  (cond
    ;; Can't go above 3
    ((>= to-level 3) nil)
    ;; Can't skip levels
    ((> (- to-level from-level) 1) nil)
    ;; Must have valid reason
    ((null reason) nil)
    ;; Self-reference allows ascent
    ((eq reason :self-reference) t)
    ;; Strategy change allows ascent to level 1
    ((and (= from-level 0) (= to-level 1)
          (eq reason :strategy-selection)) t)
    ;; Strategy evolution allows ascent to level 2  
    ((and (= from-level 1) (= to-level 2)
          (eq reason :strategy-modification)) t)
    (t nil)))

(defun safe-meta-ascend (reason)
  "Safely ascend one meta-level with reason"
  (when (can-ascend-p *meta-level* (1+ *meta-level*) reason)
    (incf *meta-level*)
    (remember :meta-ascend 
              (list :to *meta-level* 
                    :reason reason
                    :time (get-universal-time)))
    t))

(defun safe-meta-descend ()
  "Safely descend one meta-level"
  (when (> *meta-level* 0)
    (decf *meta-level*)
    (remember :meta-descend
              (list :to *meta-level*
                    :time (get-universal-time)))
    t))

;;; =========================================
;;; META-LEVEL INTROSPECTION
;;; =========================================

(defun current-meta-level-info ()
  "Get information about current meta-level"
  (let ((rules (find *meta-level* +META-LEVEL-RULES+ :key #'first)))
    (when rules
      (list :level *meta-level*
            :name (second rules)
            :description (getf (rest rules) :description)
            :allowed (getf (rest rules) :allowed)
            :forbidden (getf (rest rules) :forbidden)))))

(defun meta-level-audit-trail (&optional (limit 10))
  "Get recent meta-level transitions"
  (let ((transitions (recall :type :meta-ascend :limit limit))
        (descents (recall :type :meta-descend :limit limit)))
    (sort (append transitions descents)
          #'<
          :key (lambda (x) (getf (entry-content x) :time)))))

;;; =========================================
;;; META-LEVEL STATUS
;;; =========================================

(defun meta-status ()
  "Display meta-level architecture status"
  (format t "~%=== META-ARCHITECTURE STATUS ===~%")
  (format t "Current Level: ~D~%" *meta-level*)
  (let ((info (current-meta-level-info)))
    (when info
      (format t "Name: ~A~%" (getf info :name))
      (format t "Description: ~A~%" (getf info :description))
      (format t "Allowed: ~A~%" (getf info :allowed))
      (format t "Forbidden: ~A~%" (getf info :forbidden))))
  (format t "Max Level: 3 (immutable)~%")
  (format t "================================~%"))

;;; =========================================
;;; INTEGRATION WITH OMEGA-EVAL
;;; =========================================

(defun meta-aware-eval (expr &optional (env nil))
  "Evaluation that respects meta-level constraints"
  ;; Check what kind of operation this is
  (let ((operation-type (classify-operation expr)))
    ;; Enforce constraints
    (enforce-meta-level-constraint *meta-level* operation-type)
    ;; If allowed, proceed
    (omega-eval expr env)))

(defun classify-operation (expr)
  "Classify what kind of operation an expression represents"
  (when (consp expr)
    (let ((head (car expr)))
      (cond
        ;; Modifications to self
        ((member head '(setf defun defparameter defvar))
         (if (modifies-protected-p expr)
             :modify-axioms
             :modify-tactics))
        ;; Queries
        ((member head '(who-am-i what-can-i-do recall))
         :introspection)
        ;; Strategy operations
        ((member head '(select-strategy change-approach))
         :tactics)
        ;; Default
        (t :facts)))))

(defun modifies-protected-p (expr)
  "Check if expression tries to modify protected elements"
  (when (and (consp expr) (eq (car expr) 'setf))
    (let ((target (cadr expr)))
      (when (symbolp target)
        (member target '(*identity* *truth* *guards* +truth-axioms+))))))
