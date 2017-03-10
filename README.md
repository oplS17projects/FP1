## My Library: Rsound
My name: Jake Adamson

https://docs.racket-lang.org/rsound/index.html

I want to try the library Rsound which is an interesting lib that lets you do sound manipulation from play back to sound synthesis. 
Here the most basic example of how Rsound works.

```racket
(require rsound)
 
(play ding)
```
The procedure play takes an Rsound object which is the final state of the audio object before playing. The documentation says that (play ding) is an easy way to test you’re the lib to see if your installation work. And in fact, I had trouble getting this lib to work because my sound card was set to an audio resolution that was higher than it was expecting. 

Once I got the lib working I started to look through it to find parts that would be fun just to mess around with at first. And I found these procedures called networks. syntactically it looks a lot like cond it takes a bunch of inputs but the last line always has an out = (sound). here a few examples I was playing with.

```racket
#lang racket
(require rsound)

;; this rsound object is one sawtooth wave
;; that is being modulated by a sine wave at
;; 2hz. when the sin is multiplyed by 0.1
;; is to controll the volume
(define vibrato-tone
  (network ()
           [lfo <= sine-wave 2]
           [sin <= sawtooth-wave (+ 400 (* 50 lfo))]
           [out = (* 0.1 sin)]))
(signal-play vibrato-tone)
(sleep 5)
(stop)

;; cool alarm sound
(define vibrato-tone2
  (network ()
           [lfo <= sawtooth-wave 2]
           [sin <= pulse-wave .7 (+ 400 (* 50 lfo))]
           [out = (* 0.1 sin)]))
(signal-play vibrato-tone2)
(sleep 5)
(stop)

;; strange siren
;; this rsound has waveform in a is being
;; modulated by a sawtooth wave that ocsilating
;; at 2hz. finally a and b summed
(define sum-of-sines
     (network ()
              [lfo <= sawtooth-wave 2]
              [a <= sine-wave (+ 34(* 75 lfo))]
              [b <= sine-wave 460]
              [out = (+ a b)]))
(signal-play sum-of-sines)
(sleep 5)
(stop)

;; boring sine with sub
;; rsound is made up of a square wave
;; that is an octave lower then the sine
;; and finaly they are summed together
(define sound-and-sub
  (let ([f 440])
     (network ()
              [sub <= square-wave (/ f 2)]
              [b <= sine-wave f]
              [out = (+ sub b)])))
(signal-play sound-and-sub)
(sleep 5)
(stop)
```
#Waveforms
![alt text][wave]

Sine 1,2 is what sum-of-sines waveform looks like and you can see the other waveforms that are being used as well.
#MIDI
Once I got the synth sounds to work I want to see if I chould hook up a MIDI file and get a synth to play a song. All I end up getting to work was a bunch of pitches to play evenly space out that did not resemble the song at all. I also need to get midi-readwrite lib to get the MIDI notes out of the file. While getting the MIDI data I used midi-note-num->pitch fuction to turn the notes in to pitches this functions is part of rsound.

```racket
#lang racket
(require rsound)
(require rsound/single-cycle)
(require midi-readwrite)

(define sw (list 43 50 48 59 57 48 59 57 50))
;; this gives you all the MIDI info
;;(midi-file-parse "TeenageMutantNinjaTurtles.mid")
(define song (MIDIFile->notelist (midi-file-parse "TeenageMutantNinjaTurtles.mid")))
;; rsound object
;;procedure takes the freq that you want it play at
(define (vibrato-tone2 f)
  (network ()
           [sin <= pulse-wave .7 f ]
           [out = (* 0.1 sin)]))

;; plays midi song by move through the list of notes
(define (test l)
  (signal-play (vibrato-tone2 (midi-note-num->pitch (note-pitch (car l)))))
  (sleep 1)
  (stop)
  (if (empty? (cdr l))
      (stop)
      (test (cdr l))))
;; call to play the song      
(test song)
```
Here is the data in a MIDIFile struct which was made by using midi-readwrite.
```racket
(MIDIFile
 'single
 (TicksPerQuarter 96)
 (list
  (list
   (list 0 (MetaMessage '(sequence/track-name #"untitled")))
   (list 0 (MetaMessage '(text #"Converted from tmnt.cmf by CMF2MID\n")))
   (list 0 (MetaMessage '(time-signature (4 2 24 8))))
   (list 0 (MetaMessage '(key-signature #"\0" major)))
   (list 0 (MetaMessage '(set-tempo 705882)))
   (list 0 (ChannelMessage 'program-change 0 '(33 #f)))
   (list 0 (ChannelMessage 'control-change 0 '(7 100)))
   (list 0 (ChannelMessage 'program-change 0 '(33 #f)))
   (list 0 (ChannelMessage 'program-change 1 '(48 #f)))
   (list 0 (ChannelMessage 'control-change 1 '(7 70)))
   (list 0 (ChannelMessage 'program-change 1 '(48 #f)))
   (list 0 (ChannelMessage 'program-change 2 '(30 #f)))
   (list 0 (ChannelMessage 'control-change 2 '(7 100)))
   (list 0 (ChannelMessage 'program-change 2 '(30 #f)))
   (list 0 (ChannelMessage 'program-change 3 '(0 #f)))
   (list 0 (ChannelMessage 'control-change 3 '(7 120)))
   (list 0 (ChannelMessage 'note-on 1 '(49 100)))
   (list 0 (ChannelMessage 'note-on 1 '(35 100)))
   (list 12 (ChannelMessage 'note-on 1 '(35 0)))
   (list 12 (ChannelMessage 'note-on 1 '(49 0)))
   (list 24 (ChannelMessage 'note-on 1 '(42 100)))
   (list 36 (ChannelMessage 'note-on 1 '(42 0)))
   ```
While I did not get to try out everything Rsound can do, I had fun playing with it and making weird sounds.

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request
[wave]: https://github.com/Jake-The-Human/FP1/blob/master/LFO.ht2.gif

