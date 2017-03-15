#lang racket

(require 2htdp/image)

(let sierpinski ([n 5])
  (if (zero? n)
    (triangle 10 'solid 'green)
    (let ([next (sierpinski (- n 1))])
      (above next (beside next next)))))