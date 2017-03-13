#lang racket

(require racket/match)
(require match-string)
(require racket/gui/base)


(match '(6 34 6)
  [(list x y x) (list x y)]
  [(list x y z) (list z x y)])


(define foo "this is a test and stuff")
(define bar "this is a thing and stuff")
(define test1 "this")
(define test2 "and")

(define list1 (list 1 2 3 4 5 6))
(define list2 (list 6 7 8 1 2 3))
(define list3 (list 1 2 3 6 7 8))

(match foo
  [(string-append pre (== test1) post) post]
  [_ 0])

(match foo
  [(string-append pre (== test2) post) pre]
  [_ 0])

(match foo
  [(string-append pre "t" post) pre]
  [_ 0])

(match foo
  [(string-append "this is a " (or "test " "thing ") post) #t]
  [_ #f])

(match bar
  [(string-append "this is a " (or "test " "thing ") post) #t]
  [_ #f])

(match foo
  [(string-append "this is a "(and x (or "test" "thing")) _..._) x])
(match bar
  [(string-append "this is a "(and x (or "test" "thing")) _..._) x])

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
  [(append _ (list 3 4) _) #t])

(define (number_of_appearances given toFind)
  (define (string_locater_iter given toFind numFound)
    (match given
      [(string-append  pre (== toFind) post) (string_locater_iter pre toFind (add1 numFound))]
      [_ numFound]))
  (if (or (eq? given "") (eq? toFind "")) 0
      (string_locater_iter given toFind 0)))


(define (count_callback count_button event)
         (send output set-value
               (number->string (number_of_appearances (send input1 get-value)
                                                      (send input2 get-value)))))

(define (clear_callback clear_button event)
         (send (send input1 get-editor) erase)
          (send (send input2 get-editor) erase)
          (send (send output get-editor) erase))

(define frame (new frame% [label "String Counter"][width 600][height 200]))

(define input1 (new text-field% [label "Main string:  "] [parent frame]))

(define input2 (new text-field% [label "Target string:"] [parent frame]))

(define output (new text-field% [label "Number of targets:"] [parent frame] [enabled #f]))

(define button (new button% [label "Count"][parent frame][callback count_callback]
                   [min-width 400][min-height 30]))

(define button2 (new button% [label "Clear Fields"][parent frame][callback clear_callback]
                     [min-width 400][min-height 30]))

(send frame show #t)


