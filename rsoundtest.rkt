#lang racket
(require rsound)
(require ffi/vector)

(play ding)
;(stop)

;buffer time must b between .2 and 1

(define teststream (make-pstream #:buffer-time .2))

(define firststream (make-pstream #:buffer-time .5))
(define secondstream (make-pstream #:buffer-time .5))
(define thirdstream (make-pstream #:buffer-time .5))

(define myvec (make-s16vector 10))

(define testsound ( rsound myvec 1 5 44100  ))
(s16vector 32660);1
(s16vector 32368);2
(s16vector 29768);3
(s16vector 22768);4
(s16vector 22768);5
(s16vector 22768);6
(s16vector 13468);7
(s16vector 12752);8

(play testsound)
 
(pstream-queue teststream testsound 1)
(pstream-queue teststream testsound 2)
(pstream-queue teststream testsound 3)

(pstream-play teststream testsound)
