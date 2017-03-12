#lang racket
(require web-server/servlet
         web-server/servlet-env)
(require xml)
(require net/url)
;(require markdown)

(define list-file-name "list.txt")
(define file-list (file->list list-file-name))

(define (generate-file-string fle num)
  ;(string-append "<div id=\"" (number->string num) "\"> <p> " (string-replace (file->string (string-append "txtfiles/" (symbol->string fle))) "\n" "</p> <p> " ) "</p> </div>" ))
  ; Above generates the right html for the page, below attempts at the xexpr
  (string-append "(div ((id \"" (number->string num) "\")) (p " (string-replace (file->string (string-append "txtfiles/" (symbol->string fle))) "\n" ") (p " ) ") )" ))
  
(define (itr-file-list lst num)
  (if (empty? lst)
      '()
      (cons (generate-file-string (car lst) num) (itr-file-list (cdr lst) (+ num 1)))))

(define (concat-itr-list lst)
  (cond
    [(empty? lst) ""]
    [(empty? (rest lst)) (car lst)]
    [else (string-append (car lst) (concat-itr-list (cdr lst)))]))

(define html-string (concat-itr-list (itr-file-list file-list 1)))

;(define mdasdf (parse-markdown (file->string "jonathan.md")))
; if I had (require markdown) then I could parse markdown
; the reason I don't have markdown required is because it needs lib xml
; and I need lib xml for string->xexpr and xexpr->string
; which does not work with just markdown included
(define mdasdf '((h2 ((id "hi-im-jonathan-murphy")) "Hi Im Jonathan Murphy") (h3 ((id "this-is-a-web-page")) "This is a web page") (p () (strong () "WOW"))))

(define (start req)
  (response/xexpr
   `(html ()
          (head ())
          (body () ,@mdasdf))))

(serve/servlet start)
;(string->xexpr html-string)
; html-string is the following:
; "(div ((id \"1\")) (p this is file one.txt) (p this is still file one) (p ) )(div ((id \"2\")) (p this is the second file) (p ) )(div ((id \"3\")) (p And the last file) (p ) )"
; string->xexpr gives the following error
; string::1: read-xml: parse-error: expected root element - received "(div ((id \"1\")) (p this is file one.txt) (p this is still file one) (p ) )(div ((id \"2\")) (p this is the second file) (p ) )(div ((id \"3\")) (p And the last file) (p ) )"

; string val for mdasdf
; '((h2 ((id "hi-im-jonathan-murphy")) "Hi Im Jonathan Murphy") (h3 ((id "this-is-a-web-page")) "This is a web page") (p () (strong () "WOW")))