```
#lang racket
(require pict images/icons/control images/icons/style images/icons/symbol)


(pict->bitmap
   (cc-superimpose
    (bitmap (record-icon #:color "blue" #:height 50
                         #:material glass-icon-material))
    (bitmap (lambda-icon #:height 45
                       #:material glass-icon-material))))

(pict->bitmap
   (cc-superimpose
    (bitmap (record-icon #:color "skyblue" #:height 96
                         #:material glass-icon-material))
    (bitmap (step-icon #:color light-metal-icon-color #:height 48
                       #:material metal-icon-material))
    (bitmap (x-icon #:height 32))))
```
## My Library: (images/icons)
My name: Zixin Wang

I saw the example from the library and the API so I can modify the color, size and material etc.
I draw a lambda symbol and a blue record icon and modify them try to make a DrRacket Logo. Then I want to see how the order of bitmap
will make difference on the order of drawing.

![Own image](/testimage.png?raw=true "test image")
