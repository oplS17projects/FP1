#lang racket

(require 2htdp/image)


(define connect4yellowpiece (circle 10 "solid" "yellow"))
(define connect4redpiece (circle 10 "solid" "red"))

(define square (square 40 'outline 'black))
(define rectangle (beside square square square square square square square))

(overlay/align "middle" "bottom" connect4yellowpiece r1)
(overlay/align "middle" "bottom" connect4redpiece r1)
(overlay/align "middle" "bottom" connect4yellowpiece r1)



