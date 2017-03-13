
## My Library: (math/statistics and plot)
My name: Joao Carlos Canto De Almeida

```racket
(define plot-bd (plot (discrete-histogram
         (map vector (build-list 6 values) (build-list 6 (distribution-pdf bd))))
                      #:x-label "number of heads" #:y-label "probability"))
;; it uses the pdf files to build the discrete graph
```
![plot-img](/plot-img.png?raw=true "plot-img")

![test image](/testimage.png?raw=true "test image")

