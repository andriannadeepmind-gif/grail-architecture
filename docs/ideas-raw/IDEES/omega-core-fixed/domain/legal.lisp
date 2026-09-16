;;;; domain/legal.lisp
;;;; LEGAL DOMAIN - Νομικό domain για user-id 666
;;;; Σύνδεση με Legal Ontology

(in-package :omega.core)

;;; =========================================
;;; LEGAL DOMAIN CONSTANTS
;;; =========================================

(defvar +legal-principles+
  '(:principle-of-legality        ; Αρχή νομιμότητας
    :principle-of-proportionality ; Αρχή αναλογικότητας
    :principle-of-good-faith      ; Αρχή καλής πίστης
    :principle-of-equality        ; Αρχή ισότητας
    :rule-of-law                  ; Κράτος δικαίου
    :due-process                  ; Δίκαιη δίκη
    :human-dignity)               ; Ανθρώπινη αξιοπρέπεια
  "Θεμελιώδεις νομικές αρχές")

(defvar +legal-sources+
  '(:constitution                 ; Σύνταγμα
    :statute                      ; Νόμος
    :regulation                   ; Κανονισμός
    :case-law                     ; Νομολογία
    :doctrine                     ; Θεωρία
    :custom                       ; Έθιμο
    :eu-law)                      ; Ευρωπαϊκό δίκαιο
  "Πηγές δικαίου")

;;; =========================================
;;; LEGAL ENTITY STRUCTURES
;;; =========================================

(defstruct (legal-norm (:constructor make-legal-norm))
  "Κανόνας δικαίου"
  (id nil)
  (type :rule)                    ; :rule, :principle, :standard
  (source :statute)
  (text "")
  (conditions nil)                ; Προϋποθέσεις εφαρμογής
  (consequences nil)              ; Έννομες συνέπειες
  (exceptions nil)                ; Εξαιρέσεις
  (valid-from nil)
  (valid-until nil)
  (eli-uri nil))                  ; European Legislation Identifier

(defstruct (legal-case (:constructor make-legal-case))
  "Νομική υπόθεση"
  (id nil)
  (type :civil)                   ; :civil, :criminal, :administrative
  (facts nil)                     ; Πραγματικά περιστατικά
  (issues nil)                    ; Νομικά ζητήματα
  (applicable-norms nil)          ; Εφαρμοστέοι κανόνες
  (arguments nil)                 ; Επιχειρήματα
  (decision nil)                  ; Απόφαση
  (reasoning nil)                 ; Αιτιολογία
  (status :pending))              ; :pending, :decided, :appealed

(defstruct (legal-argument (:constructor make-legal-argument))
  "Νομικό επιχείρημα"
  (id nil)
  (type :deductive)               ; :deductive, :analogical, :a-contrario
  (premise-major nil)             ; Μείζων πρόταση (κανόνας)
  (premise-minor nil)             ; Ελάσσων πρόταση (υπαγωγή)
  (conclusion nil)                ; Συμπέρασμα
  (strength 0.5)                  ; 0.0 - 1.0
  (counterarguments nil))

;;; =========================================
;;; LEGAL PERCEIVE
;;; =========================================

(defun legal-perceive (core input)
  "Νομική αντίληψη - parsing νομικού input"
  (declare (ignore core))
  (let ((percept (list :type :legal-input
                       :raw-input input
                       :time (get-universal-time))))
    ;; Extract legal elements
    (when (listp input)
      (when (getf input :facts)
        (setf (getf percept :facts) (getf input :facts)))
      (when (getf input :question)
        (setf (getf percept :question) (getf input :question)))
      (when (getf input :norms)
        (setf (getf percept :norms) (getf input :norms))))
    percept))

;;; =========================================
;;; LEGAL THINK
;;; =========================================

(defun legal-think (core percept)
  "Νομική σκέψη - ανάλυση και συλλογισμός"
  (declare (ignore core))
  (let ((facts (getf percept :facts))
        (question (getf percept :question))
        (norms (getf percept :norms)))
    
    (cond
      ;; Έχουμε facts και norms - κάνε υπαγωγή
      ((and facts norms)
       (list :action :subsume
             :facts facts
             :norms norms))
      
      ;; Έχουμε μόνο facts - βρες εφαρμοστέους κανόνες
      (facts
       (list :action :find-norms
             :facts facts))
      
      ;; Έχουμε ερώτηση - απάντησε
      (question
       (list :action :answer
             :question question))
      
      ;; Default
      (t
       (list :action :analyze
             :input percept)))))

;;; =========================================
;;; LEGAL ACT
;;; =========================================

(defun legal-act (core decision)
  "Νομική δράση - εκτέλεση απόφασης"
  (declare (ignore core))
  (let ((action (getf decision :action)))
    (case action
      (:subsume
       (perform-legal-subsumption 
        (getf decision :facts)
        (getf decision :norms)))
      
      (:find-norms
       (find-applicable-norms 
        (getf decision :facts)))
      
      (:answer
       (answer-legal-question 
        (getf decision :question)))
      
      (:analyze
       (analyze-legal-situation 
        (getf decision :input)))
      
      (t
       (list :result :no-action)))))

;;; =========================================
;;; LEGAL OPERATIONS
;;; =========================================

