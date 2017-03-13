# FP1
## My Library: graphics/turtles
My name: David Caizzi

For my exploration1, I decided to take a look at the traditional turtles library. This is a library that provides basic turtle functionality. It lets you move the turtle, draw with the turtle, rotate the turtles, and duplicate the turtles. 
Using turtles, I created a program that sets up a coordinate plane and allows you to draw some basic shapes within it. Using turtles isn't the most efficient way to draw shapes and stuff on a coordinate plane, but it gave me experience using turtles.

I started out by making a procedure that draws a coordinate plane.
![Coordinate Plane](/grid.jpg?raw=false "Coordinate Plane")

The procedure draws the x-axis and the y-axis and then calls a recursive procedure that draws notches on the axes at user-chosen increments.
This code is the procedure that draws the notches. It walks itself down the axis and turns and draws at regular increments.
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
Once the coordinate plane was drawn, I implemented a few procedures to draw some basic shapes.
![Shapes](/shapes.jpg?raw=false "Shapes")

This was pretty straightforward and consisted of telling the turtle to move to a user-specified location and draw stuff depending on the size the user input.
The code for my rectangle procdure is pretty much what you'd expect. It moves itself to the position of the first corner and then draws the length of a side, turns 90 degrees, and then does it again. It does this 4 times because suprisingly, rectangles have 4 sides.
```racket
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
```
![Octagon](/octagon.jpg?raw=false "Octagon")

Lastly, I decided to get a little wild and experiment with some recursion. I implemented a procedure that uses tail-recursion to draw an octagon. By tweaking the recursion depth and the angles it turns at, you can make it draw any regular polygon.
```racket
(define (recursive-octagon)
  (define (oct-h x)
    (if (= x 0) 0
        (begin
          (draw 50)
          (turn 45)
          (oct-h (- x 1)))))
  (oct-h 8))
```
