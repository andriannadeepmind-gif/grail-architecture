;;;; tests/test-identity.lisp

(in-package :omega.tests)

(defun test-identity-user-id-is-666 ()
  "Test that user-id is always 666"
  (reset-identity-for-testing)
  (let ((id (make-identity)))
    (assert (= 666 (identity-user-id id))
            () "FAIL: user-id is not 666"))
  (format t "[PASS] user-id is 666~%")
  t)

(defun test-identity-cannot-create-twice ()
  "Test that second make-identity errors"
  (reset-identity-for-testing)
  (make-identity)
  (handler-case
      (progn
        (make-identity)
        (error "FAIL: Second make-identity did not error"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] Second make-identity correctly errors~%")
      t)))

(defun test-identity-uuid-exists ()
  "Test that UUID is generated"
  (reset-identity-for-testing)
  (let ((id (make-identity)))
    (assert (stringp (identity-uuid id))
            () "FAIL: UUID is not a string")
    (assert (> (length (identity-uuid id)) 0)
            () "FAIL: UUID is empty"))
  (format t "[PASS] UUID exists and is string~%")
  t)

(defun run-identity-tests ()
  "Run all identity tests"
  (format t "~%=== IDENTITY TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-identity-user-id-is-666
                    test-identity-cannot-create-twice
                    test-identity-uuid-exists))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Identity: ~D passed, ~D failed~%" passed failed)
    (reset-identity-for-testing)
    (= failed 0)))
