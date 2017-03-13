#lang racket

(require plot)
(plot-new-window? #t)
;;(plot (function sin (- pi) pi #:label "y = sin(x)"))
;;(plot3d (surface3d (λ (x y) (* (cos x) (sin y)))
  ;;                 (- pi) pi (- pi) pi)
    ;;    #:title "An R x R -> R function"
      ;;  #:x-label "x" #:y-label "y" #:z-label "cos(x) sin(y)")

;;(parameterize ([plot-title "An R x R -> R function"]
  ;;             [plot-x-label "x"]
    ;;           [plot-y-label "y"]
      ;;         [plot-z-label "cos(x) sin(y)"])
  ;;(plot3d (contour-intervals3d(λ (x y) (* (cos x) (sin y)))
    ;;                          (- pi) pi (- pi) pi)))

;;(plot (list (axes)
  ;;          (function sqr -2 2)
    ;;        (function (λ (x) x) #:color 0 #:style 'dot)
      ;;      (inverse sqr -2 2 #:color 3)))
;;(plot (list (axes)
  ;;          (function (λ (x) (sqrt (- 100 (* x x)))))
  ;;          (function (λ (x) (- (sqrt (- 100 (* x x)))))))
  ;;    #:x-min -10 #:x-max 10
  ;;    #:y-min -10 #:y-max 10)

;;(plot (polar (λ (theta) 10)))
;;(plot (polar (λ (theta) (+ 1/2 (* 1/6 (cos (* 5 theta)))))))

;;the superformula
;;(plot (polar (λ (theta) (expt (+ (abs (/ (cos (/ (* 88 theta) 4)) 1))
  ;;                               (abs (/ (sin (/ (* 64 theta) 4)) 1)))
    ;;                          (- (/ 1 -20)))))
      ;;#:title "Superformula n=-20, y=88, z=64 a,b,n2,n3=1")

;;n=3 y=4 z=6 a = 1 b=1 n2=1 n3=1
;;(plot (list (axes)
  ;;          (function sqr -2 2 #:label "y= x^2")
    ;;        (function (λ (x) x) #:label "y=x" #:color 0 #:style 'dot)
      ;;      (inverse sqr -2 2 #:label "x=y^2" #:color 3)))

;;(plot3d (polar3d (λ (theta rho) 1) #:color 2 #:line-style 'transparent)
  ;;      #:altitude 25)

;;(plot3d (polar3d (λ (theta rho) 1) #:color 2 #:line-style 'transparent)
  ;;      #:x-min -0.8 #:x-max 0.8
  ;;      #:y-min -0.8 #:y-max 0.8
  ;;      #:z-min -0.8 #:z-max 0.8
  ;;      #:altitude 25)

;;(define ((dist cx cy cz) x y z)
  ;;(sqrt (+ (sqr (- x cx)) (sqr (- y cy)) (sqr (- z cz)))))
;;(plot3d (list (isosurface3d (dist 1/4 -1/4 -1/4) 0.995
  ;;                        #:color 4 #:alpha 1 #:samples 21)
    ;;        (isosurface3d (dist -1/4 1/4 1/4) 0.995
      ;;                    #:color 6 #:alpha 0.8 #:samples 21))
      ;;#:x-min -1 #:x-max 1
      ;;#:y-min -1 #:y-max 1
      ;;#:z-min -1 #:z-max 1
      ;;#:altitude 25)
