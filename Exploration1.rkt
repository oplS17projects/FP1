#lang racket
(require slideshow)



(slide
 #:title (bt "Umass Lowell -- CS Department")
 #:layout 'auto
 #:gap-size (* gap-size 2)
 (t "Name: Duy Truong")
 (t "Term : Spring 2017")
 (t "Class : Organization of Programming Languages")
 (t "Final Project Exploration 1")
 (t "Purpose: Learn new Library"))



(slide
 #:gap-size (* gap-size 2)
 (para #:align 'left
       (bit "Libary Name : Sliceshow")
       )
 'next
 (para #:align 'left
       "1. Creating Slides Presentation")
 'next
 (para #:align 'left
       "2. Making Slides")
 'next
 (para #:align 'left
       "3. Typesetting Racket Code in Slideshow")
 'next)

(slide
  #:gap-size (* gap-size 2)
 (para #:align 'left
       (bit "Slide Basics")
       )
 'next
 (para #:align 'left
       "Adding library")
 'next
 (para #:align 'left
       "1. #lang slideshow")
 'next
 (para #:align 'left
       "2. #lang Racket (require slideshow)"))