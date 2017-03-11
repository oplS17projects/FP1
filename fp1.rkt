#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define (bubble x y size speed color)
  (define (dispatch comm val) ; couldn't figure out how to do an optional arg (val only needed in update case)
    (cond [(equal? comm 'x) x]
          [(equal? comm 'y) y]
          [(equal? comm 'update-x) (set! x val)]
          [(equal? comm 'update-y) (set! y val)]
          [(equal? comm 'size) size]
          [(equal? comm 'speed) speed]
          [(equal? comm 'color) color]
          [(equal? comm 'draw) (circle size "solid" color)]
          [else (error "bubble: unknown command --" comm)]))
    dispatch)
          
(define (player x y)
  (define (dispatch comm)
    (cond [(equal? comm 'move-left) (set! x (- x 5))]
          [(equal? comm 'move-right) (set! x (+ x 5))]
          [(equal? comm 'position) x]
          [(equal? comm 'shoot) 1] ; will eventually shoot a grappling hook to top of screen
          [else (error "player: unknown command --" comm)]))
  dispatch)

(define p1 (player 0 900))
(define p1-sprite (bitmap "Kirby_Sprite.png"))
(define bluebubble (bubble 0 500 30 3 "blue"))
          
(define background (bitmap "background.jpg"))

(define (change w a-key)
  (cond [(key=? a-key "left") (p1 'move-left)]
        [(key=? a-key "right") (p1 'move-right)]))