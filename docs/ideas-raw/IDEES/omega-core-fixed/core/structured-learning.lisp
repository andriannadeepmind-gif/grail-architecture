;;;; core/structured-learning.lisp
;;;; STRUCTURED LEARNING SYSTEM - Safe, auditable, truth-respecting
;;;; NOT random neural networks - but verified knowledge acquisition

(in-package :omega.core)

;;; =========================================
;;; LEARNING STRUCTURES
;;; =========================================

(defstruct learning-candidate
  "A piece of knowledge waiting to be learned"
  (id (generate-uuid))
  (content nil :type list)           ; The actual knowledge
  (source nil :type symbol)          ; Where it came from
  (provenance nil)                   ; Full chain of custody
  (timestamp (get-universal-time))
  (test-results nil)                 ; Testing outcomes
  (truth-check nil)                  ; Compatibility with axioms
  (approval-status :pending)         ; :pending :approved :rejected
  (rejection-reason nil))

(defstruct learned-knowledge
  "Successfully integrated knowledge"
  (id (generate-uuid))
  (content nil)
  (learned-at (get-universal-time))
  (source nil)
  (confidence 1.0)                   ; 0.0 to 1.0
  (times-used 0)
  (last-used nil)
  (performance-score 1.0))           ; How well it performs

;;; =========================================
;;; KNOWLEDGE BASE
;;; =========================================

