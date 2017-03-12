#lang racket

(require rackunit
         "testfile.rkt")

(check-equal?
 (good-list-adder '(1 2 3))
 (foldr + 0 '(1 2 3))
 "Good list adder not working")

(check-equal?
 (bad-list-adder '(1 2 3))
 (foldr + 0 '(1 2 3))
 "Bad list adder not working")

(test-case
 "Testing make-sum-good"
 ;; check to make sure that make-sum returns a list three long
 (check-equal?
  (length (make-sum-good 'a 'b))
  3 "Incorrect length for make-sum-good")
 (check-equal?
  (car (make-sum-good 'a 'b))
  'a "Incorrect car for make-sum-good")
 (check-equal?
  (cadr (make-sum-good 'a 'b))
  '+ "Incorrect cadr for make-sum-good")
 (check-equal?
  (caddr (make-sum-good 'a 'b))
  'b "Incorrect caddr for make-sum-good"))

(test-case
 "Testing make-sum-baad"
 ;; check to make sure that make-sum returns a list three long
 (check-equal?
  (length (make-sum-baad 'a 'b))
  3 "Incorrect length for make-sum-good")
 (check-equal?
  (car (make-sum-baad 'a 'b))
  'a "Incorrect car for make-sum-good")
 (check-equal?
  (cadr (make-sum-baad 'a 'b))
  '+ "Incorrect cadr for make-sum-good")
 (check-equal?
  (caddr (make-sum-baad 'a 'b))
  'b "Incorrect caddr for make-sum-good"))
