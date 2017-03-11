#lang racket

(require 2htdp/image)
(require picturing-programs)

;; read the image
(define imgtest (bitmap "test.png"))

;; get image height
(define img-height (image-height imgtest))

;; get image width
(define img-width (image-width imgtest))

;; example from racket website
(define (near-pixel x y)
           (get-pixel-color (+ x -3 (random 7))
                            (+ y -3 (random 7))
                            imgtest))
(define fuzz
    (build-image img-width img-height near-pixel))
                          
;; read pixel-by-pixel to list
;; sample picture height = 561 and width = 460
;; (get-pixel-color x y pic) where x = width and y = height
;; color return red/green/blue/alpha
(define pixlist
  (list (list (get-pixel-color 1 1 imgtest) (get-pixel-color 1 2 imgtest))
        (list (get-pixel-color 2 1 imgtest) (get-pixel-color 2 2 imgtest))
        (list (get-pixel-color 450 560 imgtest) (get-pixel-color 455 560 imgtest))
        ))
pixlist