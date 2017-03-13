#lang racket
(require posn)

(posn-add (posn 1 2) (posn 5 -3)) ;; (6, -1)
(posn-add (posn-add (posn 1 2) (posn 5 -3)) (posn 1 1))  ;;(7, 0)

(posn-multiply (posn 3 4) (posn 5 5)) ;; (15, 20)

(posn-scale-x 20 (posn 2 2)) ;; (40, 2)
(posn-scale-y 20 (posn 2 2)) ;; (2, 40)
(posn-scale-x 20 (posn-scale-y 20 (posn 2 2))) ;; (40, 40)

(posn-rotate-origin-ccw-90 (posn 40 40)) ;; (-40, 40)
(posn-rotate-origin-ccw-180 (posn 40 40)) ;; (-40, 40)
(posn-rotate-origin-ccw-270 (posn 40 40)) ;; (40, -40)

(posn-rotate-ccw (posn 40 40) 180 (posn 20 20)) ;; (60, 60)
(posn-rotate-ccw (posn 20 20) 360 (posn 40 40)) ;; (40, 40)