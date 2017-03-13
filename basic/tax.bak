;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tax) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define tax_bracket_1 .15)
(define tax_bracket_2 .28)
;;Purpose: calulate the pay of an employee with taxes
;;Returns the surface area of a cylinder or -1 if there was an erorr
(check-within (tax 10) 10 .01)
(check-within (tax 240) 240 .01)
(check-within (tax 241) 204.85 .01)
(check-within (tax 480) 408 .01)
(check-within (tax 481) 346.32 .01)
(check-within (tax 0) 0 .01)
(check-within (tax 500.50) 360.36 .01)
;;negitive/non-real numbers, and non-numeric data types are prohibted
(check-within (tax -0.1) -1 0)
(check-within (tax "hello") -1 0)
(check-within (tax true) -1 0)
(check-within (tax +inf.0) -1 0)
(check-within (tax 2+3i) -1 0)

(define(tax gross-pay)
  (if( and(rational? gross-pay) (>= gross-pay 0))
     (if(<= gross-pay 240)
        gross-pay
     (if (and (> gross-pay 240) (<= gross-pay 480))
         (- gross-pay (* gross-pay tax_bracket_1))
     (if  (> gross-pay 480)
          (- gross-pay (* gross-pay tax_bracket_2)) -1)))-1))