#lang racket

(require math)
(require plot)

(define m (mean '( 1 2 3)))

(define dm (mean '(1 2 3) '(4 5 6)))

(define sd (stddev '(1 2 3 4 5)))

;;binomial distribution modeling 5 coin toss where x is the number of heads 
(define bd (binomial-dist 5 .5))

 (define sd-bd (stddev (sample bd 5)))
;; finds the standard deviation of the distribution

(define m-bd (mean (sample bd 5)))
;; finds the mean of the distribution

(define bd-pdf (build-list 6 (distribution-pdf bd)))
;; finds the pdf (probability density function) – represented as a list of reals

;;plotting a dicrete 
(define plot-bd (plot (discrete-histogram
         (map vector (build-list 6 values) (build-list 6 (distribution-pdf bd))))
                      #:x-label "number of heads" #:y-label "probability"))
;;find the prob of x
(define (find-prob-of-x lst x)
  (if (= x 0)
      (car lst)
      (find-prob-of-x (cdr lst) (- x 1))))
