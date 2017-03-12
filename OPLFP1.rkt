#lang racket

(require plot) ;;the library

;;OPL
(plot (list (polar
             (lambda (theta) 1.5)
             #:color "pink" #:width 18) ;; the circle for P
            (rectangles (list
                         (vector
                          (ivl -2 -1)
                          (ivl -4 2)))
                        #:color "pink" #:line-color "pink") ;; rec for P
            (rectangles (list
                         (vector
                          (ivl 4 5)
                          (ivl -4 2)))
                        #:color "yellow" #:line-color "yellow") ;;rec for L
            (rectangles (list
                         (vector
                          (ivl 4 8)
                          (ivl -4 -3)))
                        #:color "yellow" #:line-color "yellow") ;; rec for L
            (isoline (lambda (x y)
                       (sqrt (+ (sqr (+ x 7))
                                (sqr (+ y 1)))))
                     2.5 -11 9 -11 9
                     #:color "green" #:width 20) ;; for o
      )
)