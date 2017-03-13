## My Library: Math library
My name: Jennifer Green

My original plan was to use the library "mode-lambda: the best 2D graphics of the 90s, today!" mostly because of the name (and also the documentary was written by Professor McCarthy).  However, I decided that it was too close to the racket/draw library, and so went with the math library instead.  I chose this library because being able to solve complex math problems without having to write the underlying structures yourself is incredibly useful.  I decided to screw around with matrixes and stats a little bit.  I would have liked to do more with statistics, I feel like what I have is so simple.  

I'm not sure why this image comes out sideways here.  It displays properly on my screen.  Regardless, here is my code.  

![code_sample](/code_sample.jpg?raw=true "sample of code")

Because my code is so short, here it is in its entirety.  
```
(require math)
```
Since I am using functions from two different sub-libraries of math, I chose to include the entire library rather than listing them individually.  

```
(define (one-matrix x)
  (make-matrix x x 1) )
```
Creates an x by x matrix entirely composed of 1's.  

```
(define (my-matrix)
  (one-matrix 5) )
```
Creates a 5x5 matrix of 1's using the one-matrix code.

```
(define (add-identity x)
  (matrix+ x (identity-matrix 5)) )
```
Adds a 5x5 identity matrix to another matrix, x.  In hindsight, this would be better if I used the length of the array x to set the size for the identity matrix.  That way it would work with more than 5x5 matrices.  

```
(define (scale-my-matrix x)
  (matrix-scale (my-matrix) x) )
```
Scales my-matrix by x.

```
(define (find-mean lst)
  (mean lst) )
(define (find-stddev lst)
  (stddev lst) )
```
These will let you find the mean and standard deviation of a list.  
