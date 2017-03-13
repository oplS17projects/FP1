#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define SCENE-WIDTH 500)
(define SCENE-HEIGHT 500)
(define BASE-RADIUS 10)
(define RADIUS-DEVIATION 20)
(define BASE-SPEED 2)
(define SPEED-DEVIATION 6)

; The Ball House object houses 2D balls inside of a rectangular box.
; This object makes updating and drawing many balls easier.
(define (MakeBallHouse width height ballCount)
  ; Generates a random list of balls with recursion
  (define (MakeListOfBalls ballCount)
    ; Simple helper function to create a single ball with random properties
    (define (MakeRandomBall)
      (define (get-random-color) (color (random 255) (random 255) (random 255) 200))
      (define (get-random-speed) (* (expt -1 (random 2)) (+ BASE-SPEED (random SPEED-DEVIATION))))
      (let ([radius (+ BASE-RADIUS (random RADIUS-DEVIATION))])
        (MakeBall
         (+ (random (- width (* 2 radius))) radius)
         (+ (random (- height (* 2 radius))) radius)
         (get-random-speed)
         (get-random-speed)
         radius
         (get-random-color))))
    (if (> ballCount 0)
        (cons (MakeRandomBall) (MakeListOfBalls (- ballCount 1)))
        '()))
  (define balls (MakeListOfBalls ballCount))
  ; updates the environment, i.e. updates the location of each ball after one tick
  ; tickTime is an unused parameter that is required by any onTick procedure
  (define (update tickTime)
    ; recursive helper function to update the location of each ball.
    (define (update-balls balls)
    (if (null? balls)
        '()
        (begin (((car balls) 'update))
               (update-balls (cdr balls)))))
    (update-balls balls))
  ; generates the image for one frame of the animation
  ; tickTime is an unused parameter that is required by any to-draw procedure
  (define (render tickTime)
    ; tail-recursive helper function to repeatedly call place-image on an originally empty canvas.
    ; I went out of my way to make it tail-recursive because this is a resource intensive procedure.
    (define (render-helper balls scene)
      (if (null? balls)
          scene
          (let ([ball (car balls)])
            (render-helper (cdr balls)
                           (place-image (ball 'render)
                                        (ball 'x)
                                        (ball 'y)
                                        scene)))))
    (render-helper balls (empty-scene width height)))
  (define (dispatch m)
    (cond
      [(equal? m 'update) update]
      [(equal? m 'render) render]))
  dispatch)

; Ball object
(define (MakeBall x y xVel yVel radius color)
  (define (set-x newVal)
    (set! x newVal))
  (define (set-y newVal)
    (set! y newVal))
  (define (set-xVel newVal)
    (set! xVel newVal))
  (define (set-yVel newVal)
    (set! yVel newVal))
  ; moves the x-coordinate of the Ball by one tick according to the x-velocity of the ball
  (define (update-x) (begin
                       (if (or (< (- (+ x xVel) radius) 0) (> (+ x xVel radius) SCENE-WIDTH)) (set-xVel (* -1 xVel)) 0)
                       (set-x (+ x xVel))))
  ; moves the y-coordinate of the Ball by one tick according to the y-velocity of the ball
  (define (update-y) (begin
                       (if (or (< (- (+ y yVel) radius) 0) (> (+ y yVel radius) SCENE-WIDTH)) (set-yVel (* -1 yVel)) 0)
                       (set-y (+ y yVel))))
  ; moves the ball by one tick
  (define (update) (begin (update-x) (update-y)))
  ; render is the image of this unique sized/colored ball
  (define render (circle radius "solid" color))
  (define (dispatch m)
    (cond
      [(equal? m 'x) x]
      [(equal? m 'y) y]
      [(equal? m 'set-x) set-x]
      [(equal? m 'set-y) set-y]
      [(equal? m 'xVel) xVel]
      [(equal? m 'yVel) yVel]
      [(equal? m 'set-xVel) set-xVel]
      [(equal? m 'set-yVel) set-yVel]
      [(equal? m 'update) update]
      [(equal? m 'render) render]))
  dispatch)

(define ballHouse (MakeBallHouse 500 500 20))

; the ticker function
(big-bang 0 ; initial tick value (unused)
          (on-tick (ballHouse 'update))
          (to-draw (ballHouse 'render))
          (stop-when (lambda (x) #f)))