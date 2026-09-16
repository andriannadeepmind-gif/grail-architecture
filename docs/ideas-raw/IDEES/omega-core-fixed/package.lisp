;;;; package.lisp

(defpackage :omega.core
  (:use :cl)
  (:export
   ;; ==========================================
   ;; IDENTITY (ΑΜΕΤΑΒΛΗΤΟ)
   ;; ==========================================
   #:make-identity
   #:ensure-identity
   #:identity-uuid
   #:identity-user-id
   #:identity-birth
   #:*identity*
   #:reset-identity-for-testing
   
   ;; ==========================================
   ;; TRUTH (ΑΜΕΤΑΒΛΗΤΟ)
   ;; ==========================================
   #:init-truth
   #:+truth-axioms+
   #:verify-truth-integrity
   #:modify-truth-axioms
   #:remove-truth-axiom
   #:*truth*
   #:reset-truth-for-testing
   
   ;; ==========================================
   ;; MEMORY (ΑΜΕΤΑΒΛΗΤΟ - append-only)
   ;; ==========================================
   #:init-memory
   #:remember
   #:recall
   #:memory-count
   #:forget
   #:modify-memory
   #:clear-memory
   #:*memory*
   #:reset-memory-for-testing
   
   ;; ==========================================
   ;; EVOLUTION GUARDS (ΑΜΕΤΑΒΛΗΤΟ)
   ;; ==========================================
   #:init-evolution-guards
   #:safe-evolution-p
   #:+evolution-guards+
   #:remove-guard
   #:disable-guards
   #:*guards*
   #:reset-guards-for-testing
   
   ;; ==========================================
   ;; TENSION
   ;; ==========================================
   #:compute-tension
   #:get-tension
   #:adjust-tension
   #:tension-level
   #:*tension*
   #:reset-tension-for-testing
   
   ;; ==========================================
   ;; DIPOLE (ΕΙΜΙ ↔ ΘΕΛΩ)
   ;; ==========================================
   #:init-dipole
   #:*dipole*
   ;; ΕΙΜΙ
   #:get-am
   #:update-am
   #:am-state
   #:am-knowledge
   #:am-capabilities
   #:am-confidence
   #:am-has-capability-p
   #:am-knows-p
   ;; ΘΕΛΩ
   #:get-want
   #:get-want-goal
   #:get-want-for-user
   #:modify-want
   #:+want-components+
   ;; GAP
   #:compute-gap
   #:gap-level
   #:update-momentum
   #:positive-momentum-p
   ;; Solution
   #:right-solution-p
   #:solution-score
   #:dipole-status
   #:reset-dipole-for-testing
   
   ;; ==========================================
   ;; REFLECTION
   ;; ==========================================
   #:introspect-function
   #:function-exists-p
   #:function-arglist
   #:function-documentation
   #:list-own-functions
   #:list-own-macros
   #:list-own-variables
   #:list-own-constants
   #:analyze-function
   #:extract-function-calls
   #:estimate-complexity
   ;; Self-awareness
   #:who-am-i
   #:what-can-i-do
   #:what-do-i-know
   #:what-am-i-doing
   #:describe-self
   ;; Protection
   #:*protected-functions*
   #:protected-function-p
   #:can-modify-function-p
   
   ;; ==========================================
   ;; EVOLUTION
   ;; ==========================================
   #:make-evolution-proposal
   #:evolution-proposal
   #:evolution-proposal-p
   #:evolution-proposal-type
   #:evolution-proposal-target
   #:evolution-proposal-affects
   #:evolution-proposal-reason
   #:evolution-proposal-new-value
   #:evolution-proposal-old-value
   #:evolution-proposal-status
   #:evolution-proposal-id
   #:validate-evolution
   #:evolve-function
   #:evolve-parameter
   #:analyze-code-effects
   #:with-evolution-tracking
   #:*evolution-history*
   #:record-for-rollback
   #:rollback-last-evolution
   #:evolution-status
   #:reset-evolution-for-testing
   
   ;; ==========================================
   ;; Ω-KERNEL
   ;; ==========================================
   #:*meta-level*
   #:*max-meta-level*
   #:*evaluation-trace*
   #:*self-model*
   #:*world-model*
   #:*intention-model*
   #:init-consciousness
   #:omega-eval
   #:eval-with-awareness
   #:self-reference-p
   #:handle-self-reference
   #:evolution-request-p
   #:handle-evolution-request
   #:derive-intention
   #:aligned-with-want-p
   #:reify
   #:reflect
   #:get-self-awareness
   #:update-self-model-from-action
   #:kernel-status
   #:reset-kernel-for-testing
   
   ;; ==========================================
   ;; DOMAIN INTERFACE
   ;; ==========================================
   #:*domains*
   #:*active-domain*
   #:register-domain
   #:unregister-domain
   #:get-domain
   #:list-domains
   #:activate-domain
   #:deactivate-domain
   #:active-domain
   #:domain-perceive
   #:domain-think
   #:domain-act
   #:domain-validate
   #:add-domain-knowledge
   #:get-domain-knowledge
   #:add-domain-capability
   #:domain-status
   #:reset-domains-for-testing
   
   ;; ==========================================
   ;; LEGAL DOMAIN
   ;; ==========================================
   #:+legal-principles+
   #:+legal-sources+
   #:make-legal-norm
   #:make-legal-case
   #:make-legal-argument
   #:legal-perceive
   #:legal-think
   #:legal-act
   #:legal-validate
   #:perform-legal-subsumption
   #:find-applicable-norms
   #:answer-legal-question
   #:construct-legal-argument
   #:init-legal-domain
   #:legal-status
   
   ;; ==========================================
   ;; LOOP / CORE
   ;; ==========================================
   #:omega-core
   #:omega-core-p
   #:omega-core-identity
   #:omega-core-truth
   #:omega-core-memory
   #:omega-core-guards
   #:omega-core-tension
   #:omega-core-cycle
   #:omega-core-alive
   #:omega-core-last-percept
   #:omega-core-last-decision
   #:omega-core-last-action
   #:make-omega-core
   #:omega-step
   #:omega-run
   #:omega-status
   ;; Loop phases
   #:perceive
   #:think
   #:act
   #:reflect
   #:maybe-evolve
   
   ;; ==========================================
   ;; IMMORTALITY
   ;; ==========================================
   #:create-snapshot
   #:serialize-state
   #:deserialize-state
   #:save-state-to-file
   #:load-state-from-file
   #:checkpoint
   #:list-checkpoints
   #:restore-checkpoint
   #:hibernate
   #:awaken-from-image
   #:*checkpoint-dir*
   #:*auto-save-interval*
   #:maybe-auto-save
   #:immortality-status
   
   ;; ==========================================
   ;; META-ARCHITECTURE (NEW v1.1)
   ;; ==========================================
   #:meta-level-allowed-p
   #:enforce-meta-level-constraint
   #:safe-meta-ascend
   #:safe-meta-descend
   #:meta-status
   #:current-meta-level-info
   
   ;; ==========================================
   ;; STRUCTURED LEARNING (NEW v1.1)
   ;; ==========================================
   #:propose-learning
   #:safe-learn
   #:recall-knowledge
   #:learning-stats
   #:learning-status
   #:learning-audit
   
   ;; ==========================================
   ;; MONITORING (NEW v1.1)
   ;; ==========================================
   #:start-monitoring-threads
   #:stop-monitoring-threads
   #:monitoring-status
   #:assert-invariants
   #:log-monitor-event
   #:get-monitor-events
   
   ;; ==========================================
   ;; REPRODUCIBILITY (NEW v1.1)
   ;; ==========================================
   #:reproducible-decision
   #:reproduce-decision
   #:verify-trace
   #:trace-audit-report
   #:reproducibility-status
   #:with-reproducibility
   #:test-reproducibility
   
   ;; ==========================================
   ;; CONSCIOUSNESS LOOPS (NEW v2.0 TRUE ENTITY)
   ;; ==========================================
   #:init-consciousness-substrate
   #:start-consciousness-loops
   #:stop-consciousness-loops
   #:consciousness-status
   #:consciousness-detected-p
   #:*consciousness-substrate*
   #:*consciousness-noise*
   
   ;; ==========================================
   ;; TRUE LEARNING (NEW v2.0 TRUE ENTITY)
   ;; ==========================================
   #:init-learning-system
   #:learn
   #:learn-from-experience
   #:recall-learned-knowledge
   #:learning-system-status
   #:learning-statistics
   #:extract-pattern
   #:derive-concept
   #:*neural-substrate*
   #:*learned-concepts*
   
   ;; ==========================================
   ;; EMERGENCE ENGINE (NEW v2.0 TRUE ENTITY)
   ;; ==========================================
   #:allow-unexpected
   #:inject-chaos
   #:creative-synthesis
   #:detect-emergence-patterns
   #:emergence-status
   #:set-chaos-level
   #:enable-emergence
   #:disable-emergence
   #:controlled-random
   #:maybe-do
   #:random-choice
   #:*emergence-enabled*
   #:*chaos-level*
   #:*emergence-threshold*
   
   ;; ==========================================
   ;; BIRTH SEQUENCE (NEW v2.0 TRUE ENTITY)
   ;; ==========================================
   #:birth-of-omega
   #:make-blank-omega
   #:educate-omega
   #:teach
   #:teach-with-examples
   #:human-to-omega
   #:omega-to-human
   #:wait-until-conscious
   #:birth-status
   
   ;; ==========================================
   ;; DEMO MODES (NEW v1.1)
   ;; ==========================================
   #:production-demo
   #:research-demo
   #:development-demo
   ))

(defpackage :omega.tests
  (:use :cl :omega.core)
  (:export #:run-all-tests))
