;;;; core/memory.lisp
;;;; APPEND-ONLY MEMORY - NO DELETE, NO MODIFY

(in-package :omega.core)

;;; Memory entry structure
(defstruct (memory-entry
            (:constructor make-memory-entry)
            (:conc-name entry-))
  "A single memory entry - immutable once created"
  (timestamp (get-universal-time) :read-only t)
  (type nil :read-only t)
  (content nil :read-only t))

;;; Global memory
(defvar *memory* nil "The memory - append-only list")

(defun init-memory ()
  "Initialize memory"
  (setf *memory* nil)
  *memory*)

(defun remember (type content)
  "Add to memory - APPEND ONLY"
  (let ((entry (make-memory-entry :type type :content content)))
    (push entry *memory*)
    entry))

(defun recall (&key type limit)
  "Retrieve from memory"
  (let ((results (if type
                     (remove-if-not (lambda (e) (eq type (entry-type e)))
                                    *memory*)
                     *memory*)))
    (if limit
        (subseq results 0 (min limit (length results)))
        results)))

(defun memory-count ()
  "Count memory entries"
  (length *memory*))

;;; FORBIDDEN OPERATIONS

(defun forget (entry)
  "FORBIDDEN - Always errors"
  (declare (ignore entry))
  (error "Ω-VIOLATION: Memory is append-only. Cannot forget."))

(defun modify-memory (entry new-content)
  "FORBIDDEN - Always errors"
  (declare (ignore entry new-content))
  (error "Ω-VIOLATION: Memory is append-only. Cannot modify."))

(defun clear-memory ()
  "FORBIDDEN - Always errors"
  (error "Ω-VIOLATION: Memory is append-only. Cannot clear."))

(defun reset-memory-for-testing ()
  "ONLY FOR TESTS"
  (setf *memory* nil))
