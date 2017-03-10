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

Once I got the synth sounds to work I want to see if I chould hook up a MIDI file and get a synth to play a song. All I end up getting to work was a bunch of pitches to play evenly space out that did not resemble the song at all. I also need to get midi-readwrite lib to get the MIDI notes out of the file.

```racket
#lang racket
(require rsound)
(require rsound/single-cycle)
(require midi-readwrite)

(define sw (list 43 50 48 59 57 48 59 57 50))
;; this gives you all the MIDI info
;;(midi-file-parse "TeenageMutantNinjaTurtles.mid")
(define a (MIDIFile->notelist (midi-file-parse "TeenageMutantNinjaTurtles.mid")))
(define (vibrato-tone2 f)
  (network ()

           [sin <= pulse-wave .7 f ]
           [out = (* 0.1 sin)]))


(define (test l)
  (signal-play (vibrato-tone2 (midi-note-num->pitch (note-pitch (car l)))))
  (sleep 1)
  (stop)
  (if (empty? (cdr l))
      (stop)
      (test (cdr l))))
      
(test a)

```
Here is the data that is parsed out of the midi file. Using that lib.
```
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

Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. Yes, you need at least one image (output, diagrams). Images must be embedded into this md file. We should not have to click a link to see it. This is github, handling files is awesome and easy!

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule].

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

