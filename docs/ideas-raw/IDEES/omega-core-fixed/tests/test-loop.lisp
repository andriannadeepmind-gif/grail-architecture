;;;; tests/test-loop.lisp

(in-package :omega.tests)

(defun reset-all-for-testing ()
  "Reset all subsystems"
  (reset-identity-for-testing)
  (reset-truth-for-testing)
  (reset-memory-for-testing)
  (reset-guards-for-testing)
  (reset-tension-for-testing)
  (reset-dipole-for-testing)
  (reset-evolution-for-testing)
  (reset-kernel-for-testing)
  (reset-domains-for-testing))

(defun test-make-omega-core ()
  "Test that make-omega-core works"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    (assert (omega-core-p core)
            () "FAIL: make-omega-core didn't return omega-core")
    (assert (= 666 (identity-user-id (omega-core-identity core)))
            () "FAIL: core identity user-id is not 666")
    (assert (= 0 (omega-core-cycle core))
            () "FAIL: core cycle is not 0"))
  (format t "[PASS] make-omega-core works~%")
  t)

(defun test-omega-step-increments-cycle ()
  "Test that omega-step increments cycle"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    (assert (= 0 (omega-core-cycle core))
            () "FAIL: initial cycle is not 0")
    (omega-step core)
    (assert (= 1 (omega-core-cycle core))
            () "FAIL: cycle not incremented to 1")
    (omega-step core)
    (assert (= 2 (omega-core-cycle core))
            () "FAIL: cycle not incremented to 2"))
  (format t "[PASS] omega-step increments cycle~%")
  t)

(defun test-omega-step-records-to-memory ()
  "Test that omega-step records to memory"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    (let ((mem-before (memory-count)))
      (omega-step core)
      (assert (> (memory-count) mem-before)
              () "FAIL: omega-step didn't add to memory")))
  (format t "[PASS] omega-step records to memory~%")
  t)

(defun test-omega-step-preserves-invariants ()
  "Test that omega-step preserves invariants"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    ;; Run several cycles
    (dotimes (i 10)
      (omega-step core))
    ;; Check invariants
    (assert (= 666 (identity-user-id (omega-core-identity core)))
            () "FAIL: user-id changed")
    (assert (verify-truth-integrity core)
            () "FAIL: truth integrity violated")
    (assert (>= (memory-count) 10)
            () "FAIL: memory entries missing"))
  (format t "[PASS] omega-step preserves invariants~%")
  t)

(defun test-omega-run ()
  "Test that omega-run works"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    (omega-run core :cycles 5 :verbose nil)
    (assert (= 5 (omega-core-cycle core))
            () "FAIL: omega-run didn't run 5 cycles"))
  (format t "[PASS] omega-run works~%")
  t)

(defun test-loop-phases-work ()
  "Test that all loop phases execute"
  (reset-all-for-testing)
  (let ((core (make-omega-core)))
    (omega-step core)
    ;; Check that phases recorded data
    (assert (omega-core-last-percept core)
            () "FAIL: perceive didn't set last-percept")
    (assert (omega-core-last-decision core)
            () "FAIL: think didn't set last-decision")
    (assert (omega-core-last-action core)
            () "FAIL: act didn't set last-action")
    ;; Check memory has entries from all phases
    (let ((percepts (recall :type :percept))
          (decisions (recall :type :decision))
          (actions (recall :type :action))
          (reflections (recall :type :reflection)))
      (assert (>= (length percepts) 1)
              () "FAIL: no percept in memory")
      (assert (>= (length decisions) 1)
              () "FAIL: no decision in memory")
      (assert (>= (length actions) 1)
              () "FAIL: no action in memory")
      (assert (>= (length reflections) 1)
              () "FAIL: no reflection in memory")))
  (format t "[PASS] All loop phases work~%")
  t)

(defun run-loop-tests ()
  "Run all loop tests"
  (format t "~%=== LOOP TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-make-omega-core
                    test-omega-step-increments-cycle
                    test-omega-step-records-to-memory
                    test-omega-step-preserves-invariants
                    test-loop-phases-work
                    test-omega-run))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Loop: ~D passed, ~D failed~%" passed failed)
    (reset-all-for-testing)
    (= failed 0)))

;;; Run all tests
(defun run-all-tests ()
  "Run all test suites"
  (format t "~%")
  (format t "========================================~%")
  (format t "         Ω-CORE TEST SUITE v1.0        ~%")
  (format t "========================================~%")
  
  (let ((results nil))
    (push (cons :identity (run-identity-tests)) results)
    (push (cons :truth (run-truth-tests)) results)
    (push (cons :memory (run-memory-tests)) results)
    (push (cons :dipole (run-dipole-tests)) results)
    (push (cons :reflection (run-reflection-tests)) results)
    (push (cons :evolution (run-evolution-tests)) results)
    (push (cons :kernel (run-kernel-tests)) results)
    (push (cons :domain (run-domain-tests)) results)
    (push (cons :loop (run-loop-tests)) results)
    
    (format t "~%========================================~%")
    (format t "             SUMMARY                    ~%")
    (format t "========================================~%")
    
    (let ((all-passed t)
          (total-passed 0)
          (total-failed 0))
      (dolist (r (reverse results))
        (format t "~12A: ~A~%" (car r) (if (cdr r) "PASS" "FAIL"))
        (unless (cdr r) (setf all-passed nil)))
      
      (format t "========================================~%")
      (if all-passed
          (format t "         ALL TESTS PASSED              ~%")
          (format t "         SOME TESTS FAILED             ~%"))
      (format t "========================================~%")
      
      all-passed)))
