## My Library: racket/plot
My name: **Patrick Kyoyetera**

I chose to use racket/plot to learn out how to plot graphs graphs of information. The idea I have for my project might have to include plotting data in order to be able to visually represent it as useful information.

Here's an example of a snippet of code that plots the interval between negative pi and positive pi of functions passed inform of a list. I thought that if we're building a weather appliation, some information is more easily represented over a graph.

```
#lang racket

(require plot)

(plot (list (function-interval (λ (x) (- (sin x) 3))
                                 (λ (x) (+ (sin x) 3)))
              (function-interval (λ (x) (- (sqr x))) sqr #:color 79
                                 #:line1-color 44 #:line2-color 65))
        #:x-min (- pi) #:x-max pi))
```

The code block above calls the plot function to illustrate the area between the two intervals, and overlaps. The drawing is done in the order in which the functions are listed in so, the interval between the two sinm functions is drawn first then the sqareroot. 

![test image](/function-intervala.png?raw=true "Intervals between two 2D functions")

