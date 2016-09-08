<<<<<<< HEAD
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (check-temps1(list)) false)
(check-expect (check-temps1 empty) false)
(check-expect (check-temps1(list 5 10 15)) true)
(check-expect (check-temps1(cons 7 (cons 10 (cons 22 empty)))) true)
(check-expect (check-temps1(list 7 10  20 95)) true)
(check-expect (check-temps1(list 4 10  20 95)) false)
(check-expect (check-temps1(list 5 10  20 97)) false)
(check-expect (check-temps1(cons 0 (cons 10 (cons 22 empty)))) false)
(check-expect (check-temps1(cons 15 (cons 100 (cons 10 empty)))) false)

;;Takes a list of tempurates and checks is all the tempuratures are bettewen 9 to 95 inclusive
;;returns true if they are false otherwise
(define (check-temps1 temps)
  (cond
    [(empty? temps) false]
    [(or (> (first temps) 95) (< (first temps) 5)) false]
    [(empty? (rest temps)) true]
    [else (check-temps1 (rest temps))]))

;;Takes a list of tempurates and checks is all the tempuratures are bettewen low to high inclusive
;;returns true if they are false otherwise
;; 'error is returned if low > high
(check-expect (check-temps(list) 10 10) false)
(check-expect (check-temps empty 10 10) false)
(check-expect (check-temps (list 5 10 15) 5 15) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 6 30) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 5 95 ) true)
(check-expect (check-temps (list 7 10  20 95) 7 100) true)
(check-expect (check-temps (list 4 5  20 95) 10 100) false)
(check-expect (check-temps (list 5 200  20 97) 5 90) false)
(check-expect (check-temps (cons -2 (cons 10 (cons 22 empty))) 0 15) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 15 80) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 85 80) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 0  0) false)
(check-expect (check-temps (cons 5 (cons 5 (cons 5 empty))) 5  5) true)
(check-expect (check-temps (cons 10 (cons 10 (cons 10 empty))) 10  10) true)


(define (check-temps temps low high)
  (cond
    [(> low high) 'error]
    [(empty? temps) false]
    [(or (> (first temps) high) (< (first temps) low)) false]
    [else (check-temps1 (rest temps))]))


(check-expect (convert empty) 0)
(check-expect (convert (cons 2 empty)) 2)
(check-expect (convert (cons 5 empty)) 5)
(check-expect (convert (cons 2 (cons 1 empty))) 21)
(check-expect (convert (cons 1 (cons 2 empty))) 21)
(check-expect (convert (cons 1 (cons 2 (cons 3 empty)))) 321)
(check-expect (convert (cons 1 (cons 3 (cons 2 empty)))) 321)
(check-expect (convert (cons 3 (cons 2 (cons 1 empty)))) 321)

;; Consumes a list of digits (numbers between 0 and 9) and produces the corresponding number. The first digit is the least significant, and so on.
;; reutrn a number eith the digits in order from greatesr to least
(define (convert digits)
  (cond
  [(empty? digits) 0]
  [else (+ (*(expt 10  (list-count (rest digits))) (first(sort digits))) (convert(rest(sort digits))))]))

;; sort : (list-of number) -> (list-of number)
;; Returns a permutation of the input in increasing order
(define (sort digits)
  ;; AVAILABLE: l1 : (list-of A)
  ;;            (empty? l1) : bool
  ;;            (cons? l1) : bool
  (cond
    [(empty? digits)
     ;; AVAILABLE: 
     empty]
    [else
     ;; AVAILABLE:                  l1 : (cons-of A)
     ;;                     (first l1) : A
     ;;                      (rest l1) : (list-of A)
     ;;               (sort (rest l1)) : (sorted-list-of A)

     ;; EX2 : l1 = 2 :: []
     ;;     ; f l1 = 2
     ;;     ; r l1 = []
     ;;     ; sort r l1 = []
     #;(cons (first digits)
           (sort (rest digits)))

     ;; EX3 : l1 = 2 : 1 :: []
     ;;     ; f l1 = 2
     ;;     ; r l1 = 1 :: []
     ;;     ; s r l1 = 1 :: []
     ;; RESULT = 2 : 1 :: []
     ;; EXPECTED = 1 : 2 :: []

     ;; wish : number (sorted-list-of num) -> (sorted-list-of num)
     ;; Put the number in the right spot
     (wish (first digits)
           (sort (rest digits)))
     ]))

