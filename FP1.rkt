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
  