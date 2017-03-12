
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

I loaded a background image, just a random background that looked nice I found online. Not sure if it will be kept

```racket
(define background (bitmap "background.jpg"))
```
![background](https://raw.githubusercontent.com/mdanino94/FP1/master/background.jpg)

I also added a hook class which will be a hookshot that is used to pop the bubbles, which is just a default triangle type in the image library.
```racket
(define (hook x y shooting) ; will eventually be second object that needs an x and y since it will be shot to pop bubbles
  (define orig-y y) ;save what to reset y value to when it reaches the top of the screen
  (define (dispatch comm)
    (cond [(equal? comm 'x) x]
          [(equal? comm 'y) y]
          [(equal? comm 'is-shooting?) (if (equal? shooting 'no) #f #t)]
          [(equal? comm 'start-shooting) (if (equal? shooting 'no) (set! shooting 'yes) "shooting")] ; need to debug this, if statement doesn't seem to read properly
          [(equal? comm 'stop-shooting) (set! shooting 'no)]
          [(equal? comm 'update) (begin (set! x (p1 'position)) (set! y (- y 10)))]
          [(equal? comm 'reset) (begin (set! y orig-y) (set! shooting 'no))]
          [else (error "hook: unknown command --" comm)]))
  dispatch)
  
  ...
  
(define my-hook (hook 50 900 'no))
(define my-hook-sprite (triangle 20 "solid" "red"))
```
I couldn't figure out if there was a way to draw seperate images/sprites to the screen at once yet, so I just loaded the player and hook sprite as a single image using the overlay function

```racket
(define (update-screen x)
  (underlay/xy background (p1 'position) ; x val
               (- (my-hook 'y) 10) (overlay/offset my-hook-sprite 0 50 p1-sprite)))
```

and an event handler for keypresses, in this case left, right, and space bar. left and right move left/right 5 pixels each time, space bar "shoots" the sprite to the top of the screen, resetting when it reaches the top.
```racket
;handle key events
(define (change w a-key)
  (cond [(key=? a-key "left") (p1 'move-left)]
        [(key=? a-key "right") (p1 'move-right)]
        [(key=? a-key " ") (my-hook 'start-shooting)]
        [else w]))
```

"start shooting" just updates the sprite's y value each tick, setting it to 10 pixels higher than the previous time. the player can't "shoot" the sprite again until it's been reset. this is checked with the "shooting" bool in the hook class.

```racket
(define (hook x y shooting) ; will eventually be second object that needs an x and y since it will be shot to pop bubbles
  (define orig-y y) ;save what to reset y value to when it reaches the top of the screen
  (define (dispatch comm)
    (cond ...
    [(equal? comm 'start-shooting) (if (equal? shooting 'no) (set! shooting 'yes) "shooting")] ; need to debug this, if statement doesn't seem to read properly
          [(equal? comm 'stop-shooting) (set! shooting 'no)]
          [(equal? comm 'update) (begin (set! x (p1 'position)) (set! y (- y 10)))]
          [(equal? comm 'reset) (begin (set! y orig-y) (set! shooting 'no))])))

...

(define (update-sprites x) (if (and (my-hook 'is-shooting?) (> (my-hook 'y) 10)) ; if the hook is shooting and it hasn't reached the top of the screen yet
                               (my-hook 'update) ; keep moving it up 10 pixels
                               (my-hook 'reset))) ; reset to original place
```
it was rendered by the big-bang function based off of an example found at the bottom of the universe page https://docs.racket-lang.org/teachpack/2htdpuniverse.html

```racket
(big-bang 'world0
          (on-tick update-sprites); figured out what this does. haven't updated my .rkt file yet for this comment, it can just be used to update class types, but won't re-draw what is shown on the screen. leaving that for "update-screen" call.
          (on-key change) ; check for key events (left, right or space)
          (to-draw update-screen)) ; update sprite (sprites eventually, hopefully
```

screenshots of FP1.rkt running

![on-load](https://github.com/mdanino94/FP1/blob/master/on-load.png)

![moving around](https://github.com/mdanino94/FP1/blob/master/moving%20around.png)

![mid-shoot](https://github.com/mdanino94/FP1/blob/master/mid-shoot.png)



