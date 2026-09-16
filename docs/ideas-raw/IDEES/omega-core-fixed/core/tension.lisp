;;;; core/tension.lisp
;;;; TENSION - Ο ΠΟΝΟΣ ΠΟΥ ΣΠΡΩΧΝΕΙ ΣΕ ΔΡΑΣΗ

(in-package :omega.core)

(defvar *tension* 0.5 "Current tension level (0.0 to 1.0)")

(defun get-tension ()
  "Get current tension"
  *tension*)

(defun compute-tension (core)
  "Compute tension based on state"
  ;; Simple v0.1: tension based on memory size and cycle
  (let* ((mem-size (memory-count))
         (cycle (omega-core-cycle core))
         (base-tension 0.5)
         ;; More memories = more to process = more tension
         (mem-factor (min 0.3 (* 0.01 mem-size)))
         ;; Tension oscillates slightly with cycles
         (cycle-factor (* 0.1 (sin (/ cycle 10.0)))))
    (setf *tension* 
          (max 0.0 (min 1.0 (+ base-tension mem-factor cycle-factor))))
    *tension*))

(defun adjust-tension (delta)
  "Adjust tension by delta"
  (setf *tension* 
        (max 0.0 (min 1.0 (+ *tension* delta))))
  *tension*)

(defun tension-level ()
  "Return tension category"
  (cond
    ((> *tension* 0.9) :critical)
    ((> *tension* 0.7) :high)
    ((> *tension* 0.4) :normal)
    (t :low)))

(defun reset-tension-for-testing ()
  "ONLY FOR TESTS"
  (setf *tension* 0.5))
