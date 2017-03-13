#lang racket


(require pict
    racket/draw)
(for/fold ((result (blank)))((i (in-range 29)))
  (lt-superimpose (circle (* i 10)) result))
