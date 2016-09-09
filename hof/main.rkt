;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (check-temps1(list)) false)
(check-expect (check-temps1 empty) false)
(check-expect (check-temps1(list 5 10 15)) true)
(check-expect (check-temps1(cons 7 (cons 10 (cons 22 empty)))) true)
(check-expect (check-temps1(list 7 10  20 95)) true)
(check-expect (check-temps1(list 4 10  20 95)) false)
(check-expect (check-temps1(list 5 10  20 97)) false)
(check-expect (check-temps1(cons 0 (cons 10 (cons 22 empty)))) false)
(check-expect (check-temps1(cons 15 (cons 100 (cons 10 empty)))) false)

(define (check-temps1 temps)
  (cond
    [(empty? temps) false]
    [else (= (filter (lambda (x) (or (> x 95) (< x 5))) temps)) temps)]))

(check-expect (eliminate-exp 5 empty) empty)
(check-expect (eliminate-exp 5 (cons 1 empty)) (cons 1 empty))
(check-expect (eliminate-exp 5 (list 5 5)) (list 5 5))
(check-expect (eliminate-exp 5 (cons 10 empty)) empty)
(check-expect (eliminate-exp 10 (cons 0 (cons 12 empty))) (cons 0 empty))
(check-expect (eliminate-exp 10 (cons 0 (cons 12 (cons 8 empty)))) (cons 0(cons 8 empty)))


(define (eliminate-exp ua lotp)
  (cond
   [(empty? lotp) empty]
   [else (filter (lambda (x) (>= ua x)) lotp)]))

;;Converts a list of of Fahrenheit measurements to a list of Celsius measurements.
(check-expect (convertFC empty) empty)
(check-expect (convertFC (cons 32 empty))(cons 0 empty))
(check-expect (convertFC (cons 32 (cons 5 empty))) (cons 0 (cons -15 empty)))
(check-expect (convertFC (cons 212(cons 32 (cons 5 empty)))) (cons 100 (cons 0 (cons -15 empty))))

(define (convertFC fahrenheit)
  (cond
  [(empty? fahrenheit) empty]
  [else (map to-celsius fahrenheit)]))

;;converts the first element of a list of number to Fahrenheit
(define (to-celsius fahrenheit)
  (*(- fahrenheit 32) (/ 5 9)))

(check-expect (average-price empty) 0)
(check-expect (average-price (cons 2(cons 2 (cons 2 empty)))) 2)
(check-expect (average-price (cons 1.5 empty)) 1.5)
(check-expect (average-price (cons 1(cons 6 (cons 8 (cons 10 empty))))) 6.25)

(define (average-price prices)
  (cond
   [(empty? prices) 0]
   [else (/ (foldl + 0 prices) (foldl cons 1 prices))]))

(define (flatten l)
  (cond [(empty? l)      null]
        [else            (append (flatten (first l)) (flatten (rest l)))]))