#lang racket

;; http://docs.racket-lang.org/simple-qr/install.html?q=qr%20code
(require simple-qr)


(define (qr url filename)
  (qr-code url (string-append filename ".png")))



;; Example usage:
;; (qr "duckduckgo.com" "ddg")
