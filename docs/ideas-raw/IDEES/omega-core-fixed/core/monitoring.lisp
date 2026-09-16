;;;; core/monitoring.lisp
;;;; ENGINEERING MONITORING SYSTEM - Audit, verification, anomaly detection
;;;; This is NOT "consciousness" - it's professional system monitoring

(in-package :omega.core)

;;; =========================================
;;; MONITORING STRUCTURES
;;; =========================================

(defstruct monitor-event
  "An event detected by monitoring"
  (timestamp (get-universal-time))
  (type nil)                        ; :invariant :anomaly :performance :audit
  (severity nil)                    ; :info :warning :error :critical
  (source nil)                      ; Which monitor detected it
  (description nil)
  (data nil))                       ; Associated data

(defstruct monitor-thread
  "A monitoring thread"
  (name nil)
  (function nil)
  (thread nil)
  (active nil)
  (interval 0.1)                    ; Check interval in seconds
  (events-detected 0))

;;; =========================================
;;; MONITORING STATE
;;; =========================================

(defvar *monitors* (make-hash-table :test #'eq)
  "Active monitoring threads")

(defvar *monitor-log* nil
  "Log of all monitoring events")

(defvar *monitoring-active* nil
  "Global monitoring on/off switch")

;;; =========================================
;;; CORE MONITORS
;;; =========================================

(defun invariant-monitor (core)
  "Monitor that all invariants are maintained"
  (loop while *monitoring-active*
        do (progn
             ;; Check identity
             (unless (and *identity*
                         (= (identity-user-id *identity*) 666))
               (log-monitor-event :invariant :critical
                                  "Identity invariant violation"))
             
             ;; Check truth axioms
             (unless (and *truth*
                         (equal (truth-axioms *truth*) +truth-axioms+))
               (log-monitor-event :invariant :critical
                                  "Truth axioms modified"))
             
             ;; Check memory is append-only (by checking it hasn't shrunk)
             (let ((current-count (memory-count)))
               (when (< current-count (or (getf (omega-core-last-percept core) 
                                                :memory-size) 0))
                 (log-monitor-event :invariant :critical
                                    "Memory shrinkage detected")))
             
             ;; Check guards are active
             (unless (and *guards* (guards-active *guards*))
               (log-monitor-event :invariant :critical
                                  "Evolution guards inactive"))
             
             (sleep 0.1))))

(defun anomaly-monitor (core)
  "Detect anomalous patterns in system behavior"
  (let ((last-tension (omega-core-tension core))
        (tension-changes 0))
    (loop while *monitoring-active*
          do (progn
               (let ((current-tension (omega-core-tension core)))
                 ;; Sudden tension spike
                 (when (> (abs (- current-tension last-tension)) 0.5)
                   (log-monitor-event :anomaly :warning
                                      (format nil "Tension spike: ~,2F -> ~,2F"
                                              last-tension current-tension)))
                 
                 ;; Oscillating tension
                 (when (/= (signum (- current-tension last-tension))
                          (signum (- last-tension current-tension)))
                   (incf tension-changes)
                   (when (> tension-changes 10)
                     (log-monitor-event :anomaly :warning
                                        "Tension oscillation detected")
                     (setf tension-changes 0)))
                 
                 (setf last-tension current-tension))
               
               ;; Check for stuck cycles
               (when (and (> (omega-core-cycle core) 100)
                         (equal (omega-core-last-decision core)
                                (omega-core-last-action core)))
                 (log-monitor-event :anomaly :info
                                    "Repetitive decision pattern"))
               
               (sleep 0.1)))))

(defun performance-monitor (core)
  "Monitor system performance metrics"
  (let ((last-cycle (omega-core-cycle core))
        (last-check-time (get-universal-time)))
    (loop while *monitoring-active*
          do (progn
               (let* ((current-cycle (omega-core-cycle core))
                      (current-time (get-universal-time))
                      (cycles-elapsed (- current-cycle last-cycle))
                      (time-elapsed (- current-time last-check-time)))
                 
                 ;; Calculate cycles per second
                 (when (> time-elapsed 0)
                   (let ((cps (/ cycles-elapsed time-elapsed)))
                     (cond
                       ;; Too slow
                       ((< cps 0.1)
                        (log-monitor-event :performance :warning
                                           (format nil "Low performance: ~,2F cycles/sec" cps)))
                       ;; Normal
                       ((< cps 10)
                        (log-monitor-event :performance :info
                                           (format nil "Normal performance: ~,2F cycles/sec" cps)))
                       ;; Too fast (might be spinning)
                       ((> cps 100)
                        (log-monitor-event :performance :warning
                                           (format nil "Possible spin: ~,2F cycles/sec" cps))))))
                 
                 ;; Memory growth check
                 (let ((mem-size (memory-count)))
                   (when (> mem-size 10000)
                     (log-monitor-event :performance :warning
                                        (format nil "Large memory: ~D entries" mem-size))))
                 
                 (setf last-cycle current-cycle)
                 (setf last-check-time current-time))
               
               (sleep 1.0)))))  ; Check less frequently

(defun audit-monitor (core)
  "Create audit trail of all significant decisions"
  (let ((last-decision nil))
    (loop while *monitoring-active*
          do (progn
               ;; Log decision changes
               (let ((current-decision (omega-core-last-decision core)))
                 (when (and current-decision
                           (not (equal current-decision last-decision)))
                   (log-monitor-event :audit :info
                                      (format nil "Decision: ~A" current-decision)
                                      :data current-decision)
                   (setf last-decision current-decision)))
               
               ;; Log actions taken
               (let ((current-action (omega-core-last-action core)))
                 (when current-action
                   (log-monitor-event :audit :info
                                      (format nil "Action: ~A" current-action)
                                      :data current-action)))
               
               ;; Log meta-level changes
               (when (> *meta-level* 0)
                 (log-monitor-event :audit :info
                                    (format nil "Meta-level: ~D" *meta-level*)))
               
               (sleep 0.2)))))

;;; =========================================
;;; MONITORING CONTROL
;;; =========================================

(defun start-monitoring-threads (core)
  "Start all monitoring threads - ENGINEERING MONITORING, NOT CONSCIOUSNESS"
  (format t "~%Starting engineering monitoring threads...~%")
  
  ;; Check if threading is available
  (handler-case
      (progn
        (require :bordeaux-threads)
        (setf *monitoring-active* t)
        
        ;; Start each monitor
        (dolist (monitor-def
                 '((:invariant invariant-monitor 0.1 "Invariant checker")
                   (:anomaly anomaly-monitor 0.1 "Anomaly detector")
                   (:performance performance-monitor 1.0 "Performance tracker")
                   (:audit audit-monitor 0.2 "Audit logger")))
          (destructuring-bind (name function interval description) monitor-def
            (let* ((monitor (make-monitor-thread
                             :name name
                             :function function
                             :interval interval))
                   (thread (bt:make-thread
                            (lambda () (funcall function core))
                            :name (string name))))
              (setf (monitor-thread-thread monitor) thread)
              (setf (monitor-thread-active monitor) t)
              (setf (gethash name *monitors*) monitor)
              (format t "  Started ~A: ~A~%" name description))))
        
        (format t "Monitoring active. This is system monitoring, not consciousness.~%")
        t)
    (error (e)
      (format t "Threading not available: ~A~%" e)
      (format t "Running in single-threaded mode - monitoring disabled.~%")
      nil)))

(defun stop-monitoring-threads ()
  "Stop all monitoring threads"
  (setf *monitoring-active* nil)
  (format t "~%Stopping monitoring threads...~%")
  (maphash (lambda (name monitor)
             (declare (ignore name))
             (setf (monitor-thread-active monitor) nil))
           *monitors*)
  ;; Give threads time to exit
  (sleep 0.5)
  (format t "Monitoring stopped.~%")
  t)

;;; =========================================
;;; EVENT LOGGING
;;; =========================================

(defun log-monitor-event (type severity description &key source data)
  "Log a monitoring event"
  (let ((event (make-monitor-event
                :type type
                :severity severity
                :description description
                :source source
                :data data)))
    (push event *monitor-log*)
    
    ;; Also remember critical events
    (when (eq severity :critical)
      (remember :critical-event event))
    
    ;; Display warnings and above
    (when (member severity '(:warning :error :critical))
      (format t "~%[MONITOR] ~A: ~A~%" severity description))
    
    event))

(defun get-monitor-events (&key type severity (limit 100))
  "Retrieve monitoring events"
  (let ((events *monitor-log*))
    ;; Filter by type
    (when type
      (setf events (remove-if-not (lambda (e) (eq (monitor-event-type e) type))
                                   events)))
    ;; Filter by severity
    (when severity
      (setf events (remove-if-not (lambda (e) (eq (monitor-event-severity e) severity))
                                   events)))
    ;; Limit
    (subseq events 0 (min limit (length events)))))

;;; =========================================
;;; MONITORING STATUS
;;; =========================================

(defun monitoring-status ()
  "Display monitoring system status"
  (format t "~%=== MONITORING STATUS ===~%")
  (format t "Active: ~A~%" (if *monitoring-active* "YES" "NO"))
  (format t "Active Monitors: ~D~%" (hash-table-count *monitors*))
  
  (when *monitoring-active*
    (maphash (lambda (name monitor)
               (format t "  ~A: ~A (events: ~D)~%"
                       name
                       (if (monitor-thread-active monitor) "RUNNING" "STOPPED")
                       (monitor-thread-events-detected monitor)))
             *monitors*))
  
  (format t "Total Events Logged: ~D~%" (length *monitor-log*))
  
  ;; Show recent critical events
  (let ((critical (get-monitor-events :severity :critical :limit 5)))
    (when critical
      (format t "Recent Critical Events:~%")
      (dolist (event critical)
        (format t "  - ~A~%" (monitor-event-description event)))))
  
  (format t "=========================~%")
  (format t "This is engineering monitoring for audit and safety.~%")
  (format t "It is NOT a consciousness mechanism.~%")
  (format t "=========================~%"))

;;; =========================================
;;; MONITORING ASSERTIONS
;;; =========================================

(defun assert-invariants ()
  "Assert all invariants hold - for testing"
  (assert (= (identity-user-id *identity*) 666)
          () "Identity invariant violated")
  (assert (equal (truth-axioms *truth*) +truth-axioms+)
          () "Truth axioms modified")
  (assert (guards-active *guards*)
          () "Guards inactive")
  t)

(defun monitoring-self-test ()
  "Test monitoring system itself"
  (format t "~%Running monitoring self-test...~%")
  
  ;; Test event logging
  (log-monitor-event :test :info "Test event")
  (assert (find :test *monitor-log* :key #'monitor-event-type))
  
  ;; Test filtering
  (log-monitor-event :test :critical "Critical test")
  (assert (get-monitor-events :severity :critical))
  
  (format t "Monitoring self-test passed.~%")
  t)
