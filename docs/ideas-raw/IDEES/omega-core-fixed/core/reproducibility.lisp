;;;; core/reproducibility.lisp
;;;; REPRODUCIBILITY SYSTEM - Same input + same seed = same output, ALWAYS
;;;; Critical for legal accountability and trust

(in-package :omega.core)

;;; =========================================
;;; DECISION TRACING
;;; =========================================

(defstruct decision-trace
  "Complete record of a decision for reproducibility"
  (id (generate-uuid))
  (input nil)                       ; Original input
  (random-seed nil)                 ; Seed used for any randomness
  (omega-state-hash nil)            ; Hash of omega state at time
  (reasoning-path nil)              ; Step-by-step reasoning
  (intermediate-results nil)        ; All intermediate values
  (output nil)                      ; Final output
  (timestamp (get-universal-time))
  (cycle nil)                       ; Which omega cycle
  (meta-level nil)                  ; Meta-level at time
  (verification-hash nil))          ; Hash to verify integrity

(defstruct reproducibility-context
  "Context needed to reproduce a decision"
  (seed nil)
  (omega-state nil)
  (knowledge-snapshot nil)
  (domain-state nil))

;;; =========================================
;;; TRACE STORAGE
;;; =========================================

(defvar *decision-traces* (make-hash-table :test #'equal)
  "All decision traces for reproducibility")

(defvar *reproducibility-enabled* t
  "Global flag for reproducibility tracking")

(defvar *current-random-state* nil
  "Current random state for reproducible randomness")

;;; =========================================
;;; REPRODUCIBLE DECISION MAKING
;;; =========================================

(defmacro with-reproducibility ((&key seed input) &body body)
  "Execute body with reproducibility guarantees"
  `(let* ((actual-seed (or ,seed (get-universal-time)))
          (*current-random-state* (make-random-state actual-seed))
          (trace (when *reproducibility-enabled*
                   (make-decision-trace
                    :input ,input
                    :random-seed actual-seed
                    :omega-state-hash (hash-omega-state)
                    :cycle (if (boundp '*omega-core*)
                              (omega-core-cycle *omega-core*)
                              0)
                    :meta-level *meta-level*))))
     
     ;; Execute with tracing
     (let ((result (progn ,@body)))
       
       ;; Complete the trace
       (when trace
         (setf (decision-trace-output trace) result)
         (setf (decision-trace-verification-hash trace)
               (compute-verification-hash trace))
         (store-trace trace))
       
       ;; Return result
       result)))

(defun reproducible-decision (input &optional (seed nil))
  "Make a decision with full reproducibility"
  (with-reproducibility (:seed seed :input input)
    (let ((decision (make-decision-internal input)))
      ;; Record reasoning path
      (when *decision-traces*
        (record-reasoning-step :decision decision))
      decision)))

(defun make-decision-internal (input)
  "Internal decision making - must be deterministic given seed"
  ;; Parse input
  (let ((parsed (parse-input input)))
    
    ;; Generate options (deterministically)
    (let ((options (generate-options parsed)))
      
      ;; Evaluate each option
      (let ((evaluations (mapcar #'evaluate-option options)))
        
        ;; Select best (deterministically)
        (let ((best (select-best-option evaluations)))
          
          ;; Record all steps
          (record-reasoning-step :parsed parsed)
          (record-reasoning-step :options options)
          (record-reasoning-step :evaluations evaluations)
          (record-reasoning-step :selected best)
          
          ;; Return decision
          best)))))

;;; =========================================
;;; REPRODUCIBLE RANDOMNESS
;;; =========================================

(defun reproducible-random (limit)
  "Get reproducible random number"
  (if *current-random-state*
      (random limit *current-random-state*)
      (random limit)))

(defun reproducible-shuffle (list)
  "Reproducibly shuffle a list"
  (let ((array (make-array (length list) :initial-contents list)))
    (loop for i from (1- (length array)) downto 1
          do (let ((j (reproducible-random (1+ i))))
               (rotatef (aref array i) (aref array j))))
    (coerce array 'list)))

(defun reproducible-choice (choices)
  "Make reproducible choice from options"
  (nth (reproducible-random (length choices)) choices))

;;; =========================================
;;; STATE HASHING
;;; =========================================

(defun hash-omega-state ()
  "Create hash of current omega state for reproducibility"
  ;; This is simplified - real implementation would be comprehensive
  (sxhash (list :identity (when *identity* (identity-uuid *identity*))
                :cycle (when (boundp '*omega-core*)
                         (omega-core-cycle *omega-core*))
                :tension (when (boundp '*omega-core*)
                          (omega-core-tension *omega-core*))
                :memory-count (memory-count)
                :meta-level *meta-level*)))

(defun compute-verification-hash (trace)
  "Compute hash to verify trace hasn't been tampered with"
  (sxhash (list (decision-trace-input trace)
                (decision-trace-random-seed trace)
                (decision-trace-omega-state-hash trace)
                (decision-trace-output trace))))

;;; =========================================
;;; TRACE MANAGEMENT
;;; =========================================

(defun store-trace (trace)
  "Store a decision trace"
  (setf (gethash (decision-trace-id trace) *decision-traces*) trace)
  ;; Also remember for omega memory
  (remember :decision-trace (decision-trace-id trace))
  trace)

(defun get-trace (id)
  "Retrieve a decision trace"
  (gethash id *decision-traces*))

(defun verify-trace (id)
  "Verify a trace hasn't been tampered with"
  (let ((trace (get-trace id)))
    (when trace
      (= (decision-trace-verification-hash trace)
         (compute-verification-hash trace)))))

(defun record-reasoning-step (step-name step-data)
  "Record a reasoning step in current trace"
  ;; This would be more sophisticated in real implementation
  (when *reproducibility-enabled*
    (remember :reasoning-step (list step-name step-data))))

;;; =========================================
;;; REPRODUCTION SYSTEM
;;; =========================================

(defun reproduce-decision (trace-id)
  "Reproduce a decision from its trace"
  (let ((trace (get-trace trace-id)))
    (when trace
      ;; Restore context
      (with-reproducibility (:seed (decision-trace-random-seed trace)
                            :input (decision-trace-input trace))
        ;; Make decision again
        (let ((new-result (make-decision-internal 
                          (decision-trace-input trace))))
          ;; Verify it matches
          (if (equal new-result (decision-trace-output trace))
              (progn
                (format t "~%Successfully reproduced decision ~A~%" trace-id)
                new-result)
              (progn
                (format t "~%WARNING: Reproduction mismatch for ~A~%" trace-id)
                (format t "Original: ~A~%" (decision-trace-output trace))
                (format t "Reproduced: ~A~%" new-result)
                nil)))))))

(defun find-traces-for-input (input &optional (limit 10))
  "Find traces for similar inputs"
  (let ((matches nil))
    (maphash (lambda (id trace)
               (when (similar-input-p input (decision-trace-input trace))
                 (push trace matches)))
             *decision-traces*)
    (subseq matches 0 (min limit (length matches)))))

(defun similar-input-p (input1 input2)
  "Check if two inputs are similar"
  ;; Simplified - real implementation would be more sophisticated
  (or (equal input1 input2)
      (and (consp input1) (consp input2)
           (eq (first input1) (first input2)))))

;;; =========================================
;;; AUDIT FUNCTIONS
;;; =========================================

(defun trace-audit-report (trace-id)
  "Generate audit report for a decision"
  (let ((trace (get-trace trace-id)))
    (when trace
      (format t "~%=== DECISION AUDIT REPORT ===~%")
      (format t "ID: ~A~%" (decision-trace-id trace))
      (format t "Timestamp: ~A~%" (decision-trace-timestamp trace))
      (format t "Input: ~A~%" (decision-trace-input trace))
      (format t "Seed: ~A~%" (decision-trace-random-seed trace))
      (format t "Cycle: ~A~%" (decision-trace-cycle trace))
      (format t "Meta-level: ~A~%" (decision-trace-meta-level trace))
      (format t "Output: ~A~%" (decision-trace-output trace))
      (format t "Verification: ~A~%"
              (if (verify-trace trace-id) "VALID" "INVALID"))
      (format t "=============================~%"))))

(defun reproducibility-statistics ()
  "Get statistics about reproducibility"
  (let ((total (hash-table-count *decision-traces*))
        (verified 0)
        (recent nil))
    ;; Count verified
    (maphash (lambda (id trace)
               (declare (ignore trace))
               (when (verify-trace id)
                 (incf verified)))
             *decision-traces*)
    ;; Get recent
    (maphash (lambda (id trace)
               (declare (ignore id))
               (push trace recent))
             *decision-traces*)
    (setf recent (sort recent #'> :key #'decision-trace-timestamp))
    
    (list :total-traces total
          :verified verified
          :recent (subseq recent 0 (min 10 (length recent))))))

;;; =========================================
;;; REPRODUCIBILITY STATUS
;;; =========================================

(defun reproducibility-status ()
  "Display reproducibility system status"
  (format t "~%=== REPRODUCIBILITY STATUS ===~%")
  (format t "Enabled: ~A~%" (if *reproducibility-enabled* "YES" "NO"))
  (format t "Total Traces: ~D~%" (hash-table-count *decision-traces*))
  
  (let ((stats (reproducibility-statistics)))
    (format t "Verified: ~D / ~D~%"
            (getf stats :verified)
            (getf stats :total-traces))
    
    (format t "~%Recent Decisions:~%")
    (dolist (trace (subseq (getf stats :recent) 0 5))
      (format t "  ~A: ~A -> ~A~%"
              (subseq (decision-trace-id trace) 0 8)
              (decision-trace-input trace)
              (decision-trace-output trace))))
  
  (format t "==============================~%")
  (format t "Reproducibility ensures legal accountability.~%")
  (format t "Same input + same seed = same output, ALWAYS.~%")
  (format t "==============================~%"))

;;; =========================================
;;; TESTING UTILITIES
;;; =========================================

(defun test-reproducibility ()
  "Test that decisions are reproducible"
  (format t "~%Testing reproducibility...~%")
  
  ;; Make decision with specific seed
  (let ((input '(:legal-query "Article 25"))
        (seed 12345))
    (let ((result1 (reproducible-decision input seed)))
      (format t "First decision: ~A~%" result1)
      
      ;; Make same decision with same seed
      (let ((result2 (reproducible-decision input seed)))
        (format t "Second decision: ~A~%" result2)
        
        ;; Should be identical
        (if (equal result1 result2)
            (format t "SUCCESS: Decisions are reproducible~%")
            (format t "FAILURE: Decisions differ~%")))))
  t)
