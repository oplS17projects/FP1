;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname time) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct time (hours minutes seconds))

;; Takes in two time and returns the total seconds bettewen t1 and t1
;; negitive 1 is returned if the was and error such as an ivinald time was passed
(check-expect(time-diff 1 1) -1)
(check-expect(time-diff "foo" 1) -1)
(check-expect(time-diff (make-time 1 1 "foo") (make-time 1 1 1)) -1)
(check-expect(time-diff (make-time 3 3 3) (make-time 1 1 -1)) -1)
(check-expect(time-diff (make-time 3.2 3 3) (make-time 1 1 1)) -1)
(check-expect(time-diff (make-time 3 +inf.0 3) (make-time 1 1 1)) -1)
(check-expect(time-diff (make-time 24 0 0) (make-time 1 1 1)) -1)
(check-expect(time-diff (make-time 23 59 60) (make-time 1 1 1)) -1)
(check-expect(time-diff (make-time 23 59 0) (make-time 1 60 59)) -1)
(check-expect(time-diff (make-time 2 2 2) (make-time 1 1 1)) 3661)
(check-expect(time-diff (make-time 2 2 2) (make-time 0 0 0)) 7322)
(check-expect(time-diff (make-time 2 2 2) (make-time 2 2 2)) 0)
(check-expect(time-diff (make-time 23 59 59) (make-time 0 0 0)) 86399)
(check-expect(time-diff (make-time 23 59 59) (make-time 1 1 1)) 82738)
(check-expect(time-diff (make-time 0 0 0) (make-time 1 1 1)) 3661)
(check-expect(time-diff (make-time 0 0 0) (make-time 23 59 59)) 86399)


(define (time-diff t1 t2)
         (if(and (time? t1) (time? t2)
               (integer? (time-hours t1))
               (integer? (time-minutes t1))
               (integer? (time-seconds t1))
               (integer? (time-hours t2))
               (integer? (time-minutes t2))
               (integer? (time-seconds t2))
               (>= (time-hours t1) 0)
               (< (time-hours t1) 24)
               (>= (time-minutes t1) 0)
               (< (time-minutes t1) 60)
               (>= (time-seconds t1) 0)
               (< (time-seconds t1) 60)
               (>= (time-hours t2) 0)
               (< (time-hours t2) 24)
               (>= (time-minutes t2) 0)
               (< (time-minutes t2) 60)
               (>= (time-seconds t2) 0)
               (< (time-seconds t2) 60))
           (abs(-(+ (+ (*(time-hours t1) (* 60 60)) (*(time-minutes t1) 60))(time-seconds t1))
             (+ (+ (*(time-hours t2) (* 60 60)) (*(time-minutes t2) 60))(time-seconds t2))))-1))


