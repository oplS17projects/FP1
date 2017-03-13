;David Caizzi

#lang racket
(require graphics/turtles)


(turtles #t)


(define (square x) (* x x))

;Draw a grid to give a sense of size
;x is distance between notches
(define (draw-grid x)
  (begin
    (tprompt
     (move (* -1 (/ turtle-window-size 2)))
     (draw turtle-window-size))
    (tprompt
     (turn 90)
     (move (* -1 (/ turtle-window-size 2)))
     (draw turtle-window-size))
    (tprompt
     (draw-notches x turtle-window-size))
    (tprompt
     (turn 90)
     (draw-notches x turtle-window-size))
    (tprompt
     (turn 180)
     (draw-notches x turtle-window-size))
    (tprompt
     (turn 270)
     (draw-notches x turtle-window-size))))

;Recursive function to draw the notches on grid
;x is distance between notches
(define (draw-notches x size)
  (if (> 0 (- size x)) 0
      (begin
        (move x)
        (tprompt
         (tprompt
          (turn 90)
          (draw 7))
         (turn -90)
         (draw 7))
        (draw-notches x (- size x)))))

;draw a grid with notch distance of 50 pixels
(draw-grid 50)

;Draw a square x and y are the coords of the bottom left corner. side is side length
(define (draw-square x y side)
  (tprompt
   (begin
     (move x)
     (turn 90)
     (move y)
     (draw side)
     (turn -90)
     (draw side)
     (turn -90)
     (draw side)
     (turn -90)
     (draw side))))

;Draw an equilateral triangle. x and y are the coords of the bottom left corner. side is side length
(define (draw-triangle x y side)
  (tprompt
   (move x)
   (turn 90)
   (move y)
   (turn -30)
   (draw side)
   (turn -120)
   (draw side)
   (turn -120)
   (draw side)))

;Draw a rectangle. x1 y1 and x2 y2 are opposing corners
(define (draw-rect x1 y1 x2 y2)
  (tprompt
   (move x1)
   (turn 90)
   (move y1)
   (draw (- y2 y1))
   (turn -90)
   (draw (- x2 x1))
   (turn -90)
   (draw (- y2 y1))
   (turn -90)
   (draw (- x2 x1))))


;Recursively draws an octagon
(define (recursive-octagon)
  (define (oct-h x)
    (if (= x 0) 0
        (begin
          (draw 50)
          (turn 45)
          (oct-h (- x 1)))))
  (oct-h 8))