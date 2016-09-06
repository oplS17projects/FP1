;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ass1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Problem #1
(define penny_val .01)
(define nickel_val .05)
(define dime_val .1)
(define quarter_val .25)

;;PURPOSE Add the number the sum of all the coins together
;;Reuturn the sum off all the coins as a number if any numbers
;;return -1 if there are any errors

(check-expect (sum-coins 0 0 0 0) 0)
(check-expect (sum-coins 10 7 3 1) 1)
(check-expect (sum-coins 1 1 1 1) .41)
;;You can't have negitive coins so reutrn an error if negitive number is passed
(check-expect (sum-coins -1 0 2 10) -1)
(check-expect (sum-coins 0 -1 2 10) -1)
(check-expect (sum-coins 0 2 -1 10) -1)
(check-expect (sum-coins 0 2 10 -1) -1)
;;You can't have half of a coin ethier so return an error if so, but whole numbers with a decimal 1.0 are correct input
(check-expect (sum-coins 0 2 10 1.5) -1)
(check-expect (sum-coins 0 2 10 1.0) 1.35)
(check-expect (sum-coins 0 2.0 10.0 1.0) 1.35)
;;Any non-number values should also return -1
(check-expect (sum-coins "foo" 2 10 0) -1)
(check-expect (sum-coins true 2 10 1.0) -1)
;;Non-real numbers shouls also return -1 
(check-expect (sum-coins 1 +inf.0  10 1) -1)
(check-expect (sum-coins 1 1  10 2+3i) -1)

(define (sum-coins pennies nickels dimes quarters)
  (if (and (integer? pennies) (integer? nickels) (integer? dimes) (integer? quarters) (>= pennies  0 )(>= nickels  0 ) (>= dimes  0 ) (>= quarters  0 )) (+ (+ (+ (* pennies penny_val) (* nickels  nickel_val))
  (* dimes  dime_val))(* quarters quarter_val)) -1))