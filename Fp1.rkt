#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (number digit)
    (overlay
     (text (number->string digit) 15 "white")
     (circle 15 "solid" "red")))

(define (a-number digit)
    (overlay
     (text (number->string digit) 10 "black")
     (square 14 "solid" "white")))

(define (place-and-turn digit dial)
    (rotate 20
            (overlay/align "center" "top"
                           (a-number digit)
                           dial)))

(define (place-all-numbers dial)
    (place-and-turn
     1
     (place-and-turn
      2
      (place-and-turn
       3
       (place-and-turn
        4
        (place-and-turn
         5
         (place-and-turn
          6
          (place-and-turn
           7
           (place-and-turn
            8
            (place-and-turn
             9
             (place-and-turn
              10
              (place-and-turn
               11
               (place-and-turn
                12
                (place-and-turn
                 13
                 (place-and-turn
                  14
                  (place-and-turn
                   15
                   (place-and-turn
                    16
                    (place-and-turn
                     17
                     (place-and-turn
                      18
                      dial)))))))))))))))))))

(define CIRCLE
  (circle 50 "solid" "black"))

(define STAR
  (star 50 "solid" "gray"))