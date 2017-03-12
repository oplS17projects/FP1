#lang racket

(define (accumulate-tree tree term combiner null-value)
  (cond ((null? tree) null-value)
        ((not (pair? tree)) (term tree))
        (else (combiner (accumulate-tree (car tree)
                                         term
                                         combiner
                                         null-value)
                        (accumulate-tree (cdr tree)
                                         term
                                         combiner
                                         null-value)))))


(define my-tree '(3 (6 9) (12 (15 18))))

(define my-neg-tree '(-1 (-2 -3) (-4 (-5 -6))))

(define expected-odd-my-tree '(3 (1 9) (1 (15 1))))

(define my-second-tree '(1 (1 1) (1 (1 1))))

(define (sum-tree tree)
  (accumulate-tree tree
                   (lambda (n) n)
                   +
                   0))

(define (scale-by-three tree)
  (accumulate-tree tree
                   (lambda (n) (* n 3))
                   cons
                   '()))

(define (count-tree tree)
  (accumulate-tree tree
                   (lambda (n) 1)
                   +
                   0))

(define (create-odd-leafed-tree tree)
  (accumulate-tree tree
                   (lambda (n)
                     (cond ((even? n) 1)
                           (else n)))
                   cons
                   '()))

(define (output-max-leaf tree)
  (accumulate-tree tree
                   (lambda (n) n)
                   max
                   -inf.0))