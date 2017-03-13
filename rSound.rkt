#lang racket
(require rsound)
 
(play ding)

(define sine
  (network ()
           [A5 <= sine-wave 150]
           [A6 <= sine-wave 85]
           [out = (+ A5 A6)]))

(signal-play sine)

(sleep 4)

(stop)


 (define VOLUME 0.1)
(define FREQUENCY 430)
 
(define (sine-tone f)
  (* VOLUME (sin (* 2 pi FREQUENCY (/ f FRAME-RATE)))))
 
(build-sound (* 2 FRAME-RATE) sine-tone)

(define vibrato-tone
  (network ()
           [lfo <= sine-wave 3]
           [sin <= sine-wave (+ 500 (* 50 lfo))]
           [out = (* 0.15 sin)]))
(signal-play vibrato-tone)
(sleep 5)
(stop)

(define signal
  (network ()
           [a <= sine-wave 560]
           [out = (* 0.1 a)]))
 
(define rs (signal->rsound 44100 signal))
 
(play rs)
(sleep 5)
(stop)

(define comb-level 0.99)
 
(play
 (signal->rsound
  (* 44100 3)
  (network ()
           [r = (random)]    ; a random number from 0 to 1
           [r2 = (* r 0.1)]  ; scaled to make it less noisy
                             ; apply the comb filter:
           [o2 <= (iir-filter (list (list 147 comb-level))) r]
                             ; compensate for the filter's gain:
           [out = (* (- 1 comb-level) o2)])))

(sleep 4)
 

; return a signal that generates square-wave tones, changing
; at the given interval into a new randomly-chosen frequency
; between lo-f and hi-f
(define (scrobble change-interval lo-f hi-f)
  (local
    [(define freq-range (floor (- hi-f lo-f)))
     (define (maybe-change f l)
       (cond [(= l 0) (+ lo-f (random freq-range))]
             [else f]))]
    (network ()
             [looper <= (loop-ctr change-interval 1)]
             [freq = (maybe-change (prev freq 568) looper)]
             [a <= square-wave freq])))
 
(define my-signal
  (network ()
           [a <= (scrobble 3500 210 675)]
           [b <= (scrobble 40540 140 900)]
           [lpf-wave <= sine-wave 0.1]
           [c <= lpf/dynamic (max 0.01 (abs (* 0.5 lpf-wave))) (+ a b)]
           [b = (* c 0.1)]))
 
; write 20 seconds to a file
 (rs-write (signal->rsound (* 20 44100) my-signal) "sound.wav")
 
; play the signal
(signal-play my-signal)

(sleep 30)
(stop)

; alarm clock sound
(define waveform (synth-waveform "vgame" 4))
 
; wrap i around when it goes off the end:
(define (maybe-wrap i)
  (cond [(< i 44100) i]
        [else (- i 44100)]))
 
; a signal that plays from a waveform:
(define loop-sig
  (network (pitch)
    [i = (maybe-wrap (+ (prev i 0) (round pitch)))]
    [out = (rs-ith/left waveform i)]))
 
(signal-play
 (network ()
   [alternator <= square-wave 2]
   [s <= loop-sig (+ (* 200 (inexact->exact alternator)) 400)]
   [out = (* s 0.1)]))
(sleep 10)
(stop)