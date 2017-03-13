#lang racket
(require 2htdp/image)
(require 2htdp/universe)


(define (draw-star n)
  (overlay (star n "solid" "red") (empty-scene 500 500)))

(define (change w a-key)
  (cond
    [(key=? a-key "up")(+ w 10)]
    [(key=? a-key "down")(- w 10)]
    [else w]))

(big-bang 50
          (to-draw draw-star)
          (on-key change))


                 
