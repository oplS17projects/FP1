## My Library: RSound
My name: Samuel Toups


I decided I wanted to toy around with procedurally generated sound, so after having issues with the libopenal-racket library, I decided to use RSound. I got familiar with generating a sine wave tone, then tried to translate a procedure from c to racket, but I couldn't get that to work, so I experimented with creating my own procedure.

The RSound library seems to have some stability issues, or the 

I don't know what images I could include, as the primary output of my code is sound.

```
(define (shift-freq i)
  (+ 400 (modulo (round (* 10 (/ (+
                                  (* 10 (modulo i 3))
                                  (* 10 (modulo (modulo i 7) (+ 1 (modulo i 3))))
                                  (* 10 (modulo (modulo i 13) (+ 1 (modulo i 7))))
                                  (* 10 (modulo (modulo i 19) (+ 1 (modulo i 13))))
                                  ) 4))) 256)))


(while #t (set! FREQUENCY (shift-freq i)) (set! i (+ i 1)) (println i) (println FREQUENCY) (pstream-queue shift-stream (build-sound FRAME-RATE sine-tone) (pstream-current-frame shift-stream)) (sleep 1))
```




![Screenshot of program output](/Screenshot_2017-03-12_22-15-30.png?raw=true "test image")

Right now I have my code printing out a count and the frequency of the sound being played.
