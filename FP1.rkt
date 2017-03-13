#lang racket
(require math/base)
(require math/matrix)

;generates a random number from 0 to x
(define (randNum x)
  (random-integer 0 x))

;Pythagorean Theorem
(define (pyt a b)
  (+ (sqr a) (sqr b)))
  
;string to integer
(define (stoi x)
  (string->number x))

;integer to string
(define (itos x)
  (number->string x))

;defining a couple of functions
(define A (matrix ([1 2]
                   [4 5])))
(define B (matrix ([2 1]
                   [2 5])))

;test it by using these commands in REPL
;(matrix+ A B)
;(matrix- A B)
;(matrix* A B)
