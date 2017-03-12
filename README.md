## My Library: RackUnit
My name: Jooseppi Luna

For my library exploration I chose to explore the RackUnit library, a library that allows you to write unit tests in Racket.  It seemed like a fun library, (I enjoy unit testing), and it also looks like something that could be really useful for a larger project where a lot of code is being written and edited.

For the first few tests, I wrote correct and incorrect versions of two basic accumulations:

''' racket
(define (good-list-adder l)
  (foldr + 0 l))

(define (bad-list-adder l)
  (foldr + 1 l))

(define (good-list-counter l)
  (foldr (lambda (v p)
           (+ p 1))
         0
         l))

(define (bad-list-counter l)
  (foldr (lambda (v p)
           (+ p 1))
         1
         l))
'''
