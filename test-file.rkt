#lang racket/base
(require rackunit/text-ui)
(require rackunit/gui)
(require rackunit)
;; Info from: http://docs.racket-lang.org/rackunit/api.html#%28mod-path._rackunit%2Ftext-ui%29
 
;; Nothing is output if test passes

(require rackunit "someCode.rkt")
(check-equal? (+ 1 1) 2 "Simple addition")
(check-equal? (* 1 2) 2 "Simple multiplication")
(check-equal? (my-+ 1 1) 2 "Simple addition")
(check-equal? (my-* 1 2) 2 "Simple multiplication")
(check-equal? (proc1 1 2) 11 "Proc1 function")
(check-equal? (count-leaves (list 1 2 3 4 5 6)) 6 "Numbers of leaves counted")
(check-pred string? "I am a string")
(check memq 'opl '(o p opl l l p o))

;; Make your own checks!
(my-check-string? "ben ik een string?")

;; What if you want to run certain groups of tests seperate from each other?
(test-case
  "Group A - Test x feature"
  ;; This line fails, and the rest of the tests are not executed in the group
  (check-eq? 'a 'b)
  (check-equal? (+ 1 1) 2 "Simple addition")
  (check-equal? (* 1 2) 2 "Simple multiplication"))

(test-case
  "Group B - Test y feature"
  (check-eq? 'a 'a)
  (check-equal? (+ 1 1) 2 "Simple addition")
  (check-equal? (* 1 2) 2 "Simple multiplication"))

;; Test Suites can be created for even more grouping. Can contain multiple test-cases.
;; run-tests can be used for test cases or suites for more/less verbose info
(run-tests
 (test-suite 
  "Suite 1"
  (test-case
   "Test case 1"
   (check-eq? 'a 'a))
  (test-case
   "Test case 2"
   (check-eq? 'a 'a))) 'verbose)

;; Neat GUI feature if you want a more visual representation of test results
(test/gui  
 (test-suite 
  "Suite 1"
  (test-case
   "Test case 1"
   (check-eq? 'a 'a))
  (test-case
   "Test case 2"
   (check-eq? 'a 'b))) #:wait? #f)



