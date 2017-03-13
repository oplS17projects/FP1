#lang racket
(require data/gvector)

;; Take a gvec, returns a new gvec with each element
;; scaled by 10.
(define (scale-vec gvec)
  (scale-helper gvec (make-gvector)))

;; gvector operations (such as set, add, remove, etc.)
;; return 'void', so in order to modify a gvector, I have
;; to update the value seperately and then put it in the function
(define (scale-helper gvec new)
  (if (equal? gvec (make-gvector))
      new
      (begin (gvector-add! new (* 10 (gvector-ref gvec 0)))
             (gvector-remove! gvec 0)
             (scale-helper gvec new))))

;; Taking the above, generalizing it into a map function
(define (gvector-map gvec op num)
  (map-helper gvec (make-gvector) op num))

;; Simple, just switching times and 10 to operation and number
(define (map-helper gvec new op num)
  (if (equal? gvec (make-gvector))
      new
      (begin (gvector-add! new (op num (gvector-ref gvec 0)))
             (gvector-remove! gvec 0)
             (map-helper gvec new op num))))

;; This empties the original vector. Can I do this without that?

;; Version 2 of the map function, added a count parameter
(define (gvector-map2 gvec op num)
  (map-helper2 gvec (make-gvector) op num 0))

;; I can even save a line since I don't need to remove anymore!
(define (map-helper2 gvec new op num count)
  (if (equal? count (gvector-count gvec))
      new
      (begin (gvector-add! new (op num (gvector-ref gvec count)))
             (map-helper2 gvec new op num (+ count 1)))))

;; In hindsight, I should have done this from the beginning.
;; I just remembered, though, that map replaces the original.
;; Also, I need to make it return void so it fits with the
;; built in vector functions. How many lines does that take to change?

;; Version 3, no more new vector in the helper function.
(define (gvector-map3 gvec op num)
  (map-helper3 gvec op num 0))

(define (map-helper3 gvec op num count)
  (if (equal? count (gvector-count gvec))
      (void)
      (begin (gvector-set! gvec count (op num (gvector-ref gvec count)))
             (map-helper3 gvec op num (+ count 1)))))

;; It now returns the right value, and save the changes to
;; the right location. My map function is complete.