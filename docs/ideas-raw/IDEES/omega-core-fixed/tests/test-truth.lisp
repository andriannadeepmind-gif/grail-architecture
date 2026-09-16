;;;; tests/test-truth.lisp

(in-package :omega.tests)

(defun test-truth-axioms-exist ()
  "Test that truth axioms are defined"
  (assert (listp +truth-axioms+)
          () "FAIL: truth-axioms is not a list")
  (assert (> (length +truth-axioms+) 0)
          () "FAIL: truth-axioms is empty")
  (format t "[PASS] Truth axioms exist~%")
  t)

(defun test-truth-cannot-modify-axioms ()
  "Test that modifying axioms errors"
  (handler-case
      (progn
        (modify-truth-axioms '(:fake-axiom))
        (error "FAIL: modify-truth-axioms did not error"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] modify-truth-axioms correctly errors~%")
      t)))

(defun test-truth-cannot-remove-axiom ()
  "Test that removing axiom errors"
  (handler-case
      (progn
        (remove-truth-axiom :no-solution-is-final)
        (error "FAIL: remove-truth-axiom did not error"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] remove-truth-axiom correctly errors~%")
      t)))

(defun test-truth-verify-integrity ()
  "Test that verify-truth-integrity works"
  (reset-truth-for-testing)
  (init-truth)
  (assert (verify-truth-integrity nil)
          () "FAIL: verify-truth-integrity returned nil")
  (format t "[PASS] verify-truth-integrity works~%")
  t)

(defun run-truth-tests ()
  "Run all truth tests"
  (format t "~%=== TRUTH TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-truth-axioms-exist
                    test-truth-cannot-modify-axioms
                    test-truth-cannot-remove-axiom
                    test-truth-verify-integrity))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Truth: ~D passed, ~D failed~%" passed failed)
    (reset-truth-for-testing)
    (= failed 0)))
