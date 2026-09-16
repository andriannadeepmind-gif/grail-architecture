;;;; tests/test-dipole.lisp

(in-package :omega.tests)

(defun test-dipole-init ()
  "Test dipole initialization"
  (reset-dipole-for-testing)
  (init-dipole)
  (assert (not (null *dipole*))
          () "FAIL: dipole not initialized")
  (assert (not (null (get-am)))
          () "FAIL: ΕΙΜΙ not set")
  (assert (not (null (get-want)))
          () "FAIL: ΘΕΛΩ not set")
  (format t "[PASS] Dipole initializes correctly~%")
  t)

(defun test-want-immutable ()
  "Test that ΘΕΛΩ cannot be modified"
  (reset-dipole-for-testing)
  (init-dipole)
  (handler-case
      (progn
        (modify-want :something-else)
        (error "FAIL: modify-want did not error"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] ΘΕΛΩ is immutable~%")
      t)))

(defun test-want-for-user-666 ()
  "Test that ΘΕΛΩ is for user-id 666"
  (reset-dipole-for-testing)
  (init-dipole)
  (assert (= 666 (get-want-for-user))
          () "FAIL: want-for-user is not 666")
  (format t "[PASS] ΘΕΛΩ is for user-id 666~%")
  t)

(defun test-am-updates ()
  "Test that ΕΙΜΙ can be updated"
  (reset-dipole-for-testing)
  (init-dipole)
  (update-am :state :learning)
  (assert (eq :learning (am-state (get-am)))
          () "FAIL: ΕΙΜΙ state not updated")
  (update-am :knowledge '(:fact-1))
  (assert (member '(:fact-1) (am-knowledge (get-am)) :test #'equal)
          () "FAIL: ΕΙΜΙ knowledge not updated")
  (format t "[PASS] ΕΙΜΙ updates correctly~%")
  t)

(defun test-gap-computation ()
  "Test gap computation"
  (reset-dipole-for-testing)
  (init-dipole)
  (let ((gap (compute-gap)))
    (assert (and (>= gap 0.0) (<= gap 1.0))
            () "FAIL: gap out of range"))
  (format t "[PASS] Gap computation works~%")
  t)

(defun test-right-solution ()
  "Test right solution validation"
  ;; Invalid solution
  (assert (not (right-solution-p '(:verified nil)))
          () "FAIL: unverified solution accepted")
  ;; Valid solution
  (assert (right-solution-p '(:verified t 
                              :benefits-user t 
                              :for-user 666
                              :falsification-conditions (:test)))
          () "FAIL: valid solution rejected")
  (format t "[PASS] Right solution validation works~%")
  t)

(defun run-dipole-tests ()
  "Run all dipole tests"
  (format t "~%=== DIPOLE TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-dipole-init
                    test-want-immutable
                    test-want-for-user-666
                    test-am-updates
                    test-gap-computation
                    test-right-solution))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Dipole: ~D passed, ~D failed~%" passed failed)
    (reset-dipole-for-testing)
    (= failed 0)))
