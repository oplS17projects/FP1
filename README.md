## My Library: math/array
My name: Leon Kang

I first played around with the arrays in the math/array library then I created a function that will take in
an numElements and a function that it will apply to that array.
Some demonstration of what my function did:

> (my-array 10 (lambda (n) (* 3 n)))

(array #[0 3 6 9 12 15 18 21 24 27])

> (my-array 10 (lambda (n) (* 2 n)))

(array #[0 2 4 6 8 10 12 14 16 18])

This array can now be used with other library functions included in the math/array library

```
;my-array takes a number of elements to be in the math 
;array and a function to be applied to each element in the array
(define (my-array numElements func)

;my-array-helper creates a list with the number of elements starting at 0
  (define (my-array-helper count)
  
  ; the final call in the body which uses array-map built 
  ;in function in the library, list->array to convert
  ;a list to a math array and then finally we get the 
  ;array with the function applied to each element
  (array-map func (list->array (my-array-helper 0)))

```

![FP1](/FP1.jpg?raw=true "FP1")


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

