;;;; tests/test-kernel.lisp

(in-package :omega.tests)

(defun test-kernel-init-consciousness ()
  "Test consciousness initialization"
  (reset-kernel-for-testing)
  (init-consciousness)
  (assert (not (null *self-model*))
          () "FAIL: self-model not initialized")
  (assert (not (null *world-model*))
          () "FAIL: world-model not initialized")
  (assert (not (null *intention-model*))
          () "FAIL: intention-model not initialized")
  (format t "[PASS] Consciousness initializes correctly~%")
  t)

(defun test-kernel-meta-level ()
  "Test meta-level tracking"
  (reset-kernel-for-testing)
  (assert (= 0 *meta-level*)
          () "FAIL: initial meta-level should be 0")
  (format t "[PASS] Meta-level tracking works~%")
  t)

(defun test-kernel-omega-eval-simple ()
  "Test omega-eval with simple expression"
  (reset-kernel-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (init-consciousness)
  (let ((result (omega-eval '(+ 1 2))))
    (assert (= 3 result)
            () "FAIL: omega-eval (+ 1 2) should be 3"))
  (format t "[PASS] omega-eval works for simple expressions~%")
  t)

(defun test-kernel-self-reference-detection ()
  "Test self-reference detection"
  (assert (self-reference-p '(who-am-i))
          () "FAIL: who-am-i should be self-reference")
  (assert (not (self-reference-p '(+ 1 2)))
          () "FAIL: (+ 1 2) should not be self-reference")
  (format t "[PASS] Self-reference detection works~%")
  t)

(defun test-kernel-evolution-request-detection ()
  "Test evolution request detection"
  (assert (evolution-request-p '(defun foo () 42))
          () "FAIL: defun should be evolution request")
  (assert (not (evolution-request-p '(+ 1 2)))
          () "FAIL: (+ 1 2) should not be evolution request")
  (format t "[PASS] Evolution request detection works~%")
  t)

(defun test-kernel-intention-alignment ()
  "Test intention alignment"
  (assert (aligned-with-want-p :computation)
          () "FAIL: :computation should be aligned")
  (assert (aligned-with-want-p :inquiry)
          () "FAIL: :inquiry should be aligned")
  (assert (not (aligned-with-want-p :destruction))
          () "FAIL: :destruction should not be aligned")
  (format t "[PASS] Intention alignment works~%")
  t)

(defun test-kernel-reify-reflect ()
  "Test reify and reflect"
  (reset-kernel-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  ;; Reify a symbol
  (let ((reified (reify 'test-symbol)))
    (assert (listp reified)
            () "FAIL: reified symbol should be list")
    (assert (eq :symbol (car reified))
            () "FAIL: reified symbol should have :symbol type"))
  (format t "[PASS] Reify/reflect works~%")
  t)

(defun run-kernel-tests ()
  "Run all kernel tests"
  (format t "~%=== KERNEL TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-kernel-init-consciousness
                    test-kernel-meta-level
                    test-kernel-omega-eval-simple
                    test-kernel-self-reference-detection
                    test-kernel-evolution-request-detection
                    test-kernel-intention-alignment
                    test-kernel-reify-reflect))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Kernel: ~D passed, ~D failed~%" passed failed)
    (reset-kernel-for-testing)
    (= failed 0)))