;; wish : number (sorted-list-of num) -> (sorted-list-of num)
;; Put the number in the right spot
(define (wish n l)
  (cond
    [(empty? l)
     (cons n empty)]
    [else
     (cond
       [(> n (first l))
        (cons n l)]
       [else
        (cons (first l)
              (wish n (rest l)))])]))

;;Consumes a list of toy prices and computes the average price of a toy
(check-expect (average-price empty) 0)
(check-expect (average-price (cons 2(cons 2 (cons 2 empty)))) 2)
(check-expect (average-price (cons 1.5 empty)) 1.5)
(check-expect (average-price (cons 1(cons 6 (cons 8 (cons 10 empty))))) 6.25)

(define (average-price prices)
  (cond
   [(empty? prices) 0]
   [else (/ (get-total prices) (list-count prices))]))

(define (get-total prices)
  (cond
  [(empty? (rest prices))(first prices)]
  [else (get-total (cons (+ (first prices) (first(rest prices)))(rest(rest prices))))]))

(define (list-count li)
  (cond 
  [(empty? li) 0]
  [else (+  (list-count (rest li)) 1)]))

;;Converts a list of of Fahrenheit measurements to a list of Celsius measurements.
(check-expect (convertFC empty) empty)
(check-expect (convertFC (cons 32 empty))(cons 0 empty))
(check-expect (convertFC (cons 32 (cons 5 empty))) (cons 0 (cons -15 empty)))
(check-expect (convertFC (cons 212(cons 32 (cons 5 empty)))) (cons 100 (cons 0 (cons -15 empty))))

(define (convertFC fahrenheit)
  (cond
  [(empty? fahrenheit) empty]
  [else (convert-numbers fahrenheit empty)]))

;;converts the first element of a list of number to Fahrenheit
(define (convert-numbers fahrenheit celsius)
  (cond
    [(empty? fahrenheit) celsius]
    [else (convert-numbers (rest fahrenheit) (add-element celsius (*(- (first fahrenheit) 32) (/ 5 9))))]))

;;adds an element to the end of a list
(define (add-element li element)
  (cond
    [(empty? li) (cons element empty)]    
    [else (cons (first li)(add-element (rest li) element))]))

;;Eliminates from lotp all toys whose price is greater than ua.
(check-expect (eliminate-exp 5 empty) empty)
(check-expect (eliminate-exp 5 (cons 1 empty)) (cons 1 empty))
(check-expect (eliminate-exp 5 (cons 10 empty)) empty)
(check-expect (eliminate-exp 10 (cons 0 (cons 12 empty))) (cons 0 empty))
(check-expect (eliminate-exp 10 (cons 0 (cons 12 (cons 8 empty)))) (cons 0(cons 8 empty)))

(define (eliminate-exp ua lotp)
  (cond
   [(empty? lotp) empty]
   [(>(first lotp) ua) (eliminate-exp ua (rest lotp))]
   [else (cons (first lotp)(eliminate-exp ua (rest lotp)))]))

;;Produces a list of a suffixes of l.
;; reuturns a list of lists who's size is the amount of elements passesed in the otingal list
;; the sub-list contain all the elements passed with the next list missing the first element from the pervouis list
;; until the last list which is an empty list
(check-expect (suffixes empty) (list empty))
(check-expect (suffixes (list 'a )) (list (list 'a) empty))
(check-expect (suffixes (list 'a 'b 'c 'd)) (list (list 'a 'b 'c 'd) (list 'b 'c 'd) (list 'c 'd) (list 'd) empty))
(check-expect (suffixes (list 'a 'b 'c 'd 'e)) (list (list 'a 'b 'c 'd 'e) (list 'b 'c 'd 'e) (list 'c 'd 'e) (list 'd 'e) (list 'e) empty))

(define (suffixes l)
  (cond
    [(empty? l) (cons l empty)]
    [else (cons l (suffixes (rest l)))]))

(define-struct unknown ())
(define-struct person (name birthyear eyecolor father mother))


(check-expect (count-persons (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))) 1)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))) 2)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 3)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 4)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 5)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))))) 6)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))))) 6)
;;Returns the number of people in a family tree.
(define (count-persons ftree)
  (cond
  [(and (person? (person-father ftree)) (person? (person-mother ftree))) (+ 1 (count-persons (person-father ftree)) (count-persons (person-mother ftree)))]
  [(person? (person-father ftree)) (+ 1 (count-persons (person-father ftree)))]
  [(person? (person-mother ftree)) (+ 1 (count-persons (person-mother ftree)))]
  [else 1]))

