# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: RackUnit
My name: **Mike Zurawski**

- I figured it would be cool to see how unit testing works in Racket. So I checked out RackUnit! Similiar to other testing frameworks, RackUnit has the ability to create 'test suites'
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
- Output
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
- RackUnit even provides a GUI for easy viewing of tests. 
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

![image](/gui.png?raw=true "image")



## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

[pull-request]: https://help.github.com/articles/creating-a-pull-request

