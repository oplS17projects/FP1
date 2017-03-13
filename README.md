## My Library: Math
My name: Marittya "Mike" Keu

I choose to use the Racket Math library . As stated from the website, the library provide "functions and data structures that are useful for working with numbers and a collection of numbers". There are some interesting functions you can use. The library works with constants and elementary functions, special functions, matrices, arrays, probablities, and other mathematical fucntions.

Some functions I used include several random number generators such as random-integer which takes in two numbers and generate a single random number within the range of the two number such as 
```
(define (randNum x)
  (random-integer 0 x))

```
Another interesting function is the int-to-string and the string-to-int function as such:
```
> (string->number "21321")
21321
> (number->string 112321)
"112321"
> 
```
Something I found very interesting is the use of matrices. There are some simple matrix computations such as addition, subtraction, and multiplication. 
```
(define A (matrix ([1 2]
                   [4 5])))
(define B (matrix ([2 1]
                   [2 5])))
REPL---------
> (matrix+ A B)
#<array '#(2 2) #[3 3 6 10]>
> 
(matrix- A B)
#<array '#(2 2) #[-1 1 2 0]>
> (matrix* A B)
#<array '#(2 2) #[6 11 18 29]>
> 
```


---------------------OUTPUT IMAGE---------------------

![alt tag](https://github.com/MarittyaKeu/FP1/blob/master/Output.png)




