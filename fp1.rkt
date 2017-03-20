#lang racket

 (require typed-stack)

;; http://docs.racket-lang.org/typed-stack/index.html

(make-stack 1 )


(define sA (make-stack 1))

(push! sA 2)

(stack-length sA)

(push! sA 3 )


(stack->list sA)

(top sA)

(push*! sA 7 6 5 4)
;; right most value is the lowest position in the stack.

;;(push*! sA '(10 9 8))
(stack->list sA)
;; print function
(define (p x) (stack->list x))

(p (pop sA) )



