# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017



This file IS your report for the assignment, including code and your story.

Code is super easy in markdown, which you can easily do inline `(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: rackUnit
My name: **Mike Zurawski**

Write what you did!
Remember that this report must include:

* a narrative of what you did
Having used other testing frameworks, I figured it would be cool to see how unit testing works in Racket.
So I checked out RackUnit!
* highlights of code that you wrote, with explanation
Similiar to other testing frameworks, RackUnit has the ability to create 'test suites'
```
;; Test Suites can be created for even more grouping. Can contain multiple test-cases.
;; run-tests can be used for test cases or suites for more/less verbose info
(run-tests
 (test-suite 
  "Suite 1"
  (test-case
   "Test case 1"
   (check-eq? 'a 'a))
  (test-case
   "Test case 2"
   (check-eq? 'a 'a))) 'verbose)
```
* output from your code demonstrating what it produced
```
Group A - Test x feature
FAILURE
actual:     a
expected:   b
name:       check-eq?
location:   (~/fp1/test-file.rkt> 25 2 815 17)
expression: (check-eq? 'a 'b)

2 success(es) 0 failure(s) 0 error(s) 2 test(s) run
```
* at least one diagram or figure showing your work
RackUnit even provides a GUI for easy viewing of tests. 
```
;; Neat GUI feature if you want a more visual representation of test results
(test/gui  
 (test-suite 
  "Suite 1"
  (test-case
   "Test case 1"
   (check-eq? 'a 'a))
  (test-case
   "Test case 2"
   (check-eq? 'a 'b))) #:wait? #f)
```

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

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

