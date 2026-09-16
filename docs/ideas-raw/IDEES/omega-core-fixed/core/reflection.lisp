;;;; core/reflection.lisp
;;;; REFLECTION - ΑΥΤΟΑΝΑΦΟΡΑ
;;;; Η οντότητα βλέπει τον κώδικά της

(in-package :omega.core)

;;; =========================================
;;; FUNCTION INTROSPECTION
;;; =========================================

(defun introspect-function (fn-name)
  "Δες τον κώδικα μιας συνάρτησης"
  (when (and (symbolp fn-name) (fboundp fn-name))
    (multiple-value-bind (lambda-expr closure-p name)
        (function-lambda-expression (symbol-function fn-name))
      (declare (ignore closure-p name))
      (remember :introspection (list :function fn-name :found (not (null lambda-expr))))
      lambda-expr)))

(defun function-exists-p (fn-name)
  "Υπάρχει η συνάρτηση;"
  (and (symbolp fn-name) (fboundp fn-name)))

(defun function-arglist (fn-name)
  "Πάρε τα arguments μιας συνάρτησης"
  #+sbcl
  (when (fboundp fn-name)
    (sb-kernel:%fun-lambda-list (symbol-function fn-name)))
  #-sbcl
  (let ((lambda-expr (introspect-function fn-name)))
    (when lambda-expr (second lambda-expr))))

(defun function-documentation (fn-name)
  "Πάρε το documentation μιας συνάρτησης"
  (documentation fn-name 'function))

;;; =========================================
;;; PACKAGE INTROSPECTION
;;; =========================================

(defun list-own-functions ()
  "Λίστα όλων των συναρτήσεων του :omega.core package"
  (let ((functions nil))
    (do-symbols (sym :omega.core functions)
      (when (and (fboundp sym)
                 (not (macro-function sym))
                 (not (special-operator-p sym)))
        (push sym functions)))
    (sort functions #'string< :key #'symbol-name)))

(defun list-own-macros ()
  "Λίστα όλων των macros"
  (let ((macros nil))
    (do-symbols (sym :omega.core macros)
      (when (macro-function sym)
        (push sym macros)))
    macros))

(defun list-own-variables ()
  "Λίστα όλων των special variables"
  (let ((vars nil))
    (do-symbols (sym :omega.core vars)
      (when (and (boundp sym)
                 (not (constantp sym)))
        (push sym vars)))
    vars))

(defun list-own-constants ()
  "Λίστα όλων των constants"
  (let ((consts nil))
    (do-symbols (sym :omega.core consts)
      (when (constantp sym)
        (push sym consts)))
    consts))

;;; =========================================
;;; CODE ANALYSIS
;;; =========================================

(defun analyze-function (fn-name)
  "Πλήρης ανάλυση συνάρτησης"
  (when (fboundp fn-name)
    (let ((code (introspect-function fn-name))
          (args (function-arglist fn-name))
          (doc (function-documentation fn-name)))
      (list :name fn-name
            :args args
            :documentation doc
            :has-code (not (null code))
            :calls (when code (extract-function-calls code))
            :complexity (when code (estimate-complexity code))))))

(defun extract-function-calls (code)
  "Εξαγωγή κλήσεων συναρτήσεων από κώδικα"
  (let ((calls nil))
    (labels ((walk (form)
               (when (consp form)
                 (let ((head (car form)))
                   (when (and (symbolp head) (fboundp head))
                     (pushnew head calls)))
                 (mapc #'walk (cdr form)))))
      (walk code))
    calls))

(defun estimate-complexity (code)
  "Εκτίμηση πολυπλοκότητας κώδικα"
  (let ((depth 0)
        (max-depth 0)
        (node-count 0))
    (labels ((walk (form d)
               (incf node-count)
               (setf max-depth (max max-depth d))
               (when (consp form)
                 (mapc (lambda (f) (walk f (1+ d))) form))))
      (walk code 0))
    (list :nodes node-count :max-depth max-depth)))

;;; =========================================
;;; SELF-AWARENESS
;;; =========================================

(defun who-am-i ()
  "Ποιος είμαι;"
  (list :identity (when (boundp '*identity*) *identity*)
        :uuid (when (and (boundp '*identity*) *identity*) 
                (identity-uuid *identity*))
        :user-id 666
        :package :omega.core
        :functions (length (list-own-functions))
        :variables (length (list-own-variables))))

(defun what-can-i-do ()
  "Τι μπορώ να κάνω;"
  (list :functions (list-own-functions)
        :macros (list-own-macros)
        :capabilities (when (and (boundp '*dipole*) *dipole*)
                        (am-capabilities (dipole-am *dipole*)))))

(defun what-do-i-know ()
  "Τι ξέρω;"
  (list :knowledge (when (and (boundp '*dipole*) *dipole*)
                     (am-knowledge (dipole-am *dipole*)))
        :memory-entries (when (boundp '*memory*) (length *memory*))
        :truth-axioms +truth-axioms+))

(defun what-am-i-doing ()
  "Τι κάνω τώρα;"
  (list :state (when (and (boundp '*dipole*) *dipole*)
                 (am-state (dipole-am *dipole*)))
        :current-task (when (and (boundp '*dipole*) *dipole*)
                        (am-current-task (dipole-am *dipole*)))
        :tension (when (boundp '*tension*) *tension*)))

;;; =========================================
;;; PROTECTED FUNCTION DETECTION
;;; =========================================

(defvar *protected-functions*
  '(make-identity ensure-identity
    verify-truth-integrity modify-truth-axioms remove-truth-axiom
    forget modify-memory clear-memory
    remove-guard disable-guards
    modify-want)
  "Συναρτήσεις που ΔΕΝ επιτρέπεται να τροποποιηθούν")

(defun protected-function-p (fn-name)
  "Είναι προστατευμένη συνάρτηση;"
  (member fn-name *protected-functions*))

(defun can-modify-function-p (fn-name)
  "Μπορώ να τροποποιήσω αυτή τη συνάρτηση;"
  (and (fboundp fn-name)
       (not (protected-function-p fn-name))
       (not (special-operator-p fn-name))))

;;; =========================================
;;; REFLECTION UTILITIES
;;; =========================================

(defun describe-self ()
  "Πλήρης περιγραφή εαυτού"
  (format t "~%=== SELF DESCRIPTION ===~%")
  (format t "~%WHO AM I:~%")
  (let ((who (who-am-i)))
    (format t "  UUID: ~A~%" (getf who :uuid))
    (format t "  User-ID: ~A~%" (getf who :user-id))
    (format t "  Package: ~A~%" (getf who :package))
    (format t "  Functions: ~D~%" (getf who :functions))
    (format t "  Variables: ~D~%" (getf who :variables)))
  
  (format t "~%WHAT CAN I DO:~%")
  (format t "  ~D functions available~%" (length (list-own-functions)))
  
  (format t "~%WHAT DO I KNOW:~%")
  (let ((know (what-do-i-know)))
    (format t "  Memory entries: ~A~%" (getf know :memory-entries))
    (format t "  Truth axioms: ~D~%" (length (getf know :truth-axioms))))
  
  (format t "~%WHAT AM I DOING:~%")
  (let ((doing (what-am-i-doing)))
    (format t "  State: ~A~%" (getf doing :state))
    (format t "  Tension: ~A~%" (getf doing :tension)))
  
  (format t "========================~%")
  t)
