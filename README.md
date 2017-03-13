## My Library: rsound
My name: **Ryan DeLosh

For my testing and exploring I took a look at the rsound library, this library is used to make sounds within Racket.
It also has the ability to parse through sounds and filter out certain frequencies. I also learned that this library is also capable of adding reverb and other effects to audio. There is a lot to explore within this library. I only touched the surface with a few things that I looked at. I would like to dive deaper into this and see what I can make of it. I managed to play sounds with a sine wave frequency pattern, using a frequence floor, frequency ceiling and also write the output of my randomly generated sound to a 20 second long sound file. 

This code is able to create a steady sound via a sinewave
```
(define sine
  (network ()
           [A5 <= sine-wave 150]
           [A6 <= sine-wave 85]
           [out = (+ A5 A6)]))

(signal-play sine)

(sleep 4)

(stop)

``` 
This code is able to create an oscillating sound while also allowing you to have full control over the volume of the sound.
```
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
```
The following code snippet is another way to create a sine-wave based sound 
```
(define signal
  (network ()
           [a <= sine-wave 560]
           [out = (* 0.1 a)]))
 
(define rs (signal->rsound 44100 signal))
 
(play rs)
(sleep 5)
(stop)
```

There are some more tests I tried for rsound within the racket document. Feel free to go check them out.
I got some help with these tests from the rsound library page on the racket-lang website.
On top of what I tested rsound had the ability to do much more, for example it is also able to display the frequencies of the sound that are being played.

The following is the output of my test file within the play ground for the program.

"played sound"
#<procedure:stream-time>
(rsound #<s16vector> 0 88200 44100)
#<procedure:stream-time>
"played sound"
"played sound"
#<procedure:stream-time>
#<procedure:stream-time>


![rsound code and test](/rsound.png?raw=true "rsound code and test")