;;Returns the average age of all the people in the family tree. (Assume the current year is 2016.)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))))) 22)

(define (average-age ftree)
  (/ (get-total-age ftree) (count-persons ftree)))

;;returns the total amount of years lived ny an entire family tree
(define (get-total-age ftree)
  (cond
  [ (and (person? (person-father ftree)) (person? (person-mother ftree))) (+ (- 2016 (person-birthyear ftree)) (+ (get-total-age (person-father ftree)) (get-total-age (person-mother ftree))))]
  [(person? (person-father ftree)) (+ (- 2016 (person-birthyear ftree)) (get-total-age (person-father ftree)))]
  [(person? (person-mother ftree)) (+ (- 2016 (person-birthyear ftree)) (get-total-age (person-mother ftree)))]
  [else (- 2016 (person-birthyear ftree))]))

;;Produces a list of all eye colors in family tree
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))(cons 'blue empty))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'red (make-unknown)(make-unknown))(make-unknown)))(cons 'blue (cons 'red empty)))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'green (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))(cons 'blue (cons 'green (cons 'blue empty))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue empty)))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'blue empty))))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown)))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'blue empty)))))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'red (make-unknown)(make-unknown))))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'red empty)))))))

(define (eye-colors ftree)
  (cond
  [ (and (person? (person-father ftree)) (person? (person-mother ftree))) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-father ftree)) (eye-colors (person-mother ftree)))]
  [(person? (person-father ftree)) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-father ftree)))]
  [(person? (person-mother ftree)) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-mother ftree)))]
  [else (cons (person-eyecolor ftree) empty)]))


=======
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(check-expect (check-temps1(list)) false)
(check-expect (check-temps1 empty) false)
(check-expect (check-temps1(list 5 10 15)) true)
(check-expect (check-temps1(cons 7 (cons 10 (cons 22 empty)))) true)
(check-expect (check-temps1(list 7 10  20 95)) true)
(check-expect (check-temps1(list 4 10  20 95)) false)
(check-expect (check-temps1(list 5 10  20 97)) false)
(check-expect (check-temps1(cons 0 (cons 10 (cons 22 empty)))) false)
(check-expect (check-temps1(cons 15 (cons 100 (cons 10 empty)))) false)

;;Takes a list of tempurates and checks is all the tempuratures are bettewen 9 to 95 inclusive
;;returns true if they are false otherwise
(define (check-temps1 temps)
  (cond
    [(empty? temps) false]
    [(or (> (first temps) 95) (< (first temps) 5)) false]
    [(empty? (rest temps)) true]
    [else (check-temps1 (rest temps))]))

;;Takes a list of tempurates and checks is all the tempuratures are bettewen low to high inclusive
;;returns true if they are false otherwise
;; 'error is returned if low > high
(check-expect (check-temps(list) 10 10) false)
(check-expect (check-temps empty 10 10) false)
(check-expect (check-temps (list 5 10 15) 5 15) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 6 30) true)
(check-expect (check-temps (cons 7 (cons 10 (cons 22 empty))) 5 95 ) true)
(check-expect (check-temps (list 7 10  20 95) 7 100) true)
(check-expect (check-temps (list 4 5  20 95) 10 100) false)
(check-expect (check-temps (list 5 200  20 97) 5 90) false)
(check-expect (check-temps (cons -2 (cons 10 (cons 22 empty))) 0 15) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 15 80) false)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 85 80) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 80 15) 'error)
(check-expect (check-temps (cons 15 (cons 100 (cons 10 empty))) 0  0) false)
(check-expect (check-temps (cons 5 (cons 5 (cons 5 empty))) 5  5) true)
(check-expect (check-temps (cons 10 (cons 10 (cons 10 empty))) 10  10) true)


