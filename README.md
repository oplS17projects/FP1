## My Library: Plot
My name: Scott Quinn

I went through the first three sections of the Plot library and whenever there was some example code I typed it into racket to get a feel on the general graphing procedures. I started off with the first example of graphing a sine wave. 
```racket
#lang racket

(require plot)
(plot-new-window? #t)
(plot (function sin (- pi) pi #:label "y = sin(x)"))
```
![sine](/sine.jpg?raw=true "sine")


I didn't deviate into trying anything out for myself for a bit. Once I was confortable with the 2D graphing I tried to draw a circle using cartesian coordinates.
```racket
#lang racket

(require plot)
(plot (list (axes)
            (function (λ (x) (sqrt (- 100 (* x x)))))
            (function (λ (x) (- (sqrt (- 100 (* x x)))))))
      #:x-min -10 #:x-max 10
      #:y-min -10 #:y-max 10)
```
![circle](/badcircle.jpg?raw=true "circle")

That was before I read about polar coordinates. I had the same result using the following:
```racket
#lang racket

(require plot)
(plot (polar (λ (theta) 10)))
```
After that I did some basic 3D plotting, like making a sphere
```racket
#lang racket

(require plot)
plot3d (polar3d (λ (theta rho) 1) #:color 2 #:line-style 'transparent)
        #:altitude 25)
```
![ball](/ball.jpg?raw=true "ball")


After getting used to 3D graphing I was thinking about some other cool graphs i could remember apart from the circle. I remembered hearing about a [Superformula][superformula] and that it could make cool graphs. So I tried to use it in racket.
```racket
#lang racket

(require plot)
(plot (polar (λ (theta) (expt (+ (abs (/ (cos (/ (* 88 theta) 4)) 1))
                                 (abs (/ (sin (/ (* 64 theta) 4)) 1)))
                              (- (/ 1 -20)))))
```
created


![--208864](/--208864.jpg?raw=true "--208864")

changing the 88 64 and 20 gives different pictures

![346](/346.jpg?raw=true "346")

![346-](/346.png?raw=true "346-")

![-p2244](/-p2244.jpg?raw=true "-p2244")

I thought it was neat and called it quits.


<!-- Links -->

[superformula]: https://en.wikipedia.org/wiki/Superformula

