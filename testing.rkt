#lang racket

(require 2htdp/image)

(define tri0
  (triangle 25 "solid" "black"))

(define (serpinski n)
  (if (= 0 n)
      tri0
      (above (serpinski (- n 1))
             (beside (serpinski (- n 1))
                     (serpinski (- n 1))))))


(define (plum_flower color)
  (pulled-regular-polygon 30 5 1.3 140 100 color))
 
(define (shadow image)
  (above image
         (scale/xy 1 0.5 (flip-vertical image)) ))

(define scene1
  (place-image/align (shadow (serpinski 2)) 0 0 "left" "top" (empty-scene 100 150 "gray")))

(define scene2
  (place-image
   (plum_flower "red") 120 30
   (place-image
    (plum_flower "purple") 124 80
    (place-image
     (plum_flower "slategray") 150 60
     (place-image
     (plum_flower "blue") 170 130
     (place-image
     (plum_flower "green") 150 100
     (rectangle 200 200 40 "red")))))))
