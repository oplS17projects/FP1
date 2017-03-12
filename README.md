# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

#Part 1: Get github
If you don't have a github account, go get one. https://github.com/
This whole assignment will be done and submitted via github, and you're already here!
 
#Part 2: Try a Library
In this exercise, you will play with at least one library provided by the Racket developers. You will have the opportunity to explore another library later.

Please choose libraries that you think you might be interested in using in your final project.

Start off at the Racket home page, http://racket-lang.org/, and then click on the Documentation link, taking you here: http://docs.racket-lang.org/.
 
There are lots of libraries. Play with one.
 
Your job is to explore one library and write up your results. Load the library and write some code to drive it around.
For example, maybe you are interested in retrieving data from the web. If we look at the net/url library, we will find functions for creating URLs, issuing HTTP GET commands, and displaying the results. Here is a little bit of code for driving around a few of the functions in this library:
```racket
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```
Notice that `(require net/url)` is all you need to put in your buffer in order to load the library and start using it.
This above is a trivial example; to complete this for the purposes of this assignment (if you go down the path of pulling HTTP requests), you should use the parsing libraries to parse the HTML, JSON, or XML that is returned.

### The following libraries are not allowed for project explorations:
* games/cards
* racket/gui
* racket/draw 

You can still use these in your project, but you must explore different libraries for this assignment.

#Part 3: Write your Report
Write your report right in this file. Instructions are below. Delete the instructions when you are done. Also delete all my explanation (this stuff), as I've already read it.

You are allowed to change/delete anything in this file to make it into your report. It will be public, FYI.

This file is formatted with the [**markdown** language][markdown], so take a glance at how that works.

This file IS your report for the assignment, including code and your story.

Code is super easy in markdown, which you can easily do inline `(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

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

![output](/plotting2graphs.png?raw=true "Plotting 2 Graphs")
Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")

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

## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule].

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

