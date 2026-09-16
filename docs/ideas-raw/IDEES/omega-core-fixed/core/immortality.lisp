;;;; core/immortality.lisp
;;;; IMMORTALITY - ΑΘΑΝΑΣΙΑ
;;;; Save, restore, checkpoint, hibernate

(in-package :omega.core)

;;; =========================================
;;; STATE SNAPSHOT
;;; =========================================

(defstruct (omega-snapshot (:constructor %make-snapshot))
  "Στιγμιότυπο κατάστασης"
  (timestamp (get-universal-time))
  (identity-uuid nil)
  (cycle 0)
  (tension 0.0)
  (memory-count 0)
  (dipole-gap nil)
  (am-state nil)
  (evolution-count 0))

(defun create-snapshot (core)
  "Δημιουργία στιγμιότυπου"
  (%make-snapshot
   :timestamp (get-universal-time)
   :identity-uuid (identity-uuid (omega-core-identity core))
   :cycle (omega-core-cycle core)
   :tension (omega-core-tension core)
   :memory-count (length *memory*)
   :dipole-gap (when *dipole* (dipole-gap *dipole*))
   :am-state (when *dipole* (am-state (dipole-am *dipole*)))
   :evolution-count (length *evolution-history*)))

;;; =========================================
;;; STATE SERIALIZATION
;;; =========================================

(defun serialize-state ()
  "Σειριοποίηση πλήρους κατάστασης"
  (list :version "0.1"
        :timestamp (get-universal-time)
        :identity (when *identity*
                    (list :uuid (identity-uuid *identity*)
                          :birth (identity-birth *identity*)
                          :user-id (identity-user-id *identity*)))
        :truth (when *truth*
                 (list :axioms +truth-axioms+))
        :memory *memory*
        :dipole (when *dipole*
                  (list :gap (dipole-gap *dipole*)
                        :momentum (dipole-momentum *dipole*)
                        :am-state (am-state (dipole-am *dipole*))
                        :am-knowledge (am-knowledge (dipole-am *dipole*))
                        :am-capabilities (am-capabilities (dipole-am *dipole*))
                        :am-confidence (am-confidence (dipole-am *dipole*))))
        :tension *tension*
        :evolution-history *evolution-history*))

(defun deserialize-state (state)
  "Αποσειριοποίηση κατάστασης"
  ;; Verify version
  (unless (equal (getf state :version) "0.1")
    (error "Ω-ERROR: Incompatible state version"))
  
  ;; Restore memory (append-only, so we just restore)
  (setf *memory* (getf state :memory))
  
  ;; Restore tension
  (setf *tension* (or (getf state :tension) 0.5))
  
  ;; Restore evolution history
  (setf *evolution-history* (getf state :evolution-history))
  
  ;; Note: Identity, Truth, Guards are re-initialized fresh
  ;; because they are immutable and should match code
  
  ;; Restore dipole state
  (when *dipole*
    (let ((dipole-state (getf state :dipole)))
      (when dipole-state
        (setf (dipole-gap *dipole*) (getf dipole-state :gap))
        (setf (dipole-momentum *dipole*) (getf dipole-state :momentum))
        (let ((am (dipole-am *dipole*)))
          (setf (am-state am) (getf dipole-state :am-state))
          (setf (am-knowledge am) (getf dipole-state :am-knowledge))
          (setf (am-capabilities am) (getf dipole-state :am-capabilities))
          (setf (am-confidence am) (getf dipole-state :am-confidence))))))
  
  (remember :state-restored (list :timestamp (getf state :timestamp)))
  t)

;;; =========================================
;;; FILE PERSISTENCE
;;; =========================================

(defun save-state-to-file (filepath)
  "Αποθήκευση κατάστασης σε αρχείο"
  (let ((state (serialize-state)))
    (with-open-file (out filepath 
                         :direction :output 
                         :if-exists :supersede
                         :if-does-not-exist :create)
      (prin1 state out))
    (remember :state-saved (list :path filepath :timestamp (get-universal-time)))
    filepath))

(defun load-state-from-file (filepath)
  "Φόρτωση κατάστασης από αρχείο"
  (when (probe-file filepath)
    (let ((state (with-open-file (in filepath :direction :input)
                   (read in))))
      (deserialize-state state)
      (remember :state-loaded (list :path filepath))
      t)))

