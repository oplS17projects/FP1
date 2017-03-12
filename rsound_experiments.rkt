#lang racket
(require rsound)
(require control)

;;(diagnose-sound-playing)
 
;;(play ding)

;;(sleep 2)

(define VOLUME 0.4)
(define FREQUENCY 430)
 
(define (sine-tone f)
  (* VOLUME (sin (* 2 pi FREQUENCY (/ f FRAME-RATE)))))
 
;;(play (build-sound (* 2 FRAME-RATE) sine-tone))

;;(sleep 2)

(set! FREQUENCY 400)


(define (bit-rotate-left n s m)
  (cond ((or (= 0 s) (= 0 n)) n)
        ((> (* n 2) m) (+ (modulo (* n 2) m) 1))
        (else (modulo (* n 2) m))))

(define (bit-rotate-right n s m)
  (cond ((or (= 0 s) (= 0 n)) n)
        ((odd? n) (+ (round (/ n 2)) (floor (/ m 2))))
        (else (round (/ n 2)))))


(define shift-stream (make-pstream))

(define i 0)
;;(define n 0)
;;(define s 0)

(define (^ b p)
  (cond ((or (= b 1) (= p 0)) 1)
        (else (* b (^ b (- p 1))))))



;; I had been trying to recreate a procedural music program done using c, but I couldn't figure it out, so I experimented with the library and eventually ended up with something somewhat musical

;; Bitshift Variations in C Minor by robertskmiles
;; https://www.youtube.com/watch?v=MqZgoNRERY8
;; echo "g(i,x,t,o){return((3&x&(i*((3&i>>16?\"BY}6YB6%\":\"Qj}6jQ6%\")[t%8]+51)>>o))<<4);};main(i,n,s){for(i=0;;i++)putchar(g(i,1,n=i>>14,12)+g(i,s=i>>17,n^i>>13,10)+g(i,s/3,n+((i>>11)%3),10)+g(i,s/5,8+n-((i>>10)%3),9));}"|gcc -xc -&&./a.out|aplay



;;(define (shift-freq j)
;;  (define (g i x t o)
;;    (bitwise-and 3 x (arithmetic-shift (* i (arithmetic-shift (+ (list-ref (if (arithmetic-shift (bitwise-and 3 i) 16) '(66 89 125 54 89 66 54 37) '(81 106 125 54 106 81 54 37)) (modulo t 8)) 51) o)) -4)))
;;  (modulo (+ (g j 1 ((lambda () (set! n (arithmetic-shift j 14)) n)) 12) (g j ((lambda () (set! s (arithmetic-shift j 17)) s)) (^ n (arithmetic-shift j 13)) 10) (g j (floor (/ s 3)) (+ n (modulo (arithmetic-shift j 11) 3)) 10) (g j (floor (/ s 5)) (- (+ 8 n) (modulo (arithmetic-shift j 10) 3)) 9)) 256))

;;(while #t (pstream-queue shift-stream (build-sound (* 2 FRAME-RATE) sine-tone) (pstream-current-frame shift-stream)) (set! FREQUENCY (shift-freq)) (set! i (+ i 1)) (sleep 2))
;;(while #t (set! FREQUENCY (shift-freq)) (set! i (+ i 1)))



;;(define (shift-freq n)
;;  (+ (modulo (+ (* (modulo n 66) (modulo n 89)) (* (modulo n 125) (modulo n 54)) (* (modulo n 89) (modulo n 66)) (* (modulo n 54) (modulo n 37)) (* (modulo n 81) (modulo n 106)) (* (modulo n 125) (modulo n 54)) (* (modulo n 106) (modulo n 81)) (* (modulo n 54) (modulo n 37))) 1024) 400))

;;(define (g i x t o)
;;  (bitwise-and 3 x (round (bit-rotate-left (* i (bit-rotate-right (+ (list-ref (if (bit-rotate-right (bitwise-and 3 i) 16 256) '(66 89 125 54 89 66 54 37) '(81 106 125 54 106 81 54 37)) (modulo t 8)) 51) o 256)) 4 256))))


;;(define (shift-freq i)
;;  (define n (bit-rotate-right i 14 256))
;;  (define s (bit-rotate-right i 17 256))
;;  (+ (* 10 (modulo (+ (g i 1 n 12) (g i s (^ n (bit-rotate-right i 13 256)) 10) (g i (round (/ s 3)) (+ n (modulo (bit-rotate-right i 11 256) 3)) 10) (g i (round (/ s 5)) (- (+ 8 n) (modulo (bit-rotate-right i 10 256) 3)) 9)) 256)) 400))



(define (shift-freq i)
  (+ 400 (modulo (round (* 10 (/ (+
                                  (* 10 (modulo i 3))
                                  (* 10 (modulo (modulo i 7) (+ 1 (modulo i 3))))
                                  (* 10 (modulo (modulo i 13) (+ 1 (modulo i 7))))
                                  (* 10 (modulo (modulo i 19) (+ 1 (modulo i 13))))
                                  ) 4))) 256)))


(while #t (set! FREQUENCY (shift-freq i)) (set! i (+ i 1)) (println i) (println FREQUENCY) (pstream-queue shift-stream (build-sound FRAME-RATE sine-tone) (pstream-current-frame shift-stream)) (sleep 1))

