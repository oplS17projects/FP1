# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: 2htdp
My name: Xiaoling Zheng

* a narrative of what you did

I explored the library 2htdp; ran the code provided on the official website and modified some code to play around.

* highlights of code that you wrote, with explanation

This part of code draws a circle.
```
(define CIRCLE
  (circle 50 "solid" "black"))
```

This part of code draws a star.
```
(define STAR
  (star 50 "solid" "gray"))
```

Then I played with overlay and modified this ->
```
(define (a-number digit)
    (overlay
     (text (number->string digit) 10 "black")
     (square 14 "solid" "white")))
```
to ->
```
(define (number digit)
    (overlay
     (text (number->string digit) 15 "white")
     (circle 15 "solid" "red")))
```
The official website provides a code for drawing the phone dial plate.
The function named place-all-numbers, which takes one shape? as parameter.
It calls place-and-turn internally to put all small objects in a circle order.
I made trivial modification to change it into another display, which does not serve the initial purpose but looks nice. 

![place-all-numbers](/place-all-numbers.jpg?raw=true "place all numbers")

* output from your code demonstrating what it produced

* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. Yes, you need at least one image (output, diagrams). Images must be embedded into this md file. We should not have to click a link to see it. This is github, handling files is awesome and easy!

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