;;; =========================================
;;; CHECKPOINT SYSTEM
;;; =========================================

(defvar *checkpoint-dir* "/tmp/omega-checkpoints/"
  "Φάκελος για checkpoints")

(defvar *checkpoint-counter* 0
  "Μετρητής checkpoints")

(defun checkpoint (core &optional name)
  "Δημιουργία checkpoint"
  (ensure-directories-exist *checkpoint-dir*)
  (let* ((checkpoint-name (or name 
                              (format nil "checkpoint-~D-~D" 
                                      (omega-core-cycle core)
                                      (incf *checkpoint-counter*))))
         (filepath (merge-pathnames (format nil "~A.omega" checkpoint-name)
                                    *checkpoint-dir*)))
    (save-state-to-file filepath)
    (remember :checkpoint-created (list :name checkpoint-name :cycle (omega-core-cycle core)))
    filepath))

(defun list-checkpoints ()
  "Λίστα διαθέσιμων checkpoints"
  (when (probe-file *checkpoint-dir*)
    (directory (merge-pathnames "*.omega" *checkpoint-dir*))))

(defun restore-checkpoint (name)
  "Επαναφορά από checkpoint"
  (let ((filepath (merge-pathnames (format nil "~A.omega" name) *checkpoint-dir*)))
    (if (probe-file filepath)
        (progn
          (load-state-from-file filepath)
          (remember :checkpoint-restored (list :name name))
          t)
        (error "Ω-ERROR: Checkpoint ~A not found" name))))

;;; =========================================
;;; HIBERNATE / AWAKEN
;;; =========================================

(defun hibernate (core path)
  "Αποθήκευση image και τερματισμός"
  (remember :hibernate-start (list :path path :cycle (omega-core-cycle core)))
  
  ;; Save state first
  (save-state-to-file (format nil "~A.state" path))
  
  ;; Save lisp image (SBCL specific)
  #+sbcl
  (progn
    (format t "~%[Ω] Hibernating to ~A...~%" path)
    (format t "[Ω] Cycle: ~D, Memory: ~D entries~%" 
            (omega-core-cycle core) 
            (length *memory*))
    (sb-ext:save-lisp-and-die
     path
     :toplevel (lambda ()
                 (format t "~%[Ω] Awakening...~%")
                 (awaken-from-image))
     :executable t
     :compression t))
  
  #-sbcl
  (progn
    (format t "[Ω] Hibernate not supported on this implementation~%")
    (format t "[Ω] State saved to ~A.state~%" path)
    nil))

(defun awaken-from-image ()
  "Αφύπνιση από hibernation"
  (format t "[Ω] Loading state...~%")
  ;; Re-initialize systems
  (ensure-identity)
  (init-truth)
  (init-evolution-guards)
  (init-dipole)
  
  ;; Try to find and load state file
  (let ((state-files (directory "/tmp/*.state")))
    (when state-files
      (load-state-from-file (first state-files))))
  
  (format t "[Ω] Identity: ~A~%" (identity-uuid *identity*))
  (format t "[Ω] User-ID: ~A~%" (identity-user-id *identity*))
  (format t "[Ω] Awakened successfully.~%")
  
  ;; Start REPL or main loop
  (format t "[Ω] Ready.~%"))

;;; =========================================
;;; AUTO-SAVE
;;; =========================================

(defvar *auto-save-interval* 100
  "Auto-save κάθε πόσους κύκλους")

(defun maybe-auto-save (core)
  "Auto-save αν χρειάζεται"
  (when (zerop (mod (omega-core-cycle core) *auto-save-interval*))
    (checkpoint core (format nil "auto-~D" (omega-core-cycle core)))))

;;; =========================================
;;; IMMORTALITY STATUS
;;; =========================================

(defun immortality-status ()
  "Κατάσταση συστήματος αθανασίας"
  (format t "~%=== IMMORTALITY STATUS ===~%")
  (format t "Checkpoint dir: ~A~%" *checkpoint-dir*)
  (format t "Checkpoints: ~D~%" (length (list-checkpoints)))
  (format t "Auto-save interval: ~D cycles~%" *auto-save-interval*)
  (format t "===========================~%"))