(defvar *knowledge-base* (make-hash-table :test #'equal)
  "Structured knowledge storage - NOT random weights")

(defvar *learning-queue* nil
  "Queue of candidates waiting to be learned")

(defvar *learning-history* nil
  "Complete audit trail of all learning attempts")

;;; =========================================
;;; LEARNING PIPELINE
;;; =========================================

(defun propose-learning (content source &optional provenance)
  "Propose new knowledge for learning"
  (let ((candidate (make-learning-candidate
                    :content content
                    :source source
                    :provenance provenance)))
    (push candidate *learning-queue*)
    (remember :learning-proposed 
              (list :id (learning-candidate-id candidate)
                    :content content))
    candidate))

(defun safe-learn (candidate)
  "Structured learning with full verification"
  ;; Step 1: Test the knowledge
  (let ((test-results (test-knowledge candidate)))
    (setf (learning-candidate-test-results candidate) test-results)
    
    ;; Step 2: Check truth compatibility
    (let ((truth-check (check-truth-compatibility candidate)))
      (setf (learning-candidate-truth-check candidate) truth-check)
      
      ;; Step 3: Verify provenance
      (let ((provenance-valid (verify-provenance candidate)))
        
        ;; Step 4: Make decision
        (cond
          ;; All checks passed
          ((and test-results truth-check provenance-valid)
           (integrate-knowledge candidate)
           (setf (learning-candidate-approval-status candidate) :approved)
           (remember :learning-approved 
                     (list :id (learning-candidate-id candidate)))
           t)
          
          ;; Failed checks
          (t
           (setf (learning-candidate-approval-status candidate) :rejected)
           (setf (learning-candidate-rejection-reason candidate)
                 (cond
                   ((not test-results) :failed-tests)
                   ((not truth-check) :truth-violation)
                   ((not provenance-valid) :invalid-provenance)))
           (remember :learning-rejected
                     (list :id (learning-candidate-id candidate)
                           :reason (learning-candidate-rejection-reason candidate)))
           nil))))))

;;; =========================================
;;; VERIFICATION FUNCTIONS
;;; =========================================

(defun test-knowledge (candidate)
  "Test if knowledge is valid and useful"
  (let ((content (learning-candidate-content candidate)))
    (cond
      ;; Empty content
      ((null content) nil)
      
      ;; Legal knowledge - check format
      ((eq (first content) :legal-rule)
       (and (valid-legal-format-p content)
            (no-contradictions-p content)))
      
      ;; Procedural knowledge - can it execute?
      ((eq (first content) :procedure)
       (test-procedure content))
      
      ;; Factual knowledge - is it verifiable?
      ((eq (first content) :fact)
       (verify-fact content))
      
      ;; Default - basic validation
      (t (not (null content))))))

(defun check-truth-compatibility (candidate)
  "Check if knowledge is compatible with truth axioms"
  (let ((content (learning-candidate-content candidate)))
    ;; Check against each truth axiom
    (every (lambda (axiom)
             (not (violates-axiom-p content axiom)))
           +truth-axioms+)))

(defun verify-provenance (candidate)
  "Verify the source and chain of custody"
  (let ((source (learning-candidate-source candidate))
        (provenance (learning-candidate-provenance candidate)))
    (cond
      ;; System-generated knowledge
      ((eq source :self-derived) t)
      
      ;; User-provided knowledge
      ((eq source :user-provided)
       (and provenance
            (getf provenance :user-id)
            (= (getf provenance :user-id) 666)))  ; Only from authorized user
      
      ;; External source
      ((eq source :external)
       (and provenance
            (getf provenance :verified)
            (getf provenance :timestamp)))
      
      ;; Unknown source - reject
      (t nil))))

;;; =========================================
;;; KNOWLEDGE INTEGRATION
;;; =========================================

(defun integrate-knowledge (candidate)
  "Integrate approved knowledge into knowledge base"
  (let* ((content (learning-candidate-content candidate))
         (key (generate-knowledge-key content))
         (knowledge (make-learned-knowledge
                     :content content
                     :source (learning-candidate-source candidate))))
    ;; Store in knowledge base
    (setf (gethash key *knowledge-base*) knowledge)
    
    ;; Update memory
    (remember :knowledge-integrated
              (list :key key
                    :content content))
    
    ;; Record in history
    (push candidate *learning-history*)
    
    knowledge))

(defun generate-knowledge-key (content)
  "Generate unique key for knowledge storage"
  (cond
    ((and (consp content) (symbolp (first content)))
     (list (first content) (generate-uuid)))
    (t (generate-uuid))))

;;; =========================================
;;; KNOWLEDGE RETRIEVAL
;;; =========================================

(defun recall-knowledge (query)
  "Retrieve learned knowledge"
  (let ((matches nil))
    (maphash (lambda (key value)
               (when (knowledge-matches-p value query)
                 (push value matches)))
             *knowledge-base*)
    (sort matches #'> :key #'learned-knowledge-confidence)))

(defun knowledge-matches-p (knowledge query)
  "Check if knowledge matches query"
  (let ((content (learned-knowledge-content knowledge)))
    (cond
      ;; Exact match
      ((equal content query) t)
      
      ;; Partial match
      ((and (consp content) (consp query))
       (eq (first content) (first query)))
      
      ;; Pattern match
      ((and (consp query) (eq (first query) :pattern))
       (pattern-match-p (rest query) content))
      
      ;; No match
      (t nil))))

;;; =========================================
;;; LEARNING MONITORING
;;; =========================================

(defun learning-stats ()
  "Get learning statistics"
  (list :knowledge-items (hash-table-count *knowledge-base*)
        :pending-items (length *learning-queue*)
        :total-attempts (length *learning-history*)
        :successful (count :approved *learning-history*
                           :key #'learning-candidate-approval-status)
        :rejected (count :rejected *learning-history*
                        :key #'learning-candidate-approval-status)))

(defun learning-audit (&optional (limit 10))
  "Get recent learning audit trail"
  (subseq *learning-history* 0 (min limit (length *learning-history*))))

;;; =========================================
;;; KNOWLEDGE VALIDATION HELPERS
;;; =========================================

(defun valid-legal-format-p (content)
  "Check if legal knowledge has valid format"
  (and (consp content)
       (eq (first content) :legal-rule)
       (getf (rest content) :article)
       (getf (rest content) :conditions)
       (getf (rest content) :consequences)))

(defun no-contradictions-p (content)
  "Check for contradictions with existing knowledge"
  (let ((contradictions nil))
    (maphash (lambda (key existing)
               (when (contradicts-p content 
                                   (learned-knowledge-content existing))
                 (push key contradictions)))
             *knowledge-base*)
    (null contradictions)))

(defun contradicts-p (content1 content2)
  "Check if two pieces of knowledge contradict"
  ;; Simplified - real implementation would be more sophisticated
  (and (equal (first content1) (first content2))
       (equal (second content1) :not)
       (equal (second content2) (third content1))))

(defun violates-axiom-p (content axiom)
  "Check if content violates a truth axiom"
  (case axiom
    (:no-solution-is-final
     ;; Check if content claims finality
     (member :final content))
    (:falsification-always-possible
     ;; Check if content claims unfalsifiability
     (member :unfalsifiable content))
    (:identity-immutable
     ;; Check if content tries to change identity
     (and (consp content)
          (member 'identity content)))
    (:memory-append-only
     ;; Check if content tries to delete memory
     (and (consp content)
          (member 'forget content)))
    (:guards-never-weaken
     ;; Check if content weakens guards
     (and (consp content)
          (member 'disable-guard content)))
    (t nil)))

;;; =========================================
;;; LEARNING STATUS
;;; =========================================

(defun learning-status ()
  "Display learning system status"
  (format t "~%=== STRUCTURED LEARNING STATUS ===~%")
  (let ((stats (learning-stats)))
    (format t "Knowledge Base: ~D items~%" (getf stats :knowledge-items))
    (format t "Pending Queue: ~D items~%" (getf stats :pending-items))
    (format t "Total Attempts: ~D~%" (getf stats :total-attempts))
    (format t "Success Rate: ~,1F%~%"
            (if (zerop (getf stats :total-attempts))
                0.0
                (* 100 (/ (getf stats :successful)
                         (getf stats :total-attempts)))))
    (format t "Rejected: ~D~%" (getf stats :rejected)))
  (format t "==================================~%"))
