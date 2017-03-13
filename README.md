# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

##My Library(Slide-show)
Going through the numerious libraries available to me in the racket language, I decided to go with using the Slide-show library. After reading the sample code, it was simple enough to mess around with. 
This library allows the ability to simulate a slide-show while using racket. A fairly simple project, I went through each of the index and wanted to display the simple power of a slide-show. I knew that
later on we will have to do a presentation so utilizing this specific library allowed me to prepare for what is to come later on in the course.

#Code
```
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
```
#Output
There are going to be a total of five slides that will be generated from the code.

Slide 1
![slide_1 image](/slide_1.png?raw=true "output")
Slide 2
![slide_2 image](/slide_2.png?raw=true "output")
Slide 3
![slide_3 image](/slide_3.png?raw=true "output")
Slide 4
![slide_4 image](/slide_4.png?raw=true "output")
Slide 5
![slide_5 image](/slide_5.png?raw=true "output")

#Closing Thought's
Overall, I'm hoping to use the Slide-show library for the rest of the project. As mention before, it will be good practice to prepare for the presentation portion of the class.







