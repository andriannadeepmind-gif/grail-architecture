;;;; core/truth.lisp
;;;; ΑΜΕΤΑΒΛΗΤΑ ΑΞΙΩΜΑΤΑ ΑΛΗΘΕΙΑΣ

(in-package :omega.core)

;;; The axioms - effectively constant, use defvar for reloadability
(defvar +truth-axioms+
  '(:no-solution-is-final
    :falsification-always-possible
    :identity-immutable
    :memory-append-only
    :guards-never-weaken)
  "The truth axioms - IMMUTABLE")

;;; Truth state
(defstruct (omega-truth
            (:constructor %make-truth)
            (:conc-name truth-))
  "The truth layer"
  (axioms +truth-axioms+ :read-only t)
  (violations nil))

(defvar *truth* nil "The truth layer")

(defun init-truth ()
  "Initialize truth layer"
  (setf *truth* (%make-truth))
  *truth*)

(defun verify-truth-integrity (core)
  "Verify that truth invariants hold"
  (declare (ignore core))
  (unless *truth*
    (error "Ω-ERROR: Truth layer not initialized"))
  ;; Check axioms are still the same
  (unless (equal (truth-axioms *truth*) +truth-axioms+)
    (error "Ω-VIOLATION: Truth axioms have been tampered with"))
  t)

(defun modify-truth-axioms (new-axioms)
  "FORBIDDEN - Always errors"
  (declare (ignore new-axioms))
  (error "Ω-VIOLATION: Truth axioms cannot be modified"))

(defun remove-truth-axiom (axiom)
  "FORBIDDEN - Always errors"
  (declare (ignore axiom))
  (error "Ω-VIOLATION: Truth axioms cannot be removed"))

(defun reset-truth-for-testing ()
  "ONLY FOR TESTS"
  (setf *truth* nil))
