## My Library: Plot: Graph Plotting
My name: Brandon Karl

For my first exploration I used the graph plotting library to see how to make different plots and create graphs in racket. The first thing I did was look at how to make 2D graph, and hardcoded in a higher order function that will make the sin function and draw it for you. All the user has to do is input their x min and x max. 
```
;Makes sin fn using x bounds
(define (make-sin x1 x2)
  (plot (function sin x1 x2 #:label "y = sin(x)")))
```
Then I created another function that lets the user enter any line in to be graphed, having the user give the m and b for mx+b and their x boundries again. 
```
;Makes custom line using x bounds
(define (make-line m b x1 x2)
  (plot (function (lambda (x) (+ (* m x) b)) x1 x2 #:label "y = mx+b")))
```
Then I created a function to let the user enter 2 functions of their own anf have both be plotted on the screen at the same time. 
```
;Plots two graphs at the same time using x bounds
(define (plot-two-graphs f1 f2 x1 x2)
  (plot (list (axes)
             (function f1 x1 x2)
             (function f2 x1 x2))))
```
Lastly I created a function where a user could input a 3D function with an x and y variable and have that show on the screen.
```
;Makes 3d graph from lambda fn with x and y parameters
(define (make-3D f1 x1 x2 y1 y2)
  (plot3d (surface3d f1 x1 x2 y1 y2)
          #:title "My function"
          #:x-label "x" #:y-label "y" #:z-label "My function"))
```

Here is some example output:

![output](/Plotting2graphs.png?raw=true "Plotting 2 Graphs")

