#lang racket/base
(require rackunit)
;; Info from: http://docs.racket-lang.org/rackunit/api.html#%28mod-path._rackunit%2Ftext-ui%29

(define square (lambda (x) (* x x)))

(define nil '())

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (my-+ a b)
  (if (zero? a)
      b
      (my-+ (sub1 a) (add1 b))))
 
(define (my-* a b)
  (if (zero? a)
      b
      (my-* (sub1 a) (my-+ b b))))
 
;; Functions to be tested need to be included here
(provide my-+
         my-*
         proc1
         count-leaves
         my-check-string?)

(define (proc1 x y)
  ((lambda (a) 
     ((lambda (b) 
        (+ (square a) (square b)))
      (+ x y)))
   (- x y)))

(define (count-leaves tree) 
  (accumulate + 0 (map (lambda (x) (+ 1 (* x 0))) (enumerate-tree tree))))

;; Make your own checks!
(define (my-check-string? str)
  (string? str))






