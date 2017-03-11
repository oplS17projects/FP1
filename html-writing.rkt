#lang racket
(require html-writing)

(define out (open-output-file "index.html"))

(write-html
 '((html (head (title "Sample Title"))
         (body (@ (bgcolor "white"))
               (h1 "HEADER")
               (p "Hello world!")
               (p "This is a paragraph."))))
 out)

(close-output-port out)
