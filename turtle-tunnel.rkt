#lang racket
(require teachpacks/racket-turtle)
;creates a list of colors
(define MY-COLORS (list "blue" "purple" "yellow" "red" "green"))

;define the sides of the octagon
(define (side s l d)
  (list (change-pen-size s)(forward l)(turn-left d)))

;recursively produce a list of 'side' lists, which can be used to draw the octagon
(define (octagon s l d count)
  (if (<= count 0)
      empty
      (cons (side s l d)
            (octagon s l d (sub1 count)))))
;recursively produce a list of octagons, increasing the length of the sides each time
(define (tunnel s l d count)
  (if (<= count 0)
      empty
      (append (octagon s l d 8)
              (tunnel s (+ l 5) d (sub1 count)))))

;this creates a list defining the entire shape
(define shell-image (list (go-to 450 225)          ;move the starting position over   
                          (change-bg-color "black");changes the background color
                          (change-color MY-COLORS) ;progresses through the list of colors, changing each time
                          (tunnel 5 5 45 30)))     ;call tunnel to create the octagons
;draw the shape
(draw shell-image)