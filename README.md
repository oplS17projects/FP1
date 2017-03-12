# Final Project Assignment 1: Exploration (FP1)

## My Library: [RSound](https://docs.racket-lang.org/rsound/)
My name: Doug Salvati

First, I created some functions to create notes.  The user specifies a note and octave to `make-note` and the function calculates the frequency of this note.
From here, the user can play the note using `seeAndHear`.  This will also use the calculated frequency to visualize the note using the `plot` library.  Here is a sample interactive session:

![sample](https://github.com/doug-salvati/FP1/blob/master/output.png)

The function also plays the note using the `play` function from `rsound`.  To do this, it first uses the `create-tone` utility to create an `rsound` object:
```
;; create note at 10% volume with duration of 50000
(play (make-tone (pitch n) .1 50000))
```

The biggest compontent is to create a song and play it.  A song is simply created as a list of notes:
```
(define (make-song . notes) notes)
```
Then, a tail-recursive function is used to play the song.  The function makes use of the `rsound` streams, traversing the list and enqueuing each to the stream:
```
(define (playSong s)
  (define stream (make-pstream))
  (define (iter s cnt)
    (if (null? s)
        "everything is queued up!"
        (begin (pstream-queue stream (make-tone (pitch (car s)) .1 20000) cnt)
               (iter (cdr s) (+ cnt 21000)))))
  (iter s 0))
  ```

It increments a count with an interval slightly longer than the duration of the note so that the notes play with a small pause between each one.

The `experiment.rkt` file contains a sample song which plays when the program is run.
