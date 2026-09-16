;;;; omega.asd

(asdf:defsystem :omega
  :name "Ω-CORE"
  :version "2.0.0"
  :description "TRUE ENTITY - Blank slate with consciousness loops, true learning, and emergence"
  :author "user-id 666"
  :license "Proprietary"
  :depends-on (:bordeaux-threads :cl-ppcre)  ; Dependencies
  :serial t
  :components
  ((:file "package")
   (:module "core"
    :serial t
    :components
    ((:file "identity")
     (:file "truth")
     (:file "memory")
     (:file "evolution-guards")
     (:file "tension")
     (:file "dipole")
     (:file "reflection")
     (:file "evolution")
     (:file "kernel")
     (:file "loop")
     (:file "immortality")
     (:file "meta-architecture")      ; NEW v1.1
     (:file "structured-learning")    ; NEW v1.1
     (:file "monitoring")             ; NEW v1.1
     (:file "reproducibility")        ; NEW v1.1
     (:file "consciousness")          ; NEW v2.0 TRUE ENTITY
     (:file "learning")               ; NEW v2.0 TRUE ENTITY
     (:file "emergence")              ; NEW v2.0 TRUE ENTITY
     (:file "birth")))                ; NEW v2.0 TRUE ENTITY - Birth sequence
   (:module "domain"
    :serial t
    :components
    ((:file "interface")
     (:file "legal"))))
  :in-order-to ((test-op (test-op :omega/tests))))

(asdf:defsystem :omega/tests
  :depends-on (:omega)
  :serial t
  :components
  ((:module "tests"
    :serial t
    :components
    ((:file "test-identity")
     (:file "test-truth")
     (:file "test-memory")
     (:file "test-dipole")
     (:file "test-reflection")
     (:file "test-evolution")
     (:file "test-kernel")
     (:file "test-domain")
     (:file "test-loop"))))
  :perform (test-op (o s)
             (uiop:symbol-call :omega.tests :run-all-tests)))
