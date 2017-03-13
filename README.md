# Final Project Assignment 1: Exploration (FP1)

## My Library: Plot: Graph Plotting
My name: Matthew DiBello

For my experimentation, I decided to play around with a data visualization library for Racket. I spent a while skimming through the documentation to see it's capabilities, and they are tremendous. The library supports extraordinarily complex graphs, including 3D graphs which you can rotate 360 degrees with your mouse.

I decided to go with something rather simple, just to test out the library (instead of struggling with math). I wrote a simple procedure that takes a list of test scores and plots them. For example, you could invoke this procedure in the following way:

```
> (plot-scores '(100 90 75 60 40 20))
```

It then takes all the scores and plots them on the graph in order from lowest to highest. Probably for this situation, where there is one score for each student, a bar chart would have been better. Regardless, the goal was to play with the libary, not build a good piece of software.

In addition, I wrote functions to find the mean and the standard deviation, which, if I were to pursue this library and area of work, could use for higher level plotting. Here's the code for finding the mean:

```
(define (find-mean lst)
  (/ (foldr + 0 lst) (length lst)))
```

And below, the code for standard deviation:

```
(define (find-stddev lst mean)
  (define (stddev-helper v p)
    (+ (* (- v mean) (- v mean)) p))
  (sqrt (/ (foldr stddev-helper 0 lst) (length lst))))
```

These two math functions simply returned numbers corresponding to the result of the calculations, and the main plotting function opens a new window, displaying the graph, as you can see in the image below:

![screenshot](/screenshot.png?raw=true "screenshot")
