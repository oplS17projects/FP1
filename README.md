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

Write what you did!
Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work
I saw the example from the library and the API so I can modify the color, size and material etc. I draw a lambda symbol and a blue record icon and modify them try to make a DrRacket Logo. Then I want to see how the order of bitmap will make difference on the order of drawing.
You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")
