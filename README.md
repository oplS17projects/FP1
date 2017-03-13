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
![circle](circle.png)

This part of code draws a star.
```
(define STAR
  (star 50 "solid" "gray"))
```
![star](star.png)
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
![number-10](number-10.png)

The official website provides a code for drawing the phone dial plate.
The function named place-all-numbers, which takes one shape? as parameter.
It calls place-and-turn internally to put all small objects in a circle order.
I made trivial modification to change it into another display, which does not serve the initial purpose but looks nice. 

![place all numbers](place-all-numbers.png)

* output from your code demonstrating what it produced

* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. Yes, you need at least one image (output, diagrams). Images must be embedded into this md file. We should not have to click a link to see it. This is github, handling files is awesome and easy!

