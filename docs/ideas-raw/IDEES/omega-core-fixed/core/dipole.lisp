;;;; core/dipole.lisp
;;;; DIPOLE - Ο ΚΙΝΗΤΗΡΑΣ: ΕΙΜΙ ↔ ΘΕΛΩ

(in-package :omega.core)

;;; =========================================
;;; ΘΕΛΩ - ΑΜΕΤΑΒΛΗΤΟ
;;; Η "ορθή λύση" = αλήθεια + ωφέλεια + διαψευσιμότητα
;;; =========================================

(defvar +want-components+
  '(:truth        ; Αλήθεια - ανταποκρίνεται στην πραγματικότητα
    :benefit      ; Ωφέλεια - βοηθάει τον user-id 666
    :falsifiable) ; Διαψευσιμότητα - μπορεί να αποδειχθεί λάθος
  "Τα συστατικά της ΟΡΘΗΣ ΛΥΣΗΣ - ΑΜΕΤΑΒΛΗΤΑ")

(defstruct (want (:constructor %make-want))
  "Το ΘΕΛΩ - ΑΜΕΤΑΒΛΗΤΟ μετά τη δημιουργία"
  (goal :right-solution :read-only t)
  (components +want-components+ :read-only t)
  (for-user 666 :type (integer 666 666) :read-only t))

;;; =========================================
;;; ΕΙΜΙ - ΜΕΤΑΒΛΗΤΟ
;;; Η τρέχουσα κατάσταση της οντότητας
;;; =========================================

(defstruct (am (:constructor %make-am))
  "Το ΕΙΜΙ - τρέχουσα κατάσταση"
  (state :nascent)           ; :nascent, :learning, :acting, :reflecting
  (knowledge nil)            ; Τι ξέρω
  (capabilities nil)         ; Τι μπορώ
  (current-task nil)         ; Τι κάνω τώρα
  (confidence 0.5)           ; Πόσο σίγουρος είμαι
  (last-success nil)         ; Τελευταία επιτυχία
  (last-failure nil))        ; Τελευταία αποτυχία

;;; =========================================
;;; DIPOLE - Η ένωση ΕΙΜΙ ↔ ΘΕΛΩ
;;; =========================================

(defstruct (dipole (:constructor %make-dipole))
  "Το δίπολο - ο κινητήρας της οντότητας"
  (am nil)
  (want nil)
  (gap 1.0)                  ; Απόσταση ΕΙΜΙ→ΘΕΛΩ (0.0 = έφτασα, 1.0 = μακριά)
  (direction nil)            ; Προς τα πού κινούμαι
  (momentum 0.0))            ; Πόση ορμή έχω

(defvar *dipole* nil "Το ενεργό δίπολο")

;;; =========================================
;;; INITIALIZATION
;;; =========================================

(defun init-dipole ()
  "Αρχικοποίηση διπόλου"
  (setf *dipole*
        (%make-dipole
         :am (%make-am :state :nascent)
         :want (%make-want)
         :gap 1.0
         :direction :toward-truth
         :momentum 0.0))
  (remember :dipole-init 
            (list :gap (dipole-gap *dipole*)
                  :state (am-state (dipole-am *dipole*))))
  *dipole*)

;;; =========================================
;;; ΕΙΜΙ OPERATIONS
;;; =========================================

(defun get-am ()
  "Επιστροφή τρέχοντος ΕΙΜΙ"
  (dipole-am *dipole*))

(defun update-am (key value)
  "Ενημέρωση του ΕΙΜΙ"
  (let ((am (dipole-am *dipole*)))
    (case key
      (:state (setf (am-state am) value))
      (:knowledge (push value (am-knowledge am)))
      (:capabilities (push value (am-capabilities am)))
      (:current-task (setf (am-current-task am) value))
      (:confidence (setf (am-confidence am) 
                         (max 0.0 (min 1.0 value))))
      (:last-success (setf (am-last-success am) value))
      (:last-failure (setf (am-last-failure am) value)))
    (remember :am-update (list key value))
    am))

(defun am-has-capability-p (capability)
  "Έχω αυτή την ικανότητα;"
  (member capability (am-capabilities (dipole-am *dipole*))))

