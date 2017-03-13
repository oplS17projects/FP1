#lang racket

(require 2htdp/image)


(define connect4yellowpiece (circle 10 "solid" "yellow"))
(define connect4redpiece (circle 10 "solid" "red"))

(define square1 (square 40 'outline 'black))
(define rectangle (beside square1 square1 square1 square1 square1 square1 square1))

(overlay/align "middle" "bottom" connect4yellowpiece rectangle)
(overlay/align "middle" "bottom" connect4redpiece rectangle)
(overlay/align "middle" "bottom" connect4yellowpiece rectangle)
(overlay/align "middle" "bottom" connect4redpiece rectangle)
(overlay/align "middle" "bottom" connect4yellowpiece rectangle)
(overlay/align "middle" "bottom" connect4redpiece rectangle)
(overlay/align "middle" "bottom" connect4yellowpiece rectangle)



