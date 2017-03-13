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

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![Initial](https://github.com/dannynguyen1/FP1/blob/master/Initial.png)

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

