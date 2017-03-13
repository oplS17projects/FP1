
## My Library: (math/statistics and plot)
My name: Joao Carlos Canto De Almeida



```racket 
 (define sd-bd (stddev (sample bd 5)))
;; finds the standard deviation of the distribution

(define m-bd (mean (sample bd 5)))
;; finds the mean of the distribution

(define bd-pdf (build-list 6 (distribution-pdf bd)))
;; finds the pdf (probability density function) – represented as a list of reals
```
```racket
(define plot-bd (plot (discrete-histogram
         (map vector (build-list 6 values) (build-list 6 (distribution-pdf bd))))
                      #:x-label "number of heads" #:y-label "probability"))
;; it uses the pdf files to build the discrete graph
```
![plotimg](/plotimg.png?raw=true "plotimg")


