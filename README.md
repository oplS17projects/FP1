# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017


## My Library: Plot
My name: Ruowei Zhang

I look through the libraries and have interests in the Plot library. This library has functions and examples about how to design 2D or 3D models. After reading the examples, I decide to plot my own image. I use three functions to finish my FP1. They are polar, rectangles and isoline.

See screen shots from http://docs.racket-lang.org/plot/renderer2d.html

![polarcenter](/polarcenter.png?raw=true "polarcenter")

![rec](/rec.png?raw=true "rec")

![isoline](/isoline.png?raw=true "isoline")


To plot "OPL", I need to divide the letters into shapes that can be easily plotted. "O" can be a circle. "P" has a rectangle plus a circle. "L" has two combined rectangles.

The code below shows part of the plot.

`(polar (lambda (theta) 1.5) #:color "pink" #:width 18) `

Polar is the function to plot circles with the center (0,0). 

I use it to ploy the circle in "P".


`(rectangles (list (vector (ivl -2 -1) (ivl -4 2))) #:color "pink" #:line-color "pink")`

Rectangles is the function to plot rectangles. Vector takes two parameters, the first one is the horizontal side of the rectangle, and the second one is the vertical side of the rectangle. With these two sides, the function can plot the rectangle.

I use it to plot the rec in "P", and two recs in "L"

`(isoline (lambda (x y) (sqrt (+ (sqr (+ x 7)) (sqr (+ y 1))))) 2.5 -11 9 -11 9 #:color "green" #:width 20))`

Isoline is the function to plot the circle, which using the math function (x-a)^2 + (x-b)^2 = r^2

I use it to plot the "O"



Here is the output:

![rzopl](/OPLFP1.png?raw=true "rzopl")



