# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

# Part 1: Get github
I have my account!!


# Part 2: Try a Library
I've played with several libraries; racket/gui, 2htdp/image, 2htdp/universe


# Part 3: Write your Report

## My Library: '2htdp/image'
My name: Seokhwan Ko

## Overall Plan
For this project, I have some plans to build GUI based program with racket.
I am still thinking about specific topic of my program,
but I think racket/gui is going to be useful to me.

## Play Report

I tried some libraries and I especially explored about '2htdp/image',
and drew diverse kind of figures for testing.
In this page, I uploaded Sierpinski triangle and Koch curve as test images.

### Test image - (Sierpinski Triangle)
![test image](/sier.png?raw=true "test image")

### Test Code - (Sierpinski Triangle)
```
#lang racket

(require 2htdp/image)

(let sierpinski ([n 5])
  (if (zero? n)
    (triangle 10 'solid 'green)
    (let ([t (sierpinski (- n 1))])
      (freeze (above t (beside t t))))))
```
### Test image - (Koch Curve)
![test image](/koch.png?raw=true "test image")

### Test Code - (Koch Curve)
```
(require 2htdp/image)

(define (koch-curve n)
    (cond
      [(zero? n) (square 1 "solid" "black")]
      [else
       (local [(define smaller (koch-curve (- n 1)))]
         (beside/align "bottom"
                       smaller
                       (rotate 60 smaller)
                       (rotate -60 smaller)
                       smaller))]))
(above
   (beside
    (rotate 60 (koch-curve 5))
    (rotate -60 (koch-curve 5)))
   (flip-vertical (koch-curve 5)))
```

