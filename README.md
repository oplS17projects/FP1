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
![circle](/circle.png?raw=true "circle")

This part of code draws a star.
```
(define STAR
  (star 50 "solid" "gray"))
```

![star](/star.png?raw=true "star")

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
![number-10](/number-10.png?raw=true "number-10")

The official website provides a code for drawing the phone dial plate.
The function named place-all-numbers, which takes one shape? as parameter.
It calls place-and-turn internally to put all small objects in a circle order.
I made trivial modification to change it into another display, which does not serve the initial purpose but looks nice. 

![place all numbers](FP1/place-all-numbers.png)


