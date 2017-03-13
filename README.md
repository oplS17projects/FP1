`(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: racket/plot
My name: **Patrick Kyoyetera**

Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

I chose to use racket/plot to find out how to plot graphs graphs of information. The idea I have for my project might have to include plotting data in order to be able to visually represent it as useful information.

```
#lang racket

(require plot)

(plot (list (function-interval (λ (x) (- (sin x) 3))
                                 (λ (x) (+ (sin x) 3)))
              (function-interval (λ (x) (- (sqr x))) sqr #:color 79
                                 #:line1-color 44 #:line2-color 65))
        #:x-min (- pi) #:x-max pi))
```

The code block above calls the plot function with a list of two intervals to be illustrated with different colors. 

![test image](/function-intervala.png?raw=true "Intervals between two 2D functions")

