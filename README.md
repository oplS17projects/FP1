## My Library: Plot Library
My name: Thaddeus Ciras

For fp1 I just took a very basic look into the plotting library in racket.
Knowihg that this is a large library with may possible plots, I decided to
look at a simple 2D plot and a fairly simple 3D plot.
```racket
(require plot)
(define my2Dplot
 (plot (function sin (- pi) pi #:label "y = sin(x)")))
```
