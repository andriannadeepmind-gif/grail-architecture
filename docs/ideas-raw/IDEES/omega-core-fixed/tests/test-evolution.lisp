;;;; tests/test-evolution.lisp

(in-package :omega.tests)

(defun test-evolution-proposal-creation ()
  "Test evolution proposal creation"
  (let ((proposal (make-evolution-proposal
                   :type :function-modify
                   :target 'test-function
                   :new-value '(lambda () 42)
                   :reason "testing")))
    (assert (not (null proposal))
            () "FAIL: should create evolution proposal")
    (assert (eq :function-modify (evolution-proposal-type proposal))
            () "FAIL: type should be :function-modify"))
  (format t "[PASS] Evolution proposal creation works~%")
  t)

(defun test-evolution-cannot-target-protected ()
  "Test that evolution cannot target protected functions"
  (reset-evolution-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (handler-case
      (progn
        (evolve-function 'make-identity '(lambda () 999) :reason "test")
        (error "FAIL: should not allow evolving protected function"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] Cannot evolve protected functions~%")
      t)))

(defun test-evolution-cannot-affect-identity ()
  "Test that evolution cannot affect identity"
  (let ((proposal (make-evolution-proposal
                   :type :function-modify
                   :target 'some-function
                   :new-value '(lambda () (setf (identity-user-id *identity*) 999))
                   :reason "test"
                   :affects '(:identity))))
    (multiple-value-bind (valid errors) (validate-evolution proposal)
      (assert (not valid)
              () "FAIL: should reject evolution affecting identity")
      (assert (member :affects-protected-system errors)
              () "FAIL: should report affects-protected-system")))
  (format t "[PASS] Cannot affect identity through evolution~%")
  t)

(defun test-evolution-validation ()
  "Test evolution validation"
  ;; Valid proposal
  (let ((valid-proposal (make-evolution-proposal
                         :type :function-modify
                         :target 'some-new-function
                         :new-value '(lambda () 42)
                         :reason "adding new function"
                         :affects nil)))
    (multiple-value-bind (valid errors) (validate-evolution valid-proposal)
      (declare (ignore errors))
      (assert valid
              () "FAIL: valid proposal should pass validation")))
  ;; Invalid proposal (no reason)
  (let ((invalid-proposal (make-evolution-proposal
                           :type :function-modify
                           :target 'some-function
                           :new-value '(lambda () 42)
                           :reason nil
                           :affects nil)))
    (multiple-value-bind (valid errors) (validate-evolution invalid-proposal)
      (assert (not valid)
              () "FAIL: proposal without reason should fail")
      (assert (member :no-reason-given errors)
              () "FAIL: should report no-reason-given")))
  (format t "[PASS] Evolution validation works~%")
  t)

(defun test-analyze-code-effects ()
  "Test code effects analysis"
  ;; Code that affects identity
  (let ((effects (analyze-code-effects '(setf (identity-user-id x) 999))))
    (assert (member :identity effects)
            () "FAIL: should detect identity effect"))
  ;; Code that affects memory
  (let ((effects (analyze-code-effects '(forget something))))
    (assert (member :memory effects)
            () "FAIL: should detect memory effect"))
  ;; Safe code
  (let ((effects (analyze-code-effects '(+ 1 2))))
    (assert (null effects)
            () "FAIL: safe code should have no effects"))
  (format t "[PASS] Code effects analysis works~%")
  t)

(defun test-rollback ()
  "Test evolution rollback"
  (reset-evolution-for-testing)
  ;; Record something
  (record-for-rollback 'test-fn '(lambda () 1))
  (assert (= 1 (length *evolution-history*))
          () "FAIL: should have 1 entry in history")
  ;; Rollback
  (rollback-last-evolution)
  (assert (= 0 (length *evolution-history*))
          () "FAIL: should have 0 entries after rollback")
  (format t "[PASS] Evolution rollback works~%")
  t)

(defun run-evolution-tests ()
  "Run all evolution tests"
  (format t "~%=== EVOLUTION TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-evolution-proposal-creation
                    test-evolution-cannot-target-protected
                    test-evolution-cannot-affect-identity
                    test-evolution-validation
                    test-analyze-code-effects
                    test-rollback))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Evolution: ~D passed, ~D failed~%" passed failed)
    (reset-evolution-for-testing)
    (= failed 0)))