(define (check-temps temps low high)
  (cond
    [(> low high) 'error]
    [(empty? temps) false]
    [(or (> (first temps) high) (< (first temps) low)) false]
    [else (check-temps1 (rest temps))]))


(check-expect (convert empty) 0)
(check-expect (convert (cons 2 empty)) 2)
(check-expect (convert (cons 5 empty)) 5)
(check-expect (convert (cons 2 (cons 1 empty))) 21)
(check-expect (convert (cons 1 (cons 2 empty))) 21)
(check-expect (convert (cons 1 (cons 2 (cons 3 empty)))) 321)
(check-expect (convert (cons 1 (cons 3 (cons 2 empty)))) 321)
(check-expect (convert (cons 3 (cons 2 (cons 1 empty)))) 321)

;; Consumes a list of digits (numbers between 0 and 9) and produces the corresponding number. The first digit is the least significant, and so on.
;; reutrn a number eith the digits in order from greatesr to least
(define (convert digits)
  (cond
  [(empty? digits) 0]
  [else (+ (*(expt 10  (list-count (rest digits))) (first(sort digits))) (convert(rest(sort digits))))]))

;; sort : (list-of number) -> (list-of number)
;; Returns a permutation of the input in increasing order
(define (sort digits)
  ;; AVAILABLE: l1 : (list-of A)
  ;;            (empty? l1) : bool
  ;;            (cons? l1) : bool
  (cond
    [(empty? digits)
     ;; AVAILABLE: 
     empty]
    [else
     ;; AVAILABLE:                  l1 : (cons-of A)
     ;;                     (first l1) : A
     ;;                      (rest l1) : (list-of A)
     ;;               (sort (rest l1)) : (sorted-list-of A)

     ;; EX2 : l1 = 2 :: []
     ;;     ; f l1 = 2
     ;;     ; r l1 = []
     ;;     ; sort r l1 = []
     #;(cons (first digits)
           (sort (rest digits)))

     ;; EX3 : l1 = 2 : 1 :: []
     ;;     ; f l1 = 2
     ;;     ; r l1 = 1 :: []
     ;;     ; s r l1 = 1 :: []
     ;; RESULT = 2 : 1 :: []
     ;; EXPECTED = 1 : 2 :: []

     ;; wish : number (sorted-list-of num) -> (sorted-list-of num)
     ;; Put the number in the right spot
     (wish (first digits)
           (sort (rest digits)))
     ]))

;; wish : number (sorted-list-of num) -> (sorted-list-of num)
;; Put the number in the right spot
(define (wish n l)
  (cond
    [(empty? l)
     (cons n empty)]
    [else
     (cond
       [(> n (first l))
        (cons n l)]
       [else
        (cons (first l)
              (wish n (rest l)))])]))

;;Consumes a list of toy prices and computes the average price of a toy
(check-expect (average-price empty) 0)
(check-expect (average-price (cons 2(cons 2 (cons 2 empty)))) 2)
(check-expect (average-price (cons 1.5 empty)) 1.5)
(check-expect (average-price (cons 1(cons 6 (cons 8 (cons 10 empty))))) 6.25)

(define (average-price prices)
  (cond
   [(empty? prices) 0]
   [else (/ (get-total prices) (list-count prices))]))

(define (get-total prices)
  (cond
  [(empty? (rest prices))(first prices)]
  [else (get-total (cons (+ (first prices) (first(rest prices)))(rest(rest prices))))]))

(define (list-count li)
  (cond 
  [(empty? li) 0]
  [else (+  (list-count (rest li)) 1)]))

;;Converts a list of of Fahrenheit measurements to a list of Celsius measurements.
(check-expect (convertFC empty) empty)
(check-expect (convertFC (cons 32 empty))(cons 0 empty))
(check-expect (convertFC (cons 32 (cons 5 empty))) (cons 0 (cons -15 empty)))
(check-expect (convertFC (cons 212(cons 32 (cons 5 empty)))) (cons 100 (cons 0 (cons -15 empty))))

(define (convertFC fahrenheit)
  (cond
  [(empty? fahrenheit) empty]
  [else (convert-numbers fahrenheit empty)]))

;;converts the first element of a list of number to Fahrenheit
(define (convert-numbers fahrenheit celsius)
  (cond
    [(empty? fahrenheit) celsius]
    [else (convert-numbers (rest fahrenheit) (add-element celsius (*(- (first fahrenheit) 32) (/ 5 9))))]))

;;adds an element to the end of a list
(define (add-element li element)
  (cond
    [(empty? li) (cons element empty)]    
    [else (cons (first li)(add-element (rest li) element))]))

;;Eliminates from lotp all toys whose price is greater than ua.
(check-expect (eliminate-exp 5 empty) empty)
(check-expect (eliminate-exp 5 (cons 1 empty)) (cons 1 empty))
(check-expect (eliminate-exp 5 (cons 10 empty)) empty)
(check-expect (eliminate-exp 10 (cons 0 (cons 12 empty))) (cons 0 empty))
(check-expect (eliminate-exp 10 (cons 0 (cons 12 (cons 8 empty)))) (cons 0(cons 8 empty)))

(define (eliminate-exp ua lotp)
  (cond
   [(empty? lotp) empty]
   [(>(first lotp) ua) (eliminate-exp ua (rest lotp))]
   [else (cons (first lotp)(eliminate-exp ua (rest lotp)))]))

;;Produces a list of a suffixes of l.
;; reuturns a list of lists who's size is the amount of elements passesed in the otingal list
;; the sub-list contain all the elements passed with the next list missing the first element from the pervouis list
;; until the last list which is an empty list
(check-expect (suffixes empty) (list empty))
(check-expect (suffixes (list 'a )) (list (list 'a) empty))
(check-expect (suffixes (list 'a 'b 'c 'd)) (list (list 'a 'b 'c 'd) (list 'b 'c 'd) (list 'c 'd) (list 'd) empty))
(check-expect (suffixes (list 'a 'b 'c 'd 'e)) (list (list 'a 'b 'c 'd 'e) (list 'b 'c 'd 'e) (list 'c 'd 'e) (list 'd 'e) (list 'e) empty))

(define (suffixes l)
  (cond
    [(empty? l) (cons l empty)]
    [else (cons l (suffixes (rest l)))]))

(define-struct unknown ())
(define-struct person (name birthyear eyecolor father mother))


(check-expect (count-persons (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))) 1)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))) 2)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 3)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 4)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 5)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))))) 6)
(check-expect (count-persons (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))))) 6)
;;Returns the number of people in a family tree.
(define (count-persons ftree)
  (cond
  [(and (person? (person-father ftree)) (person? (person-mother ftree))) (+ 1 (count-persons (person-father ftree)) (count-persons (person-mother ftree)))]
  [(person? (person-father ftree)) (+ 1 (count-persons (person-father ftree)))]
  [(person? (person-mother ftree)) (+ 1 (count-persons (person-mother ftree)))]
  [else 1]))

;;Returns the average age of all the people in the family tree. (Assume the current year is 2016.)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))) 22)
(check-expect (average-age (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))))) 22)

(define (average-age ftree)
  (/ (get-total-age ftree) (count-persons ftree)))

;;returns the total amount of years lived ny an entire family tree
(define (get-total-age ftree)
  (cond
  [ (and (person? (person-father ftree)) (person? (person-mother ftree))) (+ (- 2016 (person-birthyear ftree)) (+ (get-total-age (person-father ftree)) (get-total-age (person-mother ftree))))]
  [(person? (person-father ftree)) (+ (- 2016 (person-birthyear ftree)) (get-total-age (person-father ftree)))]
  [(person? (person-mother ftree)) (+ (- 2016 (person-birthyear ftree)) (get-total-age (person-mother ftree)))]
  [else (- 2016 (person-birthyear ftree))]))

;;Produces a list of all eye colors in family tree
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))(cons 'blue empty))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown)))(cons 'blue (cons 'blue empty)))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))(cons 'blue (cons 'blue (cons 'blue empty))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-unknown))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue empty)))))
(check-expect(eye-colors (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-person 'Rob 1994 'blue (make-unknown)(make-unknown))(make-unknown))(make-person 'Rob 1994 'blue (make-unknown)(make-person 'Rob 1994 'blue (make-unknown)(make-unknown)))))(cons 'blue (cons 'blue (cons 'blue (cons 'blue (cons 'blue empty))))))

(define (eye-colors ftree)
  (cond
  [ (and (person? (person-father ftree)) (person? (person-mother ftree))) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-father ftree)) (eye-colors (person-mother ftree)))]
  [(person? (person-father ftree)) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-father ftree)))]
  [(person? (person-mother ftree)) (append (cons (person-eyecolor ftree) empty) (eye-colors (person-mother ftree)))]
  [else (cons (person-eyecolor ftree) empty)]))


>>>>>>> cc1a173cac2d0fcf49c5dfafe88ae7dff1b2ff6f
