#lang slideshow

(define (slide-n n)
  ;; slide 1
  (slide
   #:name "Title Slide"
   (colorize(it "Hello World!")"red")
   (size-in-pixels
    (bitmap (collection-file-path "PLT-206.png" "icons")))
   (colorize (bt "Welcome to OPL") "blue"))
  
  ;; slide 2
  (slide
   #:title "Welcome to OPL!"
   'next
   (t "Meeting 1: Wed Jan 18")
   'next
   (item "Why OPL? by Prof. Fred")
   'next
   'alts
   (list (list (item "Will you ever write a Scheme expression when this class is over? ")
               'next
               (item "Why interpreter?")
               'next
               (item "What is a domain specific language?")
               'next
               (item "What is functional programming and why does it matter? ")))
   'next
   (t (number->string n))) 
  
  ;; slide 3
  (slide
   #:name "PS0: Hello World with Racket"
   (colorize (bt"PS0: Hello World with Racket") "red")
   (colorize (it "Exercise 1: procedure to square its argument") "red")
   (colorize (it "make sure to use the lambda formulation") "red")
   (colorize (t "(define square") "red")
   (colorize (t "\t\t(lambda (x) (* x x)))") "red")
   (colorize (t "Ex. (square 5) is 25 ") "red")
   (t "\n\n")
   (colorize (t (number->string (add1 n))) "red")) 

  ;; slide 4
  (slide
   #:name "Last Slide"
   (colorize (it "Press Esc to exit full screen mode") "blue"))
  )

(slide-n 1)
