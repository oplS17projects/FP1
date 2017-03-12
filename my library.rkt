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