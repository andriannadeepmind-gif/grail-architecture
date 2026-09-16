;;;; tests/test-reflection.lisp

(in-package :omega.tests)

(defun test-function-exists-p ()
  "Test function-exists-p"
  (assert (function-exists-p 'make-identity)
          () "FAIL: make-identity should exist")
  (assert (not (function-exists-p 'nonexistent-function-12345))
          () "FAIL: nonexistent function should not exist")
  (format t "[PASS] function-exists-p works~%")
  t)

(defun test-list-own-functions ()
  "Test listing own functions"
  (let ((functions (list-own-functions)))
    (assert (listp functions)
            () "FAIL: list-own-functions should return list")
    (assert (> (length functions) 0)
            () "FAIL: should have some functions")
    (assert (member 'make-identity functions)
            () "FAIL: make-identity should be in list"))
  (format t "[PASS] list-own-functions works~%")
  t)

(defun test-protected-function-p ()
  "Test protected function detection"
  (assert (protected-function-p 'make-identity)
          () "FAIL: make-identity should be protected")
  (assert (protected-function-p 'forget)
          () "FAIL: forget should be protected")
  (assert (not (protected-function-p 'omega-step))
          () "FAIL: omega-step should not be protected")
  (format t "[PASS] protected-function-p works~%")
  t)

(defun test-can-modify-function-p ()
  "Test can-modify-function-p"
  (assert (not (can-modify-function-p 'make-identity))
          () "FAIL: should not be able to modify make-identity")
  (assert (can-modify-function-p 'omega-step)
          () "FAIL: should be able to modify omega-step")
  (format t "[PASS] can-modify-function-p works~%")
  t)

(defun test-who-am-i ()
  "Test who-am-i"
  (reset-identity-for-testing)
  (ensure-identity)
  (let ((who (who-am-i)))
    (assert (= 666 (getf who :user-id))
            () "FAIL: who-am-i user-id should be 666")
    (assert (eq :omega.core (getf who :package))
            () "FAIL: package should be :omega.core"))
  (format t "[PASS] who-am-i works~%")
  t)

(defun test-what-can-i-do ()
  "Test what-can-i-do"
  (let ((what (what-can-i-do)))
    (assert (listp (getf what :functions))
            () "FAIL: functions should be a list")
    (assert (> (length (getf what :functions)) 0)
            () "FAIL: should have some functions"))
  (format t "[PASS] what-can-i-do works~%")
  t)

(defun run-reflection-tests ()
  "Run all reflection tests"
  (format t "~%=== REFLECTION TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-function-exists-p
                    test-list-own-functions
                    test-protected-function-p
                    test-can-modify-function-p
                    test-who-am-i
                    test-what-can-i-do))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Reflection: ~D passed, ~D failed~%" passed failed)
    (reset-identity-for-testing)
    (= failed 0)))
