#Part 3: Write your Report
Write your report right in this file. Instructions are below. Delete the instructions when you are done. Also delete all my explanation (this stuff), as I've already read it.

You are allowed to change/delete anything in this file to make it into your report. It will be public, FYI.

This file is formatted with the [**markdown** language][markdown], so take a glance at how that works.

This file IS your report for the assignment, including code and your story.

Code is super easy in markdown, which you can easily do inline `(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

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

