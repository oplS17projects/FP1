## My Library: 2htdp/image and picturing-programs
My name: Chuong Vu

https://docs.racket-lang.org/teachpack/2htdpimage.html
http://docs.racket-lang.org/picturing-programs/
I first want to play around with image which let me convert normal photo picture and convert it to cartoon that based on the RGB value. Here the most basic example how the library works.
```
#lang racket

;; for bitmap
(require 2htdp/image)
; for get-pixel-color
(require picturing-programs)
;; load the image
(define imgtest (bitmap "test.png"))
;; getpixel from image at x and y coordinates
(get-pixel-color 1 1 imgtest)
```

After I got the library working, I started to read some example from the racket website and play around with it to get the idea how it read pixel by pixel and what it return. I choice a small photo that I took it from my camera and tried to load in racket and generate a list from racket. Here is the sample code that I was playing around with.
```
#lang racket

;; for bitmap
(require 2htdp/image)
; for get-pixel-color
(require picturing-programs)

;; read the image
(define imgtest (bitmap "test.png"))

;; get image height
(define img-height (image-height imgtest))

;; get image width
(define img-width (image-width imgtest))

;; example from racket website
(define (near-pixel x y)
           (get-pixel-color (+ x -3 (random 7))
                            (+ y -3 (random 7))
                            imgtest))
(define fuzz
    (build-image img-width img-height near-pixel))
                          
;; read pixel-by-pixel to list
;; sample picture height = 561 and width = 460
;; (get-pixel-color x y pic) where x = width and y = height
;; color return red/green/blue/alpha
(define pixlist
  (list (list (get-pixel-color 1 1 imgtest) (get-pixel-color 1 2 imgtest) (get-pixel-color 1 3 imgtest) (get-pixel-color 1 4 imgtest))
        (list (get-pixel-color 300 148 imgtest) (get-pixel-color 300 149 imgtest) (get-pixel-color 300 150 imgtest))
        ))

;; from pixel to bitmap
(scale 30 (color-list->bitmap (car pixlist) 4 1))
(scale 30 (color-list->bitmap (cadr pixlist) 3 1))
(define colortest (make-color 150 147 146))

```


## Example Picture


This is the sample output. But not what I really looking for. The image still not look like the cartoon so I will do more research on it.


## 

I still got a trouble with trying to get and change the value red\green\blue from RGB `(color 150 147 146 255)`. There are a method that create an object `make-object color%` from racket but I still not sure how to use it and what is the best way to implementation the object.



