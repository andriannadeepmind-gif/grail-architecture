;;;; domain/interface.lisp
;;;; DOMAIN INTERFACE - Διεπαφή με εξειδικευμένα domains

(in-package :omega.core)

;;; =========================================
;;; DOMAIN REGISTRY
;;; =========================================

(defvar *domains* (make-hash-table :test 'eq)
  "Εγγεγραμμένα domains")

(defvar *active-domain* nil
  "Το τρέχον ενεργό domain")

(defstruct (domain (:constructor %make-domain))
  "Ένα εξειδικευμένο domain"
  (name nil :type symbol)
  (description "")
  (perceive-fn nil)      ; (lambda (core input) ...)
  (think-fn nil)         ; (lambda (core percept) ...)
  (act-fn nil)           ; (lambda (core decision) ...)
  (validate-fn nil)      ; (lambda (solution) ...)
  (knowledge nil)        ; Domain-specific knowledge
  (capabilities nil))    ; Domain-specific capabilities

;;; =========================================
;;; DOMAIN REGISTRATION
;;; =========================================

(defun register-domain (name &key description perceive think act validate)
  "Εγγραφή νέου domain"
  (let ((domain (%make-domain
                 :name name
                 :description (or description "")
                 :perceive-fn perceive
                 :think-fn think
                 :act-fn act
                 :validate-fn validate)))
    (setf (gethash name *domains*) domain)
    (remember :domain-registered (list :name name))
    domain))

(defun unregister-domain (name)
  "Αφαίρεση domain"
  (remhash name *domains*)
  (when (eq *active-domain* name)
    (setf *active-domain* nil))
  (remember :domain-unregistered (list :name name)))

(defun get-domain (name)
  "Λήψη domain"
  (gethash name *domains*))

(defun list-domains ()
  "Λίστα εγγεγραμμένων domains"
  (let ((domains nil))
    (maphash (lambda (k v) 
               (declare (ignore v))
               (push k domains)) 
             *domains*)
    domains))

;;; =========================================
;;; DOMAIN ACTIVATION
;;; =========================================

(defun activate-domain (name)
  "Ενεργοποίηση domain"
  (unless (gethash name *domains*)
    (error "Ω-ERROR: Domain ~A not found" name))
  (setf *active-domain* name)
  (remember :domain-activated (list :name name))
  ;; Update ΕΙΜΙ with domain capabilities
  (when *dipole*
    (let ((domain (get-domain name)))
      (dolist (cap (domain-capabilities domain))
        (update-am :capabilities cap))))
  name)

(defun deactivate-domain ()
  "Απενεργοποίηση τρέχοντος domain"
  (let ((was *active-domain*))
    (setf *active-domain* nil)
    (remember :domain-deactivated (list :was was))
    was))

(defun active-domain ()
  "Επιστροφή ενεργού domain"
  (when *active-domain*
    (get-domain *active-domain*)))

;;; =========================================
;;; DOMAIN-AWARE PROCESSING
;;; =========================================

(defun domain-perceive (core input)
  "Αντίληψη μέσω domain"
  (let ((domain (active-domain)))
    (if (and domain (domain-perceive-fn domain))
        (funcall (domain-perceive-fn domain) core input)
        ;; Default perceive
        (list :input input
              :domain *active-domain*
              :time (get-universal-time)))))

(defun domain-think (core percept)
  "Σκέψη μέσω domain"
  (let ((domain (active-domain)))
    (if (and domain (domain-think-fn domain))
        (funcall (domain-think-fn domain) core percept)
        ;; Default think
        :continue)))

(defun domain-act (core decision)
  "Δράση μέσω domain"
  (let ((domain (active-domain)))
    (if (and domain (domain-act-fn domain))
        (funcall (domain-act-fn domain) core decision)
        ;; Default act
        (list :action :none :decision decision))))

(defun domain-validate (solution)
  "Επικύρωση λύσης μέσω domain"
  (let ((domain (active-domain)))
    (if (and domain (domain-validate-fn domain))
        (funcall (domain-validate-fn domain) solution)
        ;; Default validation - use right-solution-p
        (right-solution-p solution))))

;;; =========================================
;;; DOMAIN KNOWLEDGE
;;; =========================================

(defun add-domain-knowledge (domain-name knowledge)
  "Προσθήκη γνώσης σε domain"
  (let ((domain (get-domain domain-name)))
    (when domain
      (push knowledge (domain-knowledge domain))
      (remember :domain-knowledge-added 
                (list :domain domain-name :knowledge knowledge)))))

(defun get-domain-knowledge (domain-name)
  "Λήψη γνώσης domain"
  (let ((domain (get-domain domain-name)))
    (when domain
      (domain-knowledge domain))))

(defun add-domain-capability (domain-name capability)
  "Προσθήκη ικανότητας σε domain"
  (let ((domain (get-domain domain-name)))
    (when domain
      (push capability (domain-capabilities domain))
      (remember :domain-capability-added 
                (list :domain domain-name :capability capability)))))

;;; =========================================
;;; DOMAIN STATUS
;;; =========================================

(defun domain-status ()
  "Κατάσταση domain system"
  (format t "~%=== DOMAIN STATUS ===~%")
  (format t "Registered domains: ~D~%" (hash-table-count *domains*))
  (format t "Domains: ~A~%" (list-domains))
  (format t "Active domain: ~A~%" *active-domain*)
  (when *active-domain*
    (let ((domain (active-domain)))
      (format t "  Description: ~A~%" (domain-description domain))
      (format t "  Capabilities: ~D~%" (length (domain-capabilities domain)))
      (format t "  Knowledge items: ~D~%" (length (domain-knowledge domain)))))
  (format t "=====================~%"))

;;; =========================================
;;; TESTING UTILITIES
;;; =========================================

(defun reset-domains-for-testing ()
  "ONLY FOR TESTS"
  (clrhash *domains*)
  (setf *active-domain* nil))
