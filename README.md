
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: 2htdp/image and universe
My name: Michael Danino

Write what you did!
Remember that this report must include:

After seeing examples of what Mark showed in class, I saw "slime volleyball" which reminded me of a game I used to play years ago called bubble trouble, so I wanted to see if I could recreate that. I asked Mark what libraries he suggested looking at and told me to look at these 2 libraries. I built what I hope will become basics for my version of bubble trouble.

There's a player class with a main player (player 1) who can move left and right, and is always kept at the bottom of the screen.

```racket
(define (player x y)
  (define (dispatch comm)
    (cond [(equal? comm 'move-left) (if (< x 1) x (set! x (- x 5)))]
          [(equal? comm 'move-right) (if (> x 1490) x (set! x (+ x 5)))]
          [(equal? comm 'position) x]
          [(equal? comm 'shoot) (if (my-hook 'is-shooting?) ;if it's not shot yet, let start shot. otherwise ignore.
                                    (my-hook 'start-shooting)
                                    "currently shooting")] ; will eventually shoot a grappling hook to top of screen. for now it shoots the sprite since I can't figure out how to draw multiple sprites yet.
          [else (error "player: unknown command --" comm)]))
  dispatch)

...
(define p1 (player 0 900))
(define p1-sprite (bitmap "Kirby_Sprite.png")) ; image used for the player, for now just a random kirby sprite.
```

I made a background image just a random background that looked nice I found online, not sure if it will be kept

```racket
(define background (bitmap "background.jpg"))
```

* a narrative of what you did
* highlights of code that you wrote, with explanation
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