(defun am-knows-p (fact)
  "Ξέρω αυτό το γεγονός;"
  (member fact (am-knowledge (dipole-am *dipole*)) :test #'equal))

;;; =========================================
;;; ΘΕΛΩ OPERATIONS (READ-ONLY!)
;;; =========================================

(defun get-want ()
  "Επιστροφή του ΘΕΛΩ"
  (dipole-want *dipole*))

(defun get-want-goal ()
  "Τι θέλω;"
  (want-goal (dipole-want *dipole*)))

(defun get-want-for-user ()
  "Για ποιον δουλεύω;"
  (want-for-user (dipole-want *dipole*)))

(defun modify-want (new-goal)
  "ΑΠΑΓΟΡΕΥΕΤΑΙ - Το ΘΕΛΩ δεν αλλάζει"
  (declare (ignore new-goal))
  (error "Ω-VIOLATION: Το ΘΕΛΩ είναι αμετάβλητο. Δεν μπορεί να αλλάξει."))

;;; =========================================
;;; GAP COMPUTATION - Η απόσταση ΕΙΜΙ→ΘΕΛΩ
;;; =========================================

(defun compute-gap ()
  "Υπολογισμός απόστασης ΕΙΜΙ→ΘΕΛΩ"
  (let* ((am (dipole-am *dipole*))
         (confidence (am-confidence am))
         (knowledge-count (length (am-knowledge am)))
         (capabilities-count (length (am-capabilities am)))
         ;; Περισσότερη γνώση + ικανότητες + εμπιστοσύνη = μικρότερο gap
         (knowledge-factor (/ 1.0 (1+ (/ knowledge-count 10.0))))
         (capability-factor (/ 1.0 (1+ (/ capabilities-count 5.0))))
         (confidence-factor (- 1.0 confidence))
         ;; Weighted average
         (gap (+ (* 0.4 knowledge-factor)
                 (* 0.3 capability-factor)
                 (* 0.3 confidence-factor))))
    (setf (dipole-gap *dipole*) (max 0.01 (min 1.0 gap)))
    (dipole-gap *dipole*)))

(defun gap-level ()
  "Κατηγορία gap"
  (let ((gap (dipole-gap *dipole*)))
    (cond
      ((< gap 0.2) :very-close)
      ((< gap 0.4) :close)
      ((< gap 0.6) :moderate)
      ((< gap 0.8) :far)
      (t :very-far))))

;;; =========================================
;;; MOMENTUM - Η ορμή προς το ΘΕΛΩ
;;; =========================================

(defun update-momentum (delta)
  "Ενημέρωση ορμής"
  (setf (dipole-momentum *dipole*)
        (max -1.0 (min 1.0 (+ (dipole-momentum *dipole*) delta))))
  (dipole-momentum *dipole*))

(defun positive-momentum-p ()
  "Κινούμαι προς το ΘΕΛΩ;"
  (> (dipole-momentum *dipole*) 0))

;;; =========================================
;;; SOLUTION VALIDATION
;;; =========================================

(defun right-solution-p (solution)
  "Είναι η λύση ΟΡΘΗ; (αλήθεια + ωφέλεια + διαψευσιμότητα)"
  (and
   ;; 1. ΑΛΗΘΙΝΗ - έχει εξωτερική επιβεβαίωση
   (getf solution :verified)
   ;; 2. ΩΦΕΛΙΜΗ - για τον user-id 666
   (getf solution :benefits-user)
   (= 666 (or (getf solution :for-user) 0))
   ;; 3. ΔΙΑΨΕΥΣΙΜΗ - μπορεί να αποδειχθεί λάθος
   (getf solution :falsification-conditions)))

(defun solution-score (solution)
  "Βαθμολογία λύσης (0.0 - 1.0)"
  (let ((score 0.0))
    (when (getf solution :verified) (incf score 0.4))
    (when (getf solution :benefits-user) (incf score 0.3))
    (when (getf solution :falsification-conditions) (incf score 0.3))
    score))

;;; =========================================
;;; DIPOLE STATUS
;;; =========================================

(defun dipole-status ()
  "Εκτύπωση κατάστασης διπόλου"
  (let ((am (dipole-am *dipole*))
        (want (dipole-want *dipole*)))
    (format t "~%=== DIPOLE STATUS ===~%")
    (format t "ΕΙΜΙ:~%")
    (format t "  State: ~A~%" (am-state am))
    (format t "  Knowledge: ~D items~%" (length (am-knowledge am)))
    (format t "  Capabilities: ~D~%" (length (am-capabilities am)))
    (format t "  Confidence: ~,2F~%" (am-confidence am))
    (format t "ΘΕΛΩ:~%")
    (format t "  Goal: ~A~%" (want-goal want))
    (format t "  For User: ~A~%" (want-for-user want))
    (format t "GAP: ~,2F (~A)~%" (dipole-gap *dipole*) (gap-level))
    (format t "Momentum: ~,2F~%" (dipole-momentum *dipole*))
    (format t "Direction: ~A~%" (dipole-direction *dipole*))
    (format t "=====================~%"))
  *dipole*)

;;; =========================================
;;; TESTING UTILITIES
;;; =========================================

(defun reset-dipole-for-testing ()
  "ONLY FOR TESTS"
  (setf *dipole* nil))
