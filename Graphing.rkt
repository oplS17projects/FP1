#lang racket
(require plot)

;2D functionalities
;Makes sin fn using x bounds
(define (make-sin x1 x2)
  (plot (function sin x1 x2 #:label "y = sin(x)")))
;Makes custom line using x bounds
(define (make-line m b x1 x2)
  (plot (function (lambda (x) (+ (* m x) b)) x1 x2 #:label "y = mx+b")))
;Plots two graphs at the same time using x bounds
(define (plot-two-graphs f1 f2 x1 x2)
  (plot (list (axes)
             (function f1 x1 x2)
             (function f2 x1 x2))))

;3D functionalities
;Makes 3d graph from lambda fn with x and y parameters
(define (make-3D f1 x1 x2 y1 y2)
  (plot3d (surface3d f1 x1 x2 y1 y2)
          #:title "My function"
          #:x-label "x" #:y-label "y" #:z-label "My function"))




