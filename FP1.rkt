#lang racket
(require rsound)
(require rsound/single-cycle)
(require midi-readwrite)

;; wierd siren sound
(define vibrato-tone
  (network ()
           [lfo <= sine-wave 2]
           [sin <= sawtooth-wave (+ 400 (* 50 lfo))]
           [out = (* 0.1 sin)]))
(signal-play vibrato-tone)
(sleep 5)
(stop)


#|
(define sw (list 43 50 48 59 57 48 59 57 50))

;;(midi-file-parse "TeenageMutantNinjaTurtles.mid")
(define a (MIDIFile->notelist (midi-file-parse "TeenageMutantNinjaTurtles.mid")))
(define (vibrato-tone2 f)
  (network ()
           [sin <= pulse-wave .33 f ]
           [out = (* 0.1 sin)]))


(define (test l)
  (signal-play (vibrato-tone2 (midi-note-num->pitch (note-pitch (car l)))))
  (sleep 1)
  (stop)
  (if (empty? (cdr l))
      (stop)
      (test (cdr l))))

(test a)







(define vibrato-tone2
  (network ()
           [lfo <= sawtooth-wave 2]
           [sin <= pulse-wave .7 (+ 400 (* 50 lfo))]
           [out = (* 0.1 sin)]))
(signal-play vibrato-tone2)
(sleep 5)
(stop)

(define sum-of-sines
     (network ()
              [lfo <= sawtooth-wave 2]
              [a <= sine-wave (+ 34(* 75 lfo))]
              [b <= sine-wave 460]
              [out = (+ a b)]))
(signal-play sum-of-sines)
(sleep 5)
(stop)

(define sound-and-sub
  (let ([f 440])
     (network ()
              [sub <= square-wave (/ f 2)]
              [b <= sine-wave f]
              [out = (+ sub b)])))
(signal-play sound-and-sub)
(sleep 5)
(stop)

|#
;;(play (rs-read "2017-01-05_18-43-32.wav"))