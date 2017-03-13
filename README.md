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
  
While the rectangle was a rigidly defined list, the documentation for this library gives some examples on how to implement recursion to create dynamic lists for shape creation.  
  
Following some of the examples in the documentation, I was able to come up with a very simple procedure to create an octagon using recursion.  
```scheme
;recursively produce a list of turtle commands to draw an octagon  
(define (octagon l)  
  (define (oct-builder l count)  
    (if (<= count 0)  
        empty  
        (append (list (forward l)(turn-right 45))  
                (oct-builder l (sub1 count)))))  
  (oct-builder l 8))  
;procedure to draw the octagon  
(define (draw-oct l)  
  (draw (list (change-bg-color "black")  
              (change-color "purple")  
              (change-pen-size 5)  
              (octagon l))))  
```  
  
  the `octagon` procedure uses recursion to build a list of commands, creating a new command to draw each side and then turn the turtle in preparation to draw its next side.  
  
so `(draw-oct 25)` produces  
![Turtle Octagon](/oct.png?raw=true "Trutle Octagon")  
  
Getting more complicated, building off of `octagon` and the spiral example shown the racket documentation I came up with the following code  
```scheme
#lang racket  
(require teachpacks/racket-turtle)  
;creates a list of colors  
(define MY-COLORS (list "blue" "purple" "yellow" "red" "green"))  
  
;define the sides of the octagon  
(define (side s l d)  
  (list (change-pen-size s)(forward l)(turn-left d)))  
  
;recursively produce a list of 'side' lists, which can be used to draw the octagon  
(define (octagon s l d count)  
  (if (<= count 0)  
      empty  
      (cons (side s l d)  
            (octagon s l d (sub1 count)))))  
;recursively produce a list of octagons, increasing the length of the sides each time  
(define (tunnel s l d count)  
  (if (<= count 0)  
      empty  
      (append (octagon s l d 8)  
              (tunnel s (+ l 5) d (sub1 count)))))  
  
;this creates a list defining the entire shape  
(define shell-image (list (go-to 450 225)          ;move the starting position over     
                          (change-bg-color "black");changes the background color  
                          (change-color MY-COLORS) ;progresses through the list of colors, changing each time  
                          (tunnel 5 5 45 30)))     ;call tunnel to create the octagons  
;draw the shape  
(draw shell-image)  
```  
  
Using the same concept of recusively building a list of commands, the `tunnel` procedure recursively builds a list of the `octagon` list's, changing the length of the sides each time through.  
  
so `(draw shell-image)` produces  
![Turtle Tunnel](/tunnel.png?raw=true "Trutle Tunnel")  
  
This was a fun library to explore. Having never heard of turtle graphics, it was enjoyable yet challenging to figure out how the different commands could be utilized to create these shapes and patterns. It is understandable given the advancements in computer graphics, why turtle graphics isn't as prominent, but I understand the potential for this library in different applications.

