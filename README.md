# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

```racket
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: slideshow
My name:Emmanuel Rosario

After searching online at https://docs.racket-lang.org for a new racket library. The library I have decided to go with is the Slide show library. This library can be found at https://docs.racket-lang.org/slideshow/Creating_Slide_Presentations.html#%28od-path._slideshow%2Fstart%29. In addition, this library was super easy to understand.  After playing with this library, I could say that the output looks just like if I was using Microsoft PowerPoint or  the Ubutu LibreOffice Impress. 

I first got my hands on the slide Basics from https://docs.racket-lang.org/slideshow/Creating_Slide_Presentations.html#%28mod-path._slideshow%2Fstart%29. According to the website the main  Slideshow function is slide. The #:title creates the slide title with the given text. The t function Creates the given text using the default font and style. If you want to add more slides to the presentation, you must use create a new slide function.  After days and hours spending using this library, I realized that I  had use only the tip of  iceberg. I’m going to be spending more time using this library in order for me to fully understand it over the Spring break. 

The following code is a basic sample from the website.
```racket
#lang slide show   

(slide 
 #:title "How to Say Hello"  
(t "Hello World!")) 
```
I began experimenting with the library by creating slides how with include four  slides.  My slide show presentation is about are first  day of class and are first assignment ps0. 

The following code creates the first slide creates a function that keeps track of the slide number and then creates the first slide. Second, #:name is a function that names slide.  Third, colorize is function that takes a string and colored it a red color. Also, it is the italic font style. Fourth, bitmap get the image and put it on slide. For last, it those the same thing as the second thing, but in a bold font style and with the blue color.
```
(define (slide-n n)
  ;; slide 1
  (slide
   #:name "Title Slide"
   (colorize(it "Hello World!") "red")
   (bitmap (collection-file-path "PLT-206.png" "icons"))
   (colorize (bt "Welcome to OPL")  "blue"))
 ```
I learned that slide show can use a list or lists. Also, what is a presentation with out a side effects.  Side effect function can be used by using the fallowing ‘next and ‘alts. According to https://docs.racket-lang.org/slideshow/Creating_Slide_Presentations.html#%28mod-path._slideshow%2Fstart%29, 'next! element is like 'next, except that it is preserved when condensing.'alts~ element is like 'alts, except that it is not preserved when condensing.
```
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
```

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule].

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

