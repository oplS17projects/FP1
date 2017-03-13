# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017


## My Library: simple-qr
My name: Steve Warren

I initially looked into the TCP library, but figured it would be best until after we cover OOP in Racket.  The simple-qr library was selected at random.  While its possible that it could be used in the final project, I currently have no plans.

In order to use simple-qr, it must installed using the raco package manager.
```
raco pkg install simple-qr
```

The code:
```racket
#lang racket
(require simple-qr)

(define (qr url filename)
  (qr-code url (string-append filename ".png")))
```

The resulting output:
![Duck Duck Go QR Code](ddg.png)
