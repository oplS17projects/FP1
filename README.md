## My Library: (2htdp universe and image)
My name: Danny Nguyen

## What I did:

After exploring through the list of libraries availiable I chose to go with the 2htdp universe and image libraries, which will make it possible to create an interactive game. During my free time I love to play video games, so my Inspiration for the idea behind this project came from that aspect of my life. I would like to create an old school fps game after exploring the libraries further. For this first assignment I made a world where users are able to influence the size of the given star by pressing the up and down arrow.

## Simple code written while exploring:

The first block defines the overlay of the star onto the empty-scene

The second block of code takes user input "up-arrow" or "down-arrow"
and alters the size of the star.

The third block of code draws the star and and waits for an on-key event to change the image.
```scheme
#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define (draw-star n)
  (overlay (star n "solid" "red") (empty-scene 500 500)))

(define (change w a-key)
  (cond
    [(key=? a-key "up")(+ w 10)]
    [(key=? a-key "down")(- w 10)]
    [else w]))

(big-bang 50
          (to-draw draw-star)
          (on-key change))
```           
## Image outputs from code:

<img src="https://github.com/dannynguyen1/FP1/blob/master/Initial.png" width="200" height="200">

<img src="https://github.com/dannynguyen1/FP1/blob/master/After%20pressing%20up%20arrow.png" width="200" height="200">

<img src="https://github.com/dannynguyen1/FP1/blob/master/After%20pressing%20down%20arrow.png" width="200" height="200">

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

