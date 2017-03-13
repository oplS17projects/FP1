#lang racket

(require slideshow)

(slide
 #:title (bt"Exploration (FP1)")
 (t "3010 Organization of Programming Language")
 (t "Final Project p1")
 (t "Shaquill Sonny Chea")
 (t "Date: 03-12-17"))


(slide
 #:title (bt"Slideshow Library")
 (item "For the project I'll be using the Slideshow Library"))

(slide
 #:title (bt"About me")
 (item "I code")
 'next
 (item "But I'm really bad at it")
 'next
 'alts
 (list (list (item (bt"LIKE BAD BAD"))
             'next
             (item "Bad as in I take to long to code bad"))
       (list (item "I'm just bad"))))

 
(slide
 'next
 (t "*When I tell everyone I'm busy and can't hang out")
 'next
 (para #:align 'left
       (bt"That's"))
 'next
 (para #:align 'center
       (bt"Rough"))
 'next
 (para #:align 'right
       (bt"Buddy"))
 )

(slide
 (t "The struggles of being a CS major..."))