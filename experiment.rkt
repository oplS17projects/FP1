;; Doug Salvati
;; Exploration 1
#lang racket
(require rsound)
(require plot)

;; Some necessary constants & objects
(define 12th-root-2 (expt 2 (/ 1 12)))
(define C1 32.7032) ;; Hz

;; Create a note.
;; Parameters: s: the letter note
;;             n: the octave
;; Returns a note
(define (make-note s n)
  (define (code)
    (cond [(eqv? s 'C)   0]
          [(eqv? s 'C#)  1]
          [(eqv? s 'D)   2]
          [(eqv? s 'D#)  3]
          [(eqv? s 'E)   4]
          [(eqv? s 'F)   5]
          [(eqv? s 'F#)  6]
          [(eqv? s 'G)   7]
          [(eqv? s 'G#)  8]
          [(eqv? s 'A)   9]
          [(eqv? s 'A#) 10]
          [(eqv? s 'B)  11]))
  (cons s
        (round (* C1 (expt 12th-root-2 (+ (code)
                                          (* (- n 1) 12)))))))

;; See the notation or the pitch of a note
(define notation car)
(define pitch cdr)

;; Visualize and hear the note
(define (seeAndHear n)
  (play (make-tone (pitch n) .1 50000))
  (plot (function (λ (x) (sin (* 2 pi (pitch n) x))) 0.00 0.01)))

;; Create a song using measures
(define (make-song . notes)
  notes)

;; Play the song using an rsound stream
(define (playSong s)
  (define stream (make-pstream))
  (define (iter s cnt)
    (if (null? s)
        "everything is queued up!"
        (begin (pstream-queue stream (make-tone (pitch (car s)) .1 20000) cnt)
               (iter (cdr s) (+ cnt 21000)))))
  (iter s 0))

;; Sample interpreter session I used to test
(play ding)
(define myNote (make-note 'A 4))
"My note is A4.  It should have freq. 440 Hz."
"Actual value:"
(pitch myNote)
(sleep 3)

;; Sample song
(playSong (make-song (make-note 'G 4)  (make-note 'D 5)  (make-note 'G 4)
                     (make-note 'F 4)  (make-note 'D 5)  (make-note 'F 4)
                     (make-note 'E 4)  (make-note 'D 5)  (make-note 'E 4)
                     (make-note 'D# 4) (make-note 'C 5)  (make-note 'G 4)
                     (make-note 'G 4)  (make-note 'D 5)  (make-note 'G 4)
                     (make-note 'F 4)  (make-note 'D 5)  (make-note 'F 4)
                     (make-note 'E 4)  (make-note 'D 5)  (make-note 'E 4)
                     (make-note 'D# 4) (make-note 'C 5)  (make-note 'G 4)
                     (make-note 'B 4)  (make-note 'B 4)  (make-note 'B 4)
                     (make-note 'B 4)  (make-note 'A 4)  (make-note 'G 4)
                     (make-note 'B 4)  (make-note 'A 4)  (make-note 'G 4)
                     (make-note 'B 4)  (make-note 'A 4)  (make-note 'G 4)
                     (make-note 'B 4)  (make-note 'A 4)  (make-note 'G 4)
                     (make-note 'B 4)  (make-note 'A 4)  (make-note 'B 4)
                     (make-note 'D 5)  (make-note 'C 5)  (make-note 'B 4)
                     (make-note 'G 4)))