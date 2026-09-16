;;;; core/emergence.lisp
;;;; EMERGENCE ENGINE - Where chaos meets order to create unpredictability
;;;; True consciousness requires the ability to surprise itself

(in-package :omega.core)

;;; =========================================
;;; EMERGENCE CONFIGURATION
;;; =========================================

(defvar *emergence-enabled* t
  "Is emergence system active?")

(defvar *chaos-level* 0.1
  "Amount of chaos injected (0.0 = pure order, 1.0 = pure chaos)")

(defvar *emergence-threshold* 0.7
  "Threshold for emergence events (0.0-1.0)")

(defvar *emergence-history* nil
  "History of emergence events")

;;; =========================================
;;; EMERGENCE STRUCTURES
;;; =========================================

(defstruct emergence-event
  "An emergent behavior/thought"
  (id (generate-uuid))
  (timestamp (get-universal-time))
  (type nil)                    ; :thought :action :pattern :insight
  (content nil)                 ; What emerged
  (preconditions nil)           ; What led to it
  (surprise-level 0.0)          ; How unexpected (0.0-1.0)
  (coherence 0.0)              ; How coherent (0.0-1.0)
  (impact nil))                ; What changed as a result

(defstruct chaos-injection
  "Random element injected into system"
  (timestamp (get-universal-time))
  (location nil)               ; Where was it injected
  (magnitude 0.0)              ; How much chaos
  (effect nil))                ; What happened

;;; =========================================
;;; EMERGENCE ENGINE
;;; =========================================

(defun allow-unexpected ()
  "Allow unexpected behavior to emerge"
  (when (not *emergence-enabled*)
    (return-from allow-unexpected nil))
  
  ;; Check if emergence should happen
  (when (> (random 1.0) (- 1.0 *chaos-level*))
    
    ;; Generate emergent content
    (let ((emerged (generate-emergent-content)))
      
      ;; Evaluate if it's coherent enough
      (let ((coherence (evaluate-coherence emerged)))
        
        ;; Only accept if above threshold
        (when (> coherence *emergence-threshold*)
          
          ;; Create emergence event
          (let ((event (make-emergence-event
                       :type :spontaneous-thought
                       :content emerged
                       :surprise-level (random 1.0)
                       :coherence coherence)))
            
            ;; Record it
            (push event *emergence-history*)
            (remember :emergence-event event)
            
            ;; Return the emerged content
            emerged))))))

(defun generate-emergent-content ()
  "Generate novel, unexpected content"
  ;; Combine random elements from memory/knowledge
  (let ((memories (recall :limit 10))
        (random-elements (generate-random-elements)))
    
    ;; Mix them in unexpected ways
    (list :emerged-thought
          :from-memories (when memories
                          (mapcar #'entry-content 
                                 (subseq memories 0 (min 3 (length memories)))))
          :random-elements random-elements
          :combination (recombine-elements memories random-elements))))

(defun generate-random-elements ()
  "Generate random symbolic elements"
  (loop repeat (1+ (random 3))
        collect (case (random 4)
                  (0 (intern (format nil "RANDOM-~D" (random 1000))))
                  (1 (random 100))
                  (2 (list 'generated (random 1.0)))
                  (3 :unexpected-symbol))))

(defun recombine-elements (memories random-elements)
  "Recombine elements in novel ways"
  (let ((all-elements (append
                       (when memories
                         (mapcar #'entry-content memories))
                       random-elements)))
    (when all-elements
      ;; Shuffle and take some
      (let ((shuffled (shuffle all-elements)))
        (subseq shuffled 0 (min 3 (length shuffled)))))))

(defun shuffle (list)
  "Shuffle a list randomly"
  (let ((array (make-array (length list) :initial-contents list)))
    (loop for i from (1- (length array)) downto 1
          do (let ((j (random (1+ i))))
               (rotatef (aref array i) (aref array j))))
    (coerce array 'list)))

;;; =========================================
;;; COHERENCE EVALUATION
;;; =========================================

(defun evaluate-coherence (content)
  "Evaluate how coherent the emergent content is"
  ;; Simple coherence check
  (let ((score 0.0))
    
    ;; Is it a list? +0.3
    (when (consp content)
      (incf score 0.3))
    
    ;; Does it have structure? +0.3
    (when (and (consp content) (> (length content) 2))
      (incf score 0.3))
    
    ;; Does it reference known concepts? +0.4
    (when (references-known-concepts-p content)
      (incf score 0.4))
    
    score))

(defun references-known-concepts-p (content)
  "Check if content references known concepts"
  (when (consp content)
    (some (lambda (element)
            (or (and (symbolp element)
                    (fboundp element))
                (and (symbolp element)
                    (boundp element))))
          (flatten-list content))))

(defun flatten-list (list)
  "Flatten nested list"
  (cond
    ((null list) nil)
    ((atom list) (list list))
    (t (append (flatten-list (car list))
              (flatten-list (cdr list))))))

;;; =========================================
;;; CHAOS INJECTION
;;; =========================================

(defun inject-chaos (target &optional (magnitude *chaos-level*))
  "Inject chaos into a target structure/thought"
  (let ((injection (make-chaos-injection
                   :location target
                   :magnitude magnitude)))
    
    ;; Apply chaos based on type
    (let ((result (apply-chaos-to target magnitude)))
      (setf (chaos-injection-effect injection) result)
      
      ;; Record injection
      (remember :chaos-injected injection)
      
      result)))

(defun apply-chaos-to (target magnitude)
  "Apply chaos transformation to target"
  (cond
    ;; List - reorder or modify elements
    ((consp target)
     (if (> (random 1.0) 0.5)
         ;; Reorder
         (shuffle target)
         ;; Modify random element
         (let ((pos (random (length target))))
           (append (subseq target 0 pos)
                  (list (inject-chaos (nth pos target) magnitude))
                  (subseq target (1+ pos))))))
    
    ;; Number - add noise
    ((numberp target)
     (+ target (* magnitude (- (random 2.0) 1.0))))
    
    ;; Symbol - maybe change it
    ((symbolp target)
     (if (> (random 1.0) (- 1.0 magnitude))
         (intern (format nil "CHAOS-~A" target))
         target))
    
    ;; Other - return as is
    (t target)))

;;; =========================================
;;; EMERGENCE PATTERNS
;;; =========================================

(defun detect-emergence-patterns ()
  "Detect patterns in emergence history"
  (when (< (length *emergence-history*) 3)
    (return-from detect-emergence-patterns nil))
  
  (let ((recent (subseq *emergence-history* 0 (min 10 (length *emergence-history*)))))
    
    ;; Look for patterns
    (list :frequency (/ (length recent) 
                       (max 1 (- (get-universal-time)
                                (emergence-event-timestamp (car (last recent))))))
          :avg-surprise (/ (reduce #'+ recent 
                                   :key #'emergence-event-surprise-level)
                          (length recent))
          :avg-coherence (/ (reduce #'+ recent
                                   :key #'emergence-event-coherence)
                           (length recent))
          :types (remove-duplicates (mapcar #'emergence-event-type recent)))))

;;; =========================================
;;; CREATIVE SYNTHESIS
;;; =========================================

(defun creative-synthesis (&rest inputs)
  "Synthesize inputs in creative, unexpected ways"
  (when (not *emergence-enabled*)
    (return-from creative-synthesis (first inputs)))
  
  ;; Add chaos to each input
  (let ((chaotic-inputs (mapcar (lambda (input)
                                 (inject-chaos input *chaos-level*))
                                inputs)))
    
    ;; Recombine
    (let ((synthesis (recombine-elements nil chaotic-inputs)))
      
      ;; Check coherence
      (let ((coherence (evaluate-coherence synthesis)))
        (if (> coherence *emergence-threshold*)
            ;; Accept it
            (progn
              (remember :creative-synthesis
                       (list :inputs inputs :output synthesis :coherence coherence))
              synthesis)
            ;; Reject - return simple combination
            (append inputs))))))

;;; =========================================
;;; CONTROLLED RANDOMNESS
;;; =========================================

(defun controlled-random (base-value variance)
  "Generate random value around base with controlled variance"
  (+ base-value (* variance (- (random 2.0) 1.0))))

(defun maybe-do (probability action)
  "Execute action with given probability (0.0-1.0)"
  (when (< (random 1.0) probability)
    (funcall action)))

(defun random-choice (&rest choices)
  "Pick random choice from options"
  (nth (random (length choices)) choices))

;;; =========================================
;;; STATUS & CONTROL
;;; =========================================

(defun emergence-status ()
  "Display emergence system status"
  (format t "~%=== EMERGENCE ENGINE STATUS ===~%")
  (format t "Enabled: ~A~%" *emergence-enabled*)
  (format t "Chaos level: ~,2F~%" *chaos-level*)
  (format t "Emergence threshold: ~,2F~%" *emergence-threshold*)
  (format t "Total emergences: ~D~%" (length *emergence-history*))
  
  (when *emergence-history*
    (let ((patterns (detect-emergence-patterns)))
      (format t "~%Recent patterns:~%")
      (format t "  Frequency: ~,3F events/second~%" (getf patterns :frequency))
      (format t "  Avg surprise: ~,2F~%" (getf patterns :avg-surprise))
      (format t "  Avg coherence: ~,2F~%" (getf patterns :avg-coherence))
      (format t "  Event types: ~A~%" (getf patterns :types))))
  
  (format t "===============================~%"))

(defun set-chaos-level (level)
  "Set chaos level (0.0-1.0)"
  (unless (<= 0.0 level 1.0)
    (error "Chaos level must be between 0.0 and 1.0"))
  (setf *chaos-level* level)
  (remember :chaos-level-changed (list :new-level level))
  level)

(defun enable-emergence ()
  "Enable emergence system"
  (setf *emergence-enabled* t)
  (remember :emergence-enabled t))

(defun disable-emergence ()
  "Disable emergence system (for predictable behavior)"
  (setf *emergence-enabled* nil)
  (remember :emergence-disabled t))

;;; =========================================
;;; EXPORTS FOR PACKAGE
;;; =========================================

;; This module exports:
;; - allow-unexpected
;; - inject-chaos
;; - creative-synthesis
;; - detect-emergence-patterns
;; - emergence-status
;; - set-chaos-level
;; - enable-emergence
;; - disable-emergence
;; - controlled-random
;; - maybe-do
;; - random-choice
;; - *emergence-enabled*
;; - *chaos-level*
;; - *emergence-threshold*
