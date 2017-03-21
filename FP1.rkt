#lang racket

;; @author : Chintushig Ochirsukh

(require racket/file)


(require net/url     ;; for the url
         html        ;; for html
         xml
         xml/path)        ;; for reading html as xml



(define my-url (string->url "https://www.reddit.com/r/DotA2/"))

(define second-url (string->url "https://www.google.com/"))

(define my-path (string->path "C:/Users/tushi/Desktop/Web stuff/mysite"))

(define (def p) (string-suffix? (path->string p) ".html"))

(define myfiles (find-files def my-path))




;; xml -> xexpr :: Converts document content into an X-expression
;; caddr :: takes the third element cdr = everything except the first cddr = everything except the frst2 caddr = first element of cddr
(define (read-html-as-xexprs in) ;; (-> input-port? xexpr?)
  (caddr
   (xml->xexpr
    (element #f #f 'root '()
             (read-html-as-xml in)))))
  
(define xe (call/input-url my-url                ;; source
                           get-pure-port         ;; creating a port
                           read-html-as-xexprs)) ;; function


;;source : https://docs.racket-lang.org/xml/
(se-path*/list '(a #:href) xe)         ;; procedure
                                       ;;(se-path*/list p xe) → (listof any/c)
;;extracting all                       ;;  p : se-path?
;;the href attributes of all the <a>   ;;  xe : xexpr?
;;elements                              
                                       

;; A pure port is one from which the MIME headers have been removed, so that what remains is purely the first content fragment. 
(define my-port (get-pure-port my-url))

(define result (port->string my-port))

(define my-html-port (read-html my-port))

(display-pure-port my-port)


;; a good programming excercise would be open and close all ports manually.
(close-input-port my-port)




