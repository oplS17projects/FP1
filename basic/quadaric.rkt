;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quadaric) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Take in 3 coffiecnets a, b, and c and detimines if it is degenerate equation or not
;;if it is, it will determine if the equation has one, two, or no sultions
;;-1 is returned is there was invalid input

(check-expect (what-kind "foo" 1 1) -1)
(check-expect (what-kind +inf.0 1 1) -1)
(check-expect (what-kind 1 true 1) -1)
(check-expect (what-kind 1 +inf.0 1) -1)
(check-expect (what-kind 1 1 (make-posn 1 1)) -1)
(check-expect (what-kind 1 1 -inf.0) -1)
(check-expect (what-kind 0 1 1) 'degenerate)
(check-expect (what-kind 1 0 1) 'none)
(check-expect (what-kind 1 -2 1) 'one)
(check-expect (what-kind 1 2 -3) 'two)
(check-expect (what-kind 0 -1 2.3) 'degenerate)
(check-expect (what-kind 1 2 0) 'two)
(check-expect (what-kind 1 4 4) 'one)
(check-expect (what-kind 1 4 5) 'none)
(check-expect (what-kind 1 0 -5) 'two)

(define (what-kind a b c)
  (if (and (rational? a) (rational? b) (rational? c))
      (if (= a 0) 'degenerate
          (if (< (-(* b b)(* (* 4 a) c)) 0) 'none
               (if (= (-(* b b)(* (* 4 a) c)) 0)  'one
                   (if (> (-(* b b)(* (* 4 a) c)) 0) 'two -1))))-1))