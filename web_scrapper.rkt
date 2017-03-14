#lang racket
(require net/url)
(require net/url-structs)
(require net/sendurl)

(define google "http://google.com")
(define Google (string->url google))
(define in (get-pure-port Google #:redirections 5))
(define out-WB (send-url google))
(define out-TXT (display-pure-port in))


