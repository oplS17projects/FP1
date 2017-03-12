#lang racket
(require rackunit)
(require rackunit/gui)

(define (isFortyFive value)
  (= 45 value))

(run-test
 (test-suite
  "isFortyFive Test Suite"
  #:before (lambda () (display "Running Tests\n"))
  #:after (lambda() (display "Test Run Completed\n"))
  (test-case
   "Testing the output of isFortyFive is false when argument is not 45"
   (check-false (isFortyFive -45))
   (check-false (isFortyFive 20))
   (check-false (isFortyFive 45) ["isFortyFive with arg 45 is not false"])
   (check-false (isFortyFive 4)))
  (test-case
   "Testing the output of isFortyFive is true when argument is 45"
   (check-true (isFortyFive 45)))))

(define (square n)
  (* n n))


(make-gui-runner
 (test/gui
  (test-suite
   "Square Test Suite"
   (test-case
    "Simple Test"
    (check-eq? (square 2) 4)
    (check-eq? (square 3) 2 ["Square of 3 is not 2"])))))
  
