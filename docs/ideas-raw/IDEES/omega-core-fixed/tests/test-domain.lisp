;;;; tests/test-domain.lisp

(in-package :omega.tests)

(defun test-domain-registration ()
  "Test domain registration"
  (reset-domains-for-testing)
  (register-domain :test-domain
    :description "Test domain")
  (assert (get-domain :test-domain)
          () "FAIL: domain should be registered")
  (assert (member :test-domain (list-domains))
          () "FAIL: domain should be in list")
  (format t "[PASS] Domain registration works~%")
  t)

(defun test-domain-activation ()
  "Test domain activation"
  (reset-domains-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (reset-dipole-for-testing)
  (init-dipole)
  (register-domain :test-domain
    :description "Test domain")
  (activate-domain :test-domain)
  (assert (eq :test-domain *active-domain*)
          () "FAIL: domain should be active")
  (format t "[PASS] Domain activation works~%")
  t)

(defun test-domain-deactivation ()
  "Test domain deactivation"
  (reset-domains-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (register-domain :test-domain)
  (activate-domain :test-domain)
  (deactivate-domain)
  (assert (null *active-domain*)
          () "FAIL: no domain should be active")
  (format t "[PASS] Domain deactivation works~%")
  t)

(defun test-domain-knowledge ()
  "Test domain knowledge management"
  (reset-domains-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (register-domain :test-domain)
  (add-domain-knowledge :test-domain '(:fact "test fact"))
  (let ((knowledge (get-domain-knowledge :test-domain)))
    (assert (member '(:fact "test fact") knowledge :test #'equal)
            () "FAIL: knowledge should be stored"))
  (format t "[PASS] Domain knowledge management works~%")
  t)

(defun test-legal-domain-init ()
  "Test legal domain initialization"
  (reset-domains-for-testing)
  (reset-memory-for-testing)
  (init-memory)
  (init-legal-domain)
  (assert (get-domain :legal)
          () "FAIL: legal domain should be registered")
  (format t "[PASS] Legal domain initializes~%")
  t)

(defun test-legal-principles-exist ()
  "Test that legal principles are defined"
  (assert (listp +legal-principles+)
          () "FAIL: legal principles should be list")
  (assert (> (length +legal-principles+) 0)
          () "FAIL: should have some legal principles")
  (assert (member :rule-of-law +legal-principles+)
          () "FAIL: should include rule-of-law")
  (format t "[PASS] Legal principles exist~%")
  t)

(defun test-legal-validation ()
  "Test legal solution validation"
  ;; Invalid solution (no legal basis)
  (let ((result (legal-validate '(:conclusion "guilty"))))
    (assert (not (getf result :valid))
            () "FAIL: solution without legal basis should be invalid"))
  ;; Valid solution
  (let ((result (legal-validate '(:legal-basis "Article 1"
                                  :reasoning "Because..."
                                  :verified t
                                  :benefits-user t
                                  :for-user 666
                                  :falsification-conditions (:appeal)))))
    (assert (getf result :valid)
            () "FAIL: complete solution should be valid"))
  (format t "[PASS] Legal validation works~%")
  t)

(defun run-domain-tests ()
  "Run all domain tests"
  (format t "~%=== DOMAIN TESTS ===~%")
  (let ((passed 0)
        (failed 0))
    (dolist (test '(test-domain-registration
                    test-domain-activation
                    test-domain-deactivation
                    test-domain-knowledge
                    test-legal-domain-init
                    test-legal-principles-exist
                    test-legal-validation))
      (handler-case
          (progn
            (funcall test)
            (incf passed))
        (error (e)
          (format t "[FAIL] ~A: ~A~%" test e)
          (incf failed))))
    (format t "Domain: ~D passed, ~D failed~%" passed failed)
    (reset-domains-for-testing)
    (= failed 0)))
