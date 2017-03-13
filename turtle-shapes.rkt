#lang racket
(require teachpacks/racket-turtle)
;list of turtle commands, which will produce a rectangle when called
(define (rectangle h w)
  (list (forward w)(turn-right 90)
        (forward h)(turn-right 90)
        (forward w)(turn-right 90)
        (forward h)))
;procedure to draw the rectangle 
(define (draw-rect h w)
  (draw (rectangle h w)))
;recursively produce a list of turtle commands to draw an octagon
(define (octagon l)
  (define (oct-builder l count)
    (if (<= count 0)
        empty
        (append (list (forward l)(turn-right 45))
                (oct-builder l (sub1 count)))))
  (oct-builder l 8))
;procedure to draw the octagon
(define (draw-oct l)
  (draw (octagon l)))