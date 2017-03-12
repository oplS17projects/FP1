## My Library: (graphics/turtles)
My name: Tim Larocque

#### What I did

After reading through the turtles graphics library, I noticed that it was fairly
simple to get things done with it. What I didn't know when I started playing
with the library is that the turtle only draws a line. I had the turtle travel
around the screen (it actually doesn't travel, the code that's implemented
forces the drawing) to draw a series of lines, some at an angle and erase some.
Below is the code that I used to accomplish this, below that is an image of
what was produced.

#### Code
```racket
#lang racket

(require graphics/turtles)

(turtles)
(move 10)
(turn 90)
(draw 200)
(turn 180)
(erase 50)
(turn 90)
(draw-offset 50 50)
(turn 180)
(draw 100)
(turn 180)
(move 51)
(erase 50)
```

#### Output image
![output](/output.png?raw=true "output")
