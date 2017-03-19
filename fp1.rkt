#lang racket

(require 2htdp/image)

(place-image
 (rotate 210(ellipse 45 25 "solid" "darkgreen"))
 111 110
 (place-image
 (rotate 150(ellipse 45 25 "solid" "darkgreen"))
 111 110
 (place-image
 (rotate 120(ellipse 45 25 "solid" "darkgreen"))
 96 90
 (place-image
 (rotate 60(ellipse 45 25 "solid" "darkgreen"))
 96 90
 (place-image
 (rotate 330(ellipse 45 25 "solid" "darkgreen"))
 81 110
(place-image
 (rotate 30(ellipse 45 25 "solid" "darkgreen"))
 81 110
 (place-image
  (text "Celtics" 40 "white")
  96 20
  (place-image
   (scene+curve
    (circle 72 "solid" "white")
    74 80 180 1/2
    89 105 90 1/2
    (make-pen "darkgreen" 7 "solid" "round" "round"))
   96 108
   (rectangle 192 192 "solid" "darkgreen")))))))))
