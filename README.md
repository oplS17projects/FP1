# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

#Part 1: Get github
If you don't have a github account, go get one. https://github.com/
This whole assignment will be done and submitted via github, and you're already here!
 
#Part 2: Try a Library
In this exercise, you will play with at least one library provided by the Racket developers. You will have the opportunity to explore another library later.

Please choose libraries that you think you might be interested in using in your final project.

Start off at the Racket home page, http://racket-lang.org/, and then click on the Documentation link, taking you here: http://docs.racket-lang.org/.
 
There are lots of libraries. Play with one.
 
Your job is to explore one library and write up your results. Load the library and write some code to drive it around.
For example, maybe you are interested in retrieving data from the web. If we look at the net/url library, we will find functions for creating URLs, issuing HTTP GET commands, and displaying the results. Here is a little bit of code for driving around a few of the functions in this library:
```racket
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```
Notice that `(require net/url)` is all you need to put in your buffer in order to load the library and start using it.
This above is a trivial example; to complete this for the purposes of this assignment (if you go down the path of pulling HTTP requests), you should use the parsing libraries to parse the HTML, JSON, or XML that is returned.

### The following libraries are not allowed for project explorations:
* games/cards
* racket/gui
* racket/draw 

You can still use these in your project, but you must explore different libraries for this assignment.

#Part 3: Write your Report
Write your report right in this file. Instructions are below. Delete the instructions when you are done. Also delete all my explanation (this stuff), as I've already read it.

You are allowed to change/delete anything in this file to make it into your report. It will be public, FYI.

This file is formatted with the [**markdown** language][markdown], so take a glance at how that works.

This file IS your report for the assignment, including code and your story.

Code is super easy in markdown, which you can easily do inline `(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: racket/file and binary-class/mp3
My name: Benjamin Mourad

I am passionate about music, so I decided that the `binary-class/mp3` module
would be interesting to play with.

With help from `racket/file`, we search a specified directory recursively
using `find-files`, which returns a `(listof path?)`. We only care about
MP3 files, so we have our predicate account for this.
```
(define mypath (string->path "/home/delysid/Music"))
(define (mypred p) (string-suffix? (path->string p) ".mp3"))

(define myfiles (find-files mypred mypath))
```
Using this list of file paths, we make a list of id3 objects. This structure
contains tags for a given MP3 file, which consists of artist, album, year, genre,
song, and so on. The length of each "song" is not included.
```
(define (get-ids lst)
  (if (null? lst)
      nil
      (cons (read-id3 (car lst))
            (get-ids (cdr lst)))))

(define myids (get-ids myfiles))
```
From this, I had it output a formatted list of all the songs from a
specific album by a specific artist in string format.
```
(define (get-album ids artistname albumname)
  (define newids (filter (lambda (a) (and (string-ci=? (album a) albumname)
                                          (string-ci=? (artist a) artistname)))
                         ids))
  (define (make-list ids)
    (if (null? ids)
        nil
        (cons (string-append
               "(" (year (car ids)) ") " (artist (car ids)) " [" (album (car ids)) "] - " (song (car ids)))
              (make-list (cdr ids)))))
  (make-list newids))
```

Resulting output:

![test image](/testimage.png?raw=true "test image")

