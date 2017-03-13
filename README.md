```
#lang racket
;Student: Leon Kang
;Email: leon_kang@student.uml.edu
;FP1
(require math/array)
;build an array of natural numbers [0, 1, 2, 3, ..., array-end] until array-end then
;apply the array-map to this array with the argument function
(define (my-array array-end func)
  (define (my-array-helper count)
     (if(> count array-end)
        '()
        (cons count (my-array-helper (+ count 1)))
      )
     )
  (array-map func (list->array (my-array-helper 0)))
     
  )
```

## My Library: math/array
My name: Leon Kang

I first played around with the arrays in the math/array library then I created a function that will take in
an array-endpoint and a function that it will apply to that array.
Some demonstration of what my function did:
> (my-array 10 (lambda (n) (* 2 n)))
(array #[0 2 4 6 8 10 12 14 16 18 20])
> (my-array 10 (lambda (n) (* 3 n)))
(array #[0 3 6 9 12 15 18 21 24 27 30])
> 
This array can now be used with other library functions included in the math/array library

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work

The narrative itself should be no longer than 350 words. 

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

