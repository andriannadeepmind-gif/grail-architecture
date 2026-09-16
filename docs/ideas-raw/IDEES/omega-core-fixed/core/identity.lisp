;;;; core/identity.lisp
;;;; ΑΜΕΤΑΒΛΗΤΗ ΤΑΥΤΟΤΗΤΑ - user-id = 666

(in-package :omega.core)

;;; UUID generation (simple version without external deps)
(defun generate-uuid ()
  "Generate a simple UUID v4"
  (format nil "~8,'0X-~4,'0X-4~3,'0X-~4,'0X-~12,'0X"
          (random #xFFFFFFFF)
          (random #xFFFF)
          (random #xFFF)
          (logior #x8000 (random #x3FFF))
          (random #xFFFFFFFFFFFF)))

;;; Identity structure - ALL FIELDS READ-ONLY
(defstruct (omega-identity
            (:constructor %make-identity)
            (:conc-name identity-))
  "The identity of the entity - IMMUTABLE"
  (uuid (generate-uuid) :type string :read-only t)
  (birth (get-universal-time) :type integer :read-only t)
  (user-id 666 :type (integer 666 666) :read-only t))

;;; Global singleton
(defvar *identity* nil "The one and only identity")

(defun make-identity ()
  "Create identity - ONLY ONCE"
  (when *identity*
    (error "Ω-ERROR: Identity already exists. Cannot create second identity."))
  (setf *identity* (%make-identity))
  *identity*)

(defun ensure-identity ()
  "Return existing identity or create new one"
  (or *identity* (make-identity)))

(defun reset-identity-for-testing ()
  "ONLY FOR TESTS - resets identity"
  (setf *identity* nil))
