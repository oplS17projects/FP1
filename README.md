Source code:
```racket
#lang racket

(require 2htdp/image)

(define tri0
(triangle 25 "solid" "black"))

(define (serpinski n)
(if (= 0 n)
tri0
(above (serpinski (- n 1))
(beside (serpinski (- n 1))
(serpinski (- n 1))))))


(define (plum_flower color)
(pulled-regular-polygon 30 5 1.3 140 100 color))

(define (shadow image)
(above image
(scale/xy 1 0.5 (flip-vertical image)) ))

(define scene1
(place-image/align (shadow (serpinski 2)) 0 0 "left" "top" (empty-scene 100 150 "gray")))

(define scene2
(place-image
(plum_flower "red") 120 30
(place-image
(plum_flower "purple") 124 80
(place-image
(plum_flower "slategray") 150 60
(place-image
(plum_flower "blue") 170 130
(place-image
(plum_flower "green") 150 100
(rectangle 200 200 40 "red")))))))


My Library: 2htdp/image
My name: Jessica Lai

I decided to play around with the 2htdp images library because no matter what I make for the final project,
I will need some sort of display to make it interactive and visual.

I played around with basic shape api's such as circle, square, and polygon to get a general feel of the 
library first and then used these functions to create some fun images.

First part is the serpinski triangle. I created a base case triangle tri0 and then defined a function
that takes a argument times and recursively draws a triangle on top of two triangles beside one another.

Then I played around with the scaling and flip function to create a function that given an image, generates
it and it's shadow directly below(flip and scaled down vertically).

Lastly, I created 2 scenes, to get familar with place-image.
scene1 puts serpinski 2 and it's shadow into an empty scene with gray background.
scene2 puts multiple plum-flower images into a rectange (could be replaced with empty scene).
These could be helpful because empty-scenes can be used to build worlds in 2htdp universe. (Which
will be an adventure for another day)


<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

