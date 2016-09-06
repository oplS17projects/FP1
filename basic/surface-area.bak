;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname surface-area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Function 2
;;Purpose: Find the surface area of a cylinder
;;Returns the surface area of a cylinder or -1 if there was an erorr 
(check-within (area-cylinder 2 4) 75.39 .01)
(check-within (area-cylinder 2 2.2) 52.78 .01)
(check-within (area-cylinder .1 .1) .13 .01)
;;only rational numbers from [0,infinty] can be a mesurement
(check-within (area-cylinder 2 +inf.0) -1 0)
(check-within (area-cylinder 2+3i 4) -1 0)
(check-within (area-cylinder "hello" 4) -1 0)
(check-within (area-cylinder true 4) -1 0)
(check-within (area-cylinder 1 0) -1 0)
(check-within (area-cylinder 0 1) -1 0)


(define(area-cylinder base-radius height)
              (if (and (rational? base-radius) (rational? height)(> base-radius  0)(> height 0)) 
                        (+ (* 2 (* pi (* base-radius height))) (* 2(* pi (expt base-radius 2 )))) -1))