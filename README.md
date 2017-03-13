
## My Library: match-string
My name: Alexander Pilozzi

I primarily explored the match-string library, which allows for pattern matching with strings.
I also explored a bit of the GUI library for the sake of having some other form of output.

The first thing I did was to briefly examine racket's native pattern-matching ability.
```racket
(match '(6 34 6)
  [(list x y x) (list x y)]
  [(list x y z) (list z x y)])
```
which outputs:
```racket
'(6 34)
```
as the input list fits the first pattern.

The match-string features dealt primarily with allowing users to pattern match with the string-append and (list) append functions.
For example, the following code:

```racket
(define foo "this is a test and stuff")
(define test1 "this")
(match foo
  [(string-append pre (== test1) post) post]
  [_ 0])
```
outputs:
```racket
" is a test and stuff"
```
as it recognizes the string as a combination of "this" and " a test and stuff".
"pre" and "post" are both variables that hold the portions of the string before and after the test string.

While using pattern matching to search a given string is possible, it has the quirk of effectively searching from right to left, as:
```racket
(match foo
  [(string-append pre "t" post) pre]
  [_ 0])
```
outputs:
```racket
"this is a test and s"
```
showing that the first "t" seen by this method is the last one in the string.

Use of the "and" and "or" procedures allows for different patterns to be tested in the same line of code; for example:

```racket
(match foo
  [(string-append "this is a "(and x (or "test" "thing")) _..._) x])
```
outputs
```racket
"test"
```
whereas
```racket
(define bar "this is a thing and stuff")
(match bar
 [(string-append "this is a "(and x (or "test" "thing")) _..._) x]
```
outputs
```racket
"thing"
```
as both match the given pattern, but satisfy a different condition of the or statement.
The methods listed for string-append also work for the list append function. The following code:
```racket
(define list1 (list 1 2 3 4 5 6))
(define list2 (list 6 7 8 1 2 3))
(define list3 (list 1 2 3 6 7 8))

(match list1
  [(append (list 1 2 3) x) x])

(match list2
  [(append x (list 1 2 3)) x])

(match list3
  {(append (list 1 2 3) (and x (or (list 4 5 6) (list 6 7 8)))) x})

(match list1
  {(append (list 1 2 3) (and x (or (list 4 5 6) (list 6 7 8)))) x})

(match list1
  [(append _ (list 3 4) _) #t]
  [_ #f])

(match list2
  [(append _ (list 3 4) _) #t]
  [_ #f])
```
outputs:
```racket
'(4 5 6)
'(6 7 8)
'(6 7 8)
'(4 5 6)
#t
#f
```

My final exploration of the string-match libary was to create a function that counted the number of times a given arbitrary string
appeared in a different string. The function is case-sensitive, but allows for all characters and is defined as follows:
```racket
(define (number_of_appearances given toFind)
  (define (string_locater_iter given toFind numFound)
    (match given
      [(string-append  pre (== toFind) post) (string_locater_iter pre toFind (add1 numFound))]
      [_ numFound]))
  (if (or (eq? given "") (eq? toFind "")) 0
      (string_locater_iter given toFind 0)))
```
The if statement is necessary to ensure that using an empty string as either input would not cause an infinite loop.

I then built this function into a little application using the GUI libary. While the input used has no spaces to show they
are not necessary for the process to work, it still functions properly with spacing.

![sample_output](Exploration-output.PNG?raw=true "Sample Output")
