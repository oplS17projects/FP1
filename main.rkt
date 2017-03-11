#lang racket
(require 2htdp/image)
(require 2htdp/universe)
 
(define ball
  (circle 50 "solid" "blue"))

(define (initscreen height)
  (place-image ball
               (+ 350 (* 2 (* 50 (* (cos height) (- 1 (cos height))))))
               (+ 250 (* 2 (* 50 (* (sin height) (- 1 (cos height))))))
               (empty-scene 500 500)))

(define (bounding height)
  (- height 5))
 
(big-bang 5000
         (on-tick bounding)
         (to-draw initscreen)
         (stop-when zero?))

