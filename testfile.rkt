#lang racket

;; The following two functions are good and bad versions of a foldr that adds up
;; the values in a list
(define (good-list-adder l)
  (foldr + 0 l))

(define (bad-list-adder l)
  (foldr + 1 l))

;; Exercise 2-58 make-sum -- correct and incorrect versions
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum-good a1 a2)
  (cond ((=number? a1 0) a2)
  ((=number? a2 0) a1)
  ((and (number? a1) (number? a2)) (+ a1 a2))
  (else (list a1' + a2))))

(define (make-sum-baad a1 a2)
  (cond ((=number? a1 0) a2)
  ((=number? a2 0) a1)
  ((and (number? a1) (number? a2)) (+ a1 a2))
  (else (list '+ a1 a2))))


(provide good-list-adder
         bad-list-adder
         make-sum-good
         make-sum-baad)