(defun perform-legal-subsumption (facts norms)
  "Υπαγωγή πραγματικών περιστατικών σε κανόνες"
  (let ((results nil))
    (dolist (norm norms)
      (let ((conditions (if (legal-norm-p norm)
                            (legal-norm-conditions norm)
                            (getf norm :conditions))))
        ;; Check if facts satisfy conditions
        (let ((satisfied (check-conditions facts conditions)))
          (push (list :norm norm
                      :satisfied satisfied
                      :consequences (when satisfied
                                      (if (legal-norm-p norm)
                                          (legal-norm-consequences norm)
                                          (getf norm :consequences))))
                results))))
    (remember :legal-subsumption (list :facts facts :results results))
    (list :result :subsumption-complete
          :findings (reverse results))))

(defun check-conditions (facts conditions)
  "Έλεγχος αν τα facts ικανοποιούν τα conditions"
  (if (null conditions)
      t
      (every (lambda (condition)
               (member condition facts :test #'equal))
             conditions)))

(defun find-applicable-norms (facts)
  "Εύρεση εφαρμοστέων κανόνων για δεδομένα facts"
  ;; Placeholder - θα συνδεθεί με knowledge base
  (remember :legal-norm-search (list :facts facts))
  (list :result :norms-found
        :norms nil
        :suggestion "Connect to legal knowledge base"))

(defun answer-legal-question (question)
  "Απάντηση νομικού ερωτήματος"
  (remember :legal-question (list :question question))
  (list :result :answer
        :question question
        :answer "Analysis required"
        :confidence 0.5))

(defun analyze-legal-situation (input)
  "Ανάλυση νομικής κατάστασης"
  (remember :legal-analysis (list :input input))
  (list :result :analysis
        :input input
        :issues nil
        :recommendations nil))

;;; =========================================
;;; LEGAL VALIDATION
;;; =========================================

(defun legal-validate (solution)
  "Επικύρωση νομικής λύσης"
  (let ((valid t)
        (issues nil))
    
    ;; 1. Check for legal basis
    (unless (getf solution :legal-basis)
      (push :no-legal-basis issues)
      (setf valid nil))
    
    ;; 2. Check for reasoning
    (unless (getf solution :reasoning)
      (push :no-reasoning issues))
    
    ;; 3. Check for proportionality
    (when (getf solution :sanction)
      (unless (proportional-p (getf solution :sanction) 
                              (getf solution :violation))
        (push :disproportionate issues)
        (setf valid nil)))
    
    ;; 4. Standard right-solution checks
    (unless (right-solution-p solution)
      (push :not-right-solution issues)
      (setf valid nil))
    
    (list :valid valid
          :issues issues
          :checked-at (get-universal-time))))

(defun proportional-p (sanction violation)
  "Έλεγχος αναλογικότητας"
  (declare (ignore sanction violation))
  ;; Placeholder - needs implementation
  t)

;;; =========================================
;;; LEGAL ARGUMENT CONSTRUCTION
;;; =========================================

(defun construct-legal-argument (norm facts)
  "Κατασκευή νομικού επιχειρήματος"
  (make-legal-argument
   :id (generate-uuid)
   :type :deductive
   :premise-major norm
   :premise-minor (list :facts facts :subsumption t)
   :conclusion (list :consequence (when (legal-norm-p norm)
                                    (legal-norm-consequences norm)))
   :strength 0.8))

(defun evaluate-argument-strength (argument)
  "Αξιολόγηση ισχύος επιχειρήματος"
  (let ((base-strength (legal-argument-strength argument))
        (counter-penalty (* 0.1 (length (legal-argument-counterarguments argument)))))
    (max 0.0 (- base-strength counter-penalty))))

;;; =========================================
;;; LEGAL DOMAIN REGISTRATION
;;; =========================================

(defun init-legal-domain ()
  "Αρχικοποίηση legal domain"
  (register-domain :legal
    :description "Νομικό domain - Legal Ontology integration"
    :perceive #'legal-perceive
    :think #'legal-think
    :act #'legal-act
    :validate #'legal-validate)
  
  ;; Add legal capabilities
  (add-domain-capability :legal :legal-analysis)
  (add-domain-capability :legal :legal-subsumption)
  (add-domain-capability :legal :norm-finding)
  (add-domain-capability :legal :argument-construction)
  
  ;; Add foundational knowledge
  (dolist (principle +legal-principles+)
    (add-domain-knowledge :legal (list :type :principle :name principle)))
  
  (remember :legal-domain-initialized nil)
  :legal)

;;; =========================================
;;; LEGAL STATUS
;;; =========================================

(defun legal-status ()
  "Κατάσταση legal domain"
  (format t "~%=== LEGAL DOMAIN STATUS ===~%")
  (let ((domain (get-domain :legal)))
    (if domain
        (progn
          (format t "Status: REGISTERED~%")
          (format t "Active: ~A~%" (eq *active-domain* :legal))
          (format t "Capabilities: ~D~%" (length (domain-capabilities domain)))
          (format t "Knowledge items: ~D~%" (length (domain-knowledge domain)))
          (format t "Principles: ~D~%" (length +legal-principles+))
          (format t "Sources: ~D~%" (length +legal-sources+)))
        (format t "Status: NOT REGISTERED~%")))
  (format t "===========================~%"))
