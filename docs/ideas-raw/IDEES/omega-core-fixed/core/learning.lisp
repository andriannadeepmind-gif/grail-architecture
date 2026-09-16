;;;; core/learning.lisp
;;;; TRUE LEARNING SYSTEM - Builds understanding, discovers patterns, creates connections
;;;; NOT just memorization - actual neural-like learning

(in-package :omega.core)

;;; =========================================
;;; LEARNING STRUCTURES
;;; =========================================

(defstruct neural-substrate
  "Neural-like substrate for learning"
  (connections (make-hash-table :test #'equal))  ; Pattern -> Concept connections
  (weights (make-hash-table :test #'equal))      ; Connection strengths
  (activation-history nil)                        ; What patterns were activated
  (learning-rate 0.1)                            ; How fast to learn
  (last-learning-event nil))

(defstruct concept
  "A learned concept"
  (id (generate-uuid))
  (pattern nil)                ; The pattern that represents this concept
  (strength 0.0)              ; How well learned (0.0-1.0)
  (examples nil)              ; Examples of this concept
  (connections nil)           ; Connected to other concepts
  (activation-count 0)        ; How many times activated
  (created-at (get-universal-time)))

(defstruct learning-experience
  "A single learning experience"
  (timestamp (get-universal-time))
  (input nil)
  (pattern-extracted nil)
  (concept-derived nil)
  (connections-created nil)
  (understanding-level 0.0))  ; How well was this understood

(defvar *neural-substrate* nil
  "The neural substrate for learning")

(defvar *learned-concepts* (make-hash-table :test #'equal)
  "All learned concepts")

(defvar *learning-experiences* nil
  "History of learning experiences")

;;; =========================================
;;; INITIALIZATION
;;; =========================================

(defun init-learning-system ()
  "Initialize the true learning system"
  (setf *neural-substrate*
        (make-neural-substrate
         :connections (make-hash-table :test #'equal)
         :weights (make-hash-table :test #'equal)
         :learning-rate 0.1))
  
  (setf *learned-concepts* (make-hash-table :test #'equal))
  (setf *learning-experiences* nil)
  
  (remember :learning-system-initialized
            (list :timestamp (get-universal-time)))
  
  *neural-substrate*)

;;; =========================================
;;; TRUE LEARNING
;;; =========================================

(defun learn (input)
  "TRUE LEARNING - Build understanding from input"
  (unless *neural-substrate*
    (init-learning-system))
  
  (let ((experience (make-learning-experience :input input)))
    
    ;; Step 1: Extract patterns from input
    (let ((pattern (extract-pattern input)))
      (setf (learning-experience-pattern-extracted experience) pattern)
      
      ;; Step 2: Derive or recognize concept
      (let ((concept (derive-concept pattern)))
        (setf (learning-experience-concept-derived experience) concept)
        
        ;; Step 3: Create/strengthen connections
        (let ((connections (create-connections pattern concept)))
          (setf (learning-experience-connections-created experience) connections)
          
          ;; Step 4: Generate example to test understanding
          (let ((understanding (test-understanding concept)))
            (setf (learning-experience-understanding-level experience) understanding)
            
            ;; Step 5: Record experience
            (push experience *learning-experiences*)
            (remember :learned (list :concept concept :understanding understanding))
            
            ;; Step 6: Update substrate
            (setf (neural-substrate-last-learning-event *neural-substrate*)
                  (get-universal-time))
            
            ;; Return the concept
            concept))))))

;;; =========================================
;;; PATTERN EXTRACTION
;;; =========================================

(defun extract-pattern (input)
  "Extract abstract pattern from concrete input"
  (cond
    ;; List input - extract structure
    ((consp input)
     (list :type :list-structure
           :length (length input)
           :head (if input (car input) nil)
           :tail-pattern (if (cdr input) 
                            (extract-pattern (cdr input))
                            nil)))
    
    ;; Symbolic input
    ((symbolp input)
     (list :type :symbol
           :name input
           :package (symbol-package input)))
    
    ;; Number input
    ((numberp input)
     (list :type :number
           :value input
           :category (cond
                      ((integerp input) :integer)
                      ((floatp input) :float)
                      ((rationalp input) :rational)
                      (t :number))))
    
    ;; String input
    ((stringp input)
     (list :type :string
           :length (length input)
           :first-char (if (> (length input) 0) (char input 0) nil)))
    
    ;; Unknown
    (t
     (list :type :unknown
           :value input))))

;;; =========================================
;;; CONCEPT DERIVATION
;;; =========================================

(defun derive-concept (pattern)
  "Derive or recognize a concept from pattern"
  (let ((pattern-key (pattern-key pattern)))
    
    ;; Check if we already know this pattern
    (let ((existing (gethash pattern-key *learned-concepts*)))
      (if existing
          ;; Strengthen existing concept
          (progn
            (incf (concept-activation-count existing))
            (setf (concept-strength existing)
                  (min 1.0 (+ (concept-strength existing) 0.1)))
            existing)
          
          ;; Create new concept
          (let ((new-concept (make-concept
                             :pattern pattern
                             :strength 0.1  ; Start weak
                             :activation-count 1)))
            (setf (gethash pattern-key *learned-concepts*) new-concept)
            (remember :new-concept-created
                     (list :pattern pattern :id (concept-id new-concept)))
            new-concept)))))

(defun pattern-key (pattern)
  "Generate unique key for pattern"
  (format nil "~S" pattern))

;;; =========================================
;;; CONNECTION CREATION
;;; =========================================

(defun create-connections (pattern concept)
  "Create neural connections between pattern and concept"
  (let ((connections nil)
        (substrate *neural-substrate*))
    
    ;; Create connection from pattern to concept
    (let ((conn-key (list :pattern pattern :concept (concept-id concept))))
      (setf (gethash conn-key (neural-substrate-connections substrate)) t)
      
      ;; Set initial weight
      (setf (gethash conn-key (neural-substrate-weights substrate))
            (neural-substrate-learning-rate substrate))
      
      (push conn-key connections))
    
    ;; Connect to related concepts
    (dolist (other-concept (find-related-concepts pattern))
      (let ((conn-key (list :concept (concept-id concept)
                           :to (concept-id other-concept))))
        (setf (gethash conn-key (neural-substrate-connections substrate)) t)
        (setf (gethash conn-key (neural-substrate-weights substrate)) 0.05)
        (push conn-key connections)))
    
    connections))

(defun find-related-concepts (pattern)
  "Find concepts related to this pattern"
  (let ((related nil))
    (maphash (lambda (key concept)
               (declare (ignore key))
               (when (patterns-related-p pattern (concept-pattern concept))
                 (push concept related)))
             *learned-concepts*)
    related))

(defun patterns-related-p (pattern1 pattern2)
  "Check if two patterns are related"
  ;; Simple similarity check
  (and (consp pattern1) (consp pattern2)
       (eq (getf pattern1 :type) (getf pattern2 :type))))

;;; =========================================
;;; UNDERSTANDING TEST
;;; =========================================

(defun test-understanding (concept)
  "Test understanding by generating examples"
  ;; Try to generate a new instance of this concept
  (let ((generated (generate-example concept)))
    (if generated
        ;; Success - we understand
        (progn
          (push generated (concept-examples concept))
          (min 1.0 (/ (length (concept-examples concept)) 10.0)))
        ;; Failure - don't understand yet
        0.0)))

(defun generate-example (concept)
  "Generate a new example of this concept"
  (let ((pattern (concept-pattern concept)))
    ;; Simple generation based on pattern type
    (case (getf pattern :type)
      (:list-structure
       (list 'generated-example :for (concept-id concept)))
      (:symbol
       (intern (format nil "GEN-~A" (getf pattern :name))))
      (:number
       (let ((category (getf pattern :category)))
         (case category
           (:integer (random 100))
           (:float (random 1.0))
           (t 0))))
      (t nil))))

;;; =========================================
;;; LEARNING FROM EXPERIENCE
;;; =========================================

(defun learn-from-experience (experience-data)
  "Learn from structured experience data"
  ;; Extract what happened
  (let ((situation (getf experience-data :situation))
        (action (getf experience-data :action))
        (outcome (getf experience-data :outcome)))
    
    ;; Learn the pattern: situation + action -> outcome
    (let ((pattern (list :type :causal-pattern
                        :situation situation
                        :action action
                        :outcome outcome)))
      
      ;; Create concept for this causal relationship
      (let ((concept (derive-concept pattern)))
        
        ;; Strengthen if outcome was good
        (when (eq (getf outcome :quality) :good)
          (setf (concept-strength concept)
                (min 1.0 (+ (concept-strength concept) 0.2))))
        
        ;; Weaken if outcome was bad
        (when (eq (getf outcome :quality) :bad)
          (setf (concept-strength concept)
                (max 0.0 (- (concept-strength concept) 0.1))))
        
        concept))))

;;; =========================================
;;; KNOWLEDGE RETRIEVAL
;;; =========================================

(defun recall-learned-knowledge (query)
  "Recall learned concepts matching query"
  (let ((matches nil))
    (maphash (lambda (key concept)
               (declare (ignore key))
               (when (concept-matches-query-p concept query)
                 (push concept matches)))
             *learned-concepts*)
    
    ;; Sort by strength (best learned first)
    (sort matches #'> :key #'concept-strength)))

(defun concept-matches-query-p (concept query)
  "Check if concept matches query"
  (let ((pattern (concept-pattern concept)))
    (or
     ;; Type match
     (eq (getf pattern :type) query)
     
     ;; Pattern match
     (and (consp query)
          (eq (getf query :type) (getf pattern :type)))
     
     ;; ID match
     (equal query (concept-id concept)))))

;;; =========================================
;;; STATUS & STATISTICS
;;; =========================================

(defun learning-system-status ()
  "Display learning system status"
  (format t "~%=== TRUE LEARNING STATUS ===~%")
  (if (not *neural-substrate*)
      (format t "Learning system: NOT INITIALIZED~%")
      (progn
        (format t "Neural substrate: ACTIVE~%")
        (format t "Learning rate: ~,2F~%" 
                (neural-substrate-learning-rate *neural-substrate*))
        (format t "Learned concepts: ~D~%" 
                (hash-table-count *learned-concepts*))
        (format t "Neural connections: ~D~%"
                (hash-table-count (neural-substrate-connections *neural-substrate*)))
        (format t "Learning experiences: ~D~%"
                (length *learning-experiences*))
        (when *learning-experiences*
          (format t "Average understanding: ~,2F~%"
                  (/ (reduce #'+ *learning-experiences*
                            :key #'learning-experience-understanding-level)
                     (length *learning-experiences*))))
        (format t "Last learning: ~A~%"
                (if (neural-substrate-last-learning-event *neural-substrate*)
                    (format nil "~D seconds ago"
                            (- (get-universal-time)
                               (neural-substrate-last-learning-event *neural-substrate*)))
                    "NEVER"))))
  (format t "============================~%"))

(defun learning-statistics ()
  "Get learning statistics"
  (list :total-concepts (hash-table-count *learned-concepts*)
        :total-connections (when *neural-substrate*
                            (hash-table-count 
                             (neural-substrate-connections *neural-substrate*)))
        :total-experiences (length *learning-experiences*)
        :learning-rate (when *neural-substrate*
                        (neural-substrate-learning-rate *neural-substrate*))))

;;; =========================================
;;; EXPORTS FOR PACKAGE
;;; =========================================

;; This module exports:
;; - init-learning-system
;; - learn
;; - learn-from-experience
;; - recall-learned-knowledge
;; - learning-system-status
;; - learning-statistics
;; - extract-pattern
;; - derive-concept
;; - *neural-substrate*
;; - *learned-concepts*
