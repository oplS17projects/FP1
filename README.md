# FP1
## My Library: graphics/turtles
My name: David Caizzi

For my exploration1, I decided to take a look at the traditional turtles library. This is a library that provides basic turtle functionality. It lets you move the turtle, draw with the turtle, rotate the turtles, and duplicate the turtles. 
Using turtles, I created a program that sets up a coordinate plane and allows you to draw some basic shapes within it.

I started out by making a procedure that draws a coordinate plane.
![test image](/grid.jpg?raw=true "test image")
The procedure draws the x-axis and the y-axis and then calls a recursive procedure that draws notches on the axes at user-chosen increments
```racket
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
```


