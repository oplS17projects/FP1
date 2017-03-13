#lang racket
(require plot)
(plot-new-window? #t)

; The attempt is to plot a list of test scores, find the mean and stddev
(define (plot-scores lst)
  (draw-plot (find-mean lst) (find-stddev lst (find-mean lst)) lst))

(define (draw-plot mean stddev lst)
  (parameterize ([plot-width    500]
                 [plot-height   500]
                 [plot-x-label  #f]
                 [plot-y-label  #f])
    (define ys (sort lst <))
    (define xs (build-list (length lst) values))
    (list (plot 
           (points (map vector xs ys))
           #:title "A Sample Plot Project"
           #:x-label "Student Number"
           #:y-label "Score"))))

(define (find-mean lst)
  (/ (foldr + 0 lst) (length lst)))

(define (find-stddev lst mean)
  (define (stddev-helper v p)
    (+ (* (- v mean) (- v mean)) p))
  (sqrt (/ (foldr stddev-helper 0 lst) (length lst))))