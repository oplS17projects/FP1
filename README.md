
## My Library: RSound
My name: David DaCosta

I played around with the rsound library and tried to create multiple sounds using the pstreams and rsound constructors. It didn't go so well but I got it to produce a warpy sound. I thought I'd be able to create multiple sounds and set them to bindings but instead I created a stream that holds some of the sounds in it and then plays them. The documentation was terrible, I really wish there was more example code. However, this video on abstraction was really cool: https://www.youtube.com/watch?v=DkIVzHNjNEA. So basically, I created a test pstream and set the buffer time to .2 seconds just to play with the longevity as seen here. I played around with a few values, but they can only fange from .1 to 1 second.
```
(define teststream (make-pstream #:buffer-time .2))
```

I had to define a 16bitvector from the ffi/vector library to store the numbers that will make up the sound I'll be storing in my streaem.
```
(define myvec (make-s16vector 10))
```
Then I used the Rsound constructor to build the sound, set to 44100 frame rate and loading in sounds from 1 to the 5 in the vector. I don't know why but I was having issues loading any more than that. 
```
(define testsound ( rsound myvec 1 5 44100  ))
(s16vector 32660);1
(s16vector 32368);2
(s16vector 29768);3
(s16vector 22768);4
(s16vector 22768);5
```
Then here, all I'm doing is queue-ing the corresponding vector positions of the testsound into the teststream to be played.
```
(pstream-queue teststream testsound 1)
(pstream-queue teststream testsound 2)
(pstream-queue teststream testsound 3)

(pstream-play teststream testsound)
```
You can see the output of the code running here. Unfortunately, I can't display sound!
![output](/output.png?raw=true "output")
