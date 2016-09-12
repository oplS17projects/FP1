;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (check-temps1(list)) empty)
(check-expect (check-temps1 empty) empty)
(check-expect (check-temps1(list 5)) true)
(check-expect (check-temps1(list 95)) true)
(check-expect (check-temps1(list 5 10 15)) true)
(check-expect (check-temps1(cons 7 (cons 10 (cons 22 empty)))) true)
(check-expect (check-temps1(list 7 10  20 95)) true)
(check-expect (check-temps1(list 4)) false)
(check-expect (check-temps1(list 100)) false)
(check-expect (check-temps1(list 4 10  20 95)) false)
(check-expect (check-temps1(list 4 3 95)) false)
(check-expect (check-temps1(list 4 3 97)) false)
(check-expect (check-temps1(list 5 10  20 97)) false)
(check-expect (check-temps1(cons 0 (cons 10 (cons 22 empty)))) false)
(check-expect (check-temps1(cons 15 (cons 100 (cons 10 empty)))) false)

;;Takes a list of tempurates and checks is all the tempuratures are bettewen 9 to 95 inclusive
;;returns true if they are false otherwise
(define (check-temps1 temps)
  (cond
    [(empty? temps) null]
    [else (equal? temps (filter (lambda (x) (and (>= x 5) (<= x 95))) temps))]))

(check-expect (check-temps(list) 10 10) empty)
(check-expect (check-temps empty 10 10) empty)
(check-expect (check-temps (list 5) 5 15) true)
(check-expect (check-temps (list 15) 5 15) true)
(check-expect (check-temps (list 4) 5 15) false)
(check-expect (check-temps (list 16) 5 15) false)
(check-expect (check-temps (list 5 10 15) 5 15) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 6 30) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 5 95 ) true)
(check-expect (check-temps (list 7 10  20 95) 7 100) true)
(check-expect (check-temps (list 4 5  20 95) 10 100) false)
(check-expect (check-temps (list 5 200  20 97) 5 90) false)
(check-expect (check-temps (cons -2 (cons 10 (cons 22 empty))) 0 15) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 15 80) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15)  false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 85 80)  false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15)  false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 0  0) false)
(check-expect (check-temps (cons 5 (cons 5 (cons 5 empty))) 5  5) true)
(check-expect (check-temps (list 10) 10  10) true)
(check-expect (check-temps (list 11) 10  10) false)

(define (check-temps temps low high)
  (cond
    [(> low high) false]
    [(empty? temps) null]
    [else (equal? temps (filter (lambda (x) (and (>= x low) (<= x high))) temps))]))


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
   [else (/ (foldl + 0 prices) (length prices))]))


(check-expect (flatten (list (list 1 2) (list 3 4 5) (list 6)))(list 1 2 3 4 5 6))
(check-expect (flatten (list (list 1 2 3 4))) (list 1 2 3 4))
(check-expect (flatten empty) empty)


(check-expect ((compose-func square double) 2) 16)

(define (compose-func after before)
  (lambda (x) (after (before x))))

(define (double it)
 (+ it it))

(define (square it)
 (* it it))

((compose-func square double) 2)

(define (flatten li)
  (cond
    [(empty? li) empty]
    [(not (list? li)) (list li)]
    [else (append (flatten (first li)) (flatten (rest li)))]))

(check-expect (flatten-foldr (list (list 1 2) (list 3 4 5) (list 6)))(list 1 2 3 4 5 6))
(check-expect (flatten-foldr (list (list 1) (list 1))(list 1 1))
(check-expect (flatten-foldr (list (list 1 2 3 4))) (list 1 2 3 4))
(check-expect (flatten-foldr empty) empty)

(define (flatten-foldr li)
  (cond
    [(empty? li) empty]
    [else (foldr (lambda (x y)(append x y)) '() li)]))

(define (bucket li)
  (cond
    [(empty? li) empty]
    [else (foldr (lambda (x y)
            (cond
              [(empty? y) empty]
              [(= x y) (cons x empty)]
              [else empty])) '() li)]))

(bucket (list 1 1))

(define-struct unknown ())
(define-struct person (name birthyear eyecolor father mother))

(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))) (make-person "Robl" 1994 'blue (make-unknown)(make-unknown)))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown)))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-person "Rob" 1994 'blue (make-unknown)(make-unknown)))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-person "Robl" 1994 'blue (make-unknown)(make-unknown))))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Rob" 1994 'blue (make-unknown)(make-unknown)))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Robl" 1994 'blue (make-unknown)(make-unknown))))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Rob" 1994 'blue (make-unknown)(make-person "Rob" 1994 'blue (make-unknown)(make-unknown))))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Robl" 1994 'blue (make-unknown)(make-person "Robl" 1994 'blue (make-unknown)(make-unknown)))))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Rob" 1994 'blue (make-unknown)(make-person "Rob" 1994 'blue (make-unknown)(make-person "Rob" 1994 'blue (make-unknown)(make-unknown)))))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Robl" 1994 'blue (make-unknown)(make-person "Robl" 1994 'blue (make-unknown)(make-person "Robl" 1994 'blue (make-unknown)(make-unknown))))))
(check-expect (tree-map add-l (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Rob" 1994 'blue (make-unknown)(make-person "Rob" 1994 'blue (make-person "Rob" 1994 'blue (make-unknown)(make-unknown))(make-unknown))))) (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person "Robl" 1994 'blue (make-unknown)(make-person "Robl" 1994 'blue (make-person "Robl" 1994 'blue (make-unknown)(make-unknown))(make-unknown)))))
              

(define (tree-map f tree)
  (cond
  [ (and (person? (person-father tree)) (person? (person-mother tree))) (make-person (f (person-name tree)) (person-birthyear tree) (person-eyecolor tree) (tree-map f (person-father tree)) (tree-map f (person-mother tree)))]
  [(person? (person-father tree)) (make-person (f (person-name tree)) (person-birthyear tree) (person-eyecolor tree) (tree-map f (person-father tree)) (person-mother tree))]
  [(person? (person-mother tree)) (make-person (f (person-name tree)) (person-birthyear tree) (person-eyecolor tree) (person-father tree) (tree-map f (person-mother tree)))]
  [else (make-person (f (person-name tree)) (person-birthyear tree) (person-eyecolor tree) (person-father tree) (person-mother tree))]))

(define (add-l str)
  (list->string(append (string->list str)(cons #\l empty))))


(define (add-last-name tree lname)
  (tree-map string-append tree))


((compose-func  string-append (add-l "foo")) "x")
(check-expect (add-last-name (make-person "Rob" 1994 'blue (make-unknown)(make-unknown)) "Farinelli") (make-person "Rob Farinelli" 1994 'blue (make-unknown)(make-unknown)))
(check-expect (add-last-name (make-person "Rob" 1994 'blue (make-unknown)(make-unknown)) "Farinelli") (make-person "Rob Farinelli" 1994 'blue (make-unknown)(make-unknown)))
