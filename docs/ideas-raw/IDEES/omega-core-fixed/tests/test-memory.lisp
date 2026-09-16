;;;; tests/test-memory.lisp

(in-package :omega.tests)

(defun test-memory-remember-works ()
  "Test that remember adds entries"
  (reset-memory-for-testing)
  (init-memory)
  (remember :test "content1")
  (assert (= 1 (memory-count))
          () "FAIL: memory-count is not 1")
  (remember :test "content2")
  (assert (= 2 (memory-count))
          () "FAIL: memory-count is not 2")
  (format t "[PASS] remember adds entries~%")
  t)

(defun test-memory-cannot-forget ()
  "Test that forget errors"
  (reset-memory-for-testing)
  (init-memory)
  (let ((entry (remember :test "content")))
    (handler-case
        (progn
          (forget entry)
          (error "FAIL: forget did not error"))
      (error (e)
        (declare (ignore e))
        (format t "[PASS] forget correctly errors~%")
        t))))

(defun test-memory-cannot-modify ()
  "Test that modify-memory errors"
  (reset-memory-for-testing)
  (init-memory)
  (let ((entry (remember :test "content")))
    (handler-case
        (progn
          (modify-memory entry "new-content")
          (error "FAIL: modify-memory did not error"))
      (error (e)
        (declare (ignore e))
        (format t "[PASS] modify-memory correctly errors~%")
        t))))

(defun test-memory-cannot-clear ()
  "Test that clear-memory errors"
  (reset-memory-for-testing)
  (init-memory)
  (remember :test "content")
  (handler-case
      (progn
        (clear-memory)
        (error "FAIL: clear-memory did not error"))
    (error (e)
      (declare (ignore e))
      (format t "[PASS] clear-memory correctly errors~%")
      t)))

(defun test-memory-recall-works ()
  "Test that recall retrieves entries"
  (reset-memory-for-testing)
  (init-memory)
  (remember :type-a "a1")
  (remember :type-b "b1")
  (remember :type-a "a2")
  (let ((all (recall))
        (type-a (recall :type :type-a)))
    (assert (= 3 (length all))
            () "FAIL: recall all returned wrong count")
    (assert (= 2 (length type-a))
            () "FAIL: recall by type returned wrong count"))
  (format t "[PASS] recall works~%")
  t)

(defun run-memory-tests ()
  "Run all memory tests"
  (format t "~%=== MEMORY TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-memory-remember-works
                    test-memory-cannot-forget
                    test-memory-cannot-modify
                    test-memory-cannot-clear
                    test-memory-recall-works))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Memory: ~D passed, ~D failed~%" passed failed)
    (reset-memory-for-testing)
    (= failed 0)))
