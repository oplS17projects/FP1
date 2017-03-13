#lang racket

(require net/url)

(define (trending n) ;; displays YouTube's Weekly Trending Videos from #n - #1 (n = user specified)
  (define myurl (string->url "https://www.youtube.com/feed/trending"))
  (define myport (get-pure-port myurl))
  (define title-regex #px"[:alnum:]\"\\s\\stitle=\"[a-zA-Z 0-9.~|()!@#$%^&*+=\\-_'/]*") ;; find a video title
  (define clean-regex #px"[:alnum:]\"\\s\\stitle=\"") ;; used to clean up the trending title
  
  (define (run-loop x lst)
    (if (= x 0) lst
        (run-loop ;; loop through video titles a desired amount of times
         (sub1 x)
         (cons
          (regexp-replace clean-regex (car (regexp-match title-regex myport)) "")
          lst))))
  
  (if (and (< n 25) (> n 0)) ;; youtube's "weekly trending" only displays 24 videos
      (run-loop n '())
      "can only display a maximum of 24 videos"))
