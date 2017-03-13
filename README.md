## My Library: Racket Turtle
My name: **Kevin Fossey**  
For FP1 I decided to explore the [Racket Turtle](https://docs.racket-lang.org/racket_turtle/index.html) library. The library a racket version of general Turtle Graphics, which is defined on [Wikipedia](https://en.wikipedia.org/wiki/Turtle_graphics) as   
>...vector graphics using a relative cursor (the "turtle") upon a Cartesian plane. [where] The turtle has three attributes: a location, an orientation (or direction), and a pen. The pen, too, has attributes: color, width, and on/off state.  
The Turtle is controlled with basic commands, like `(forward x)` which moves the turtle forward x, or `(turn-left x)` which turns the turtle to the left x degrees. The other attributes mentioned above are controlled with similar commands, like `(change-color "red")` to change the color, or `(change-pen-size x)` to change the size of the line to be drawn.  
These commands change the attributes, but the `(draw x)` command does the actual drawing, where x is a list of commands for the turtle. I followed the examples in the Racket documentation, and created a simple set of procedures to allow a user to create and draw some basic shapes.  
This is the code I came up with for creating and drawing a rectangle  
```scheme  
;list of turtle commands, which will produce a rectangle when called  
(define (rectangle h w)  
  (list (change-bg-color "black")  
        (change-color "purple")  
	(change-pen-size 5)  
	(forward w)(turn-right 90)  
	(forward h)(turn-right 90)  
	(forward w)(turn-right 90)  
	(forward h)))  
;procedure to draw the rectangle   
(define (draw-rect h w)  
  (draw (rectangle h w)))  
```  
the rectangle procedure accepts two arguments, for length and width, and returns a list containing some pen attribute changes (changing background to black, pen to purple, line size to 5) and the turtle commands to create the rectangle of the specified dimensions.  
So `(draw-rect 50 30)` produces  
![Turtle Rectangle](/rect.png?raw=true "Trutle Rectangle")

