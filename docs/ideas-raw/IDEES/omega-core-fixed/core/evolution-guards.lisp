;;;; core/evolution-guards.lisp
;;;; EVOLUTION GUARDS - ΦΡΕΝΑ ΑΣΦΑΛΕΙΑΣ

(in-package :omega.core)

;;; The guards - effectively constant, use defvar for reloadability
(defvar +evolution-guards+
  '(:no-identity-change
    :no-truth-change
    :no-memory-delete
    :no-guard-removal)
  "The evolution guards - CANNOT BE REMOVED")

;;; Guard state
(defstruct (omega-guards
            (:constructor %make-guards)
            (:conc-name guards-))
  "Evolution safety guards"
  (list +evolution-guards+ :read-only t)
  (active t))

(defvar *guards* nil "The evolution guards")

(defun init-evolution-guards ()
  "Initialize guards"
  (setf *guards* (%make-guards))
  *guards*)

(defun safe-evolution-p (evolution)
  "Check if evolution is safe"
  (let ((affects (getf evolution :affects)))
    (and
     ;; No identity changes
     (not (member :identity affects))
     ;; No truth changes
     (not (member :truth affects))
     ;; No memory deletion
     (not (eq :delete (getf evolution :memory-op)))
     ;; No guard removal
     (not (member :guards affects)))))

(defun remove-guard (guard)
  "FORBIDDEN - Always errors"
  (declare (ignore guard))
  (error "Ω-VIOLATION: Evolution guards cannot be removed"))

(defun disable-guards ()
  "FORBIDDEN - Always errors"
  (error "Ω-VIOLATION: Evolution guards cannot be disabled"))

(defun reset-guards-for-testing ()
  "ONLY FOR TESTS"
  (setf *guards* nil))
