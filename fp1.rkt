#lang racket

(require 2htdp/image)
(require 2htdp/planetcute)
(require 2htdp/universe)

(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (underlay/xy (first imgs) 0 80
                          (stack (rest imgs)))]))

(define (drift t)
  (place-image castaway (- width t) (/ height 2) background))


(define castaway (overlay/xy character-boy 0 40 wood-block))

(define background
  (beside/align
   "bottom"
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))))

  
(define height (image-height background))
(define width  (image-width background))
(define middle (/ (image-width background) 2))


(animate drift)
