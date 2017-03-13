#lang racket

(require graphics/graphics)

(open-graphics)

(define a (open-viewport "Graphics-lib" 500 500))

((draw-solid-rectangle a) (make-posn 50 40) 400 400)
 
(close-viewport a)
 
(close-graphics)