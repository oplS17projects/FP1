## My Library:  (require graphics/turtles) & (require graphics/turtle-examples)
My name: Brett Lundy

Write what you did!
For this assignment, I used the graphics/turtles library to play around with drawing objects to a window. One thing I did with this, that I saved, was to draw a simple square to the screen. I primarily used the draw, turn and move commands to manipulate were the turtle was and were it needed to draw to. My function looked like this: 
```racket
(define (draw_square_in_window)
  (split (turn/radians (/ pi 2)))
  (draw 50)
  (home)
  (turn/radians (/ pi 2))
  (move 50)
  (turn/radians (/ pi 2))
  (turn/radians (/ pi 2))
  (turn/radians (/ pi 2))
  (move 50)
  (turn/radians (/ pi 2))
  (turn/radians (/ pi 2))
  (split (turn/radians (/ pi 2)))
  (draw 50)
  (home)
)
```
I also used the require graphics/turtle-examples library to try and draw a circle. I used the web to see how to draw a circle and found that somone had used this to draw the Olympics symbol using Python. Seeing this made me want to use Racket to do the same thing. I went about this by using a pre-defined function in the graphics/turtle-examples library to make a polygon. I turned the polygon into a circle like object by setting the amount of sides to an amount too large to see the edges, thus it took the form of a circle. The function looked like this:
```racket
(define (draw_olympics_symbol)
  (move -150)
  (regular-poly 100 50)
  (move 150)
  (regular-poly 100 50)
  (move 150)
  (regular-poly 100 50)
  (home)
  (move -150)
  (turn/radians (- 0 (/ pi 2)))
  (move 50)
  (turn/radians (/ pi 2))
  (move 75)
  (regular-poly 100 50)
  (move 150)
  (regular-poly 100 50)
  )
```

![test image](/square_image.jpeg?raw=true "Square Image")

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.


