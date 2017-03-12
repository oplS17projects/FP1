#lang racket

; for get-pixel-color
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
  (list (list (get-pixel-color 1 1 imgtest) (get-pixel-color 1 2 imgtest) (get-pixel-color 1 3 imgtest) (get-pixel-color 1 4 imgtest))
        (list (get-pixel-color 300 148 imgtest) (get-pixel-color 300 149 imgtest) (get-pixel-color 300 150 imgtest))
        ))

;; from pixel to bitmap
(scale 30 (color-list->bitmap (car pixlist) 4 1))
(scale 30 (color-list->bitmap (cadr pixlist) 3 1))
(define colortest (make-color 150 147 146))


