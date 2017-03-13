#lang racket

(require rsound rsound/draw rsound/envelope)

(play ding)

;;(play(rs-read "test.wav"))

(rs-read-frames "test.wav")
(rs-frames(rs-read "test.wav"))
;;(play(clip (rs-read "test.wav") 0 1900000))
;(rs-draw (rs-read "test.wav"))

;(rs-overlay ding (clip (rs-read "test.wav") 0 1900000))

;;(play(rs-scale 5 (clip (rs-read "test.wav") 0 1900000)))

;(play(rs-mult (rs-read "test.wav")(rs-read "test.wav")))

(rs-draw(rs-mult (rs-read "test.wav")(rs-read "test.wav")))

(play (rs-append ding ding))

;(define waveform (synth-waveform "vgame" 4))

;(define (maybe-wrap i)
  ;(cond [(< i 44100) i]
        ;[else (- i 44100)]))
 
;(define loop-sig
  ;(network (pitch)
    ;[i = (maybe-wrap (+ (prev i 0) (round pitch)))]
    ;[out = (rs-ith/left waveform i)]))
 
;(signal-play
 ;(network ()
   ;[alternator <= square-wave 2]
   ;[s <= loop-sig (+ (* 200 (inexact->exact alternator)) 400)]
   ;[out = (* s 0.1)]))


