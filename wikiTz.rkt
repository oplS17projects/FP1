#lang racket
(require net/url)  ;; library for retrieving web pages via urls
;; !! must install via raco pkg, not found in default installation
;; raco pkg install html-parsing
(require html-parsing) ;; convert html to sxml
(require xml)  ;; parse and generate xml



(define url1 (string->url "https://en.wikipedia.org/wiki/Tanzania"))
(define port1 (get-pure-port url1))
; (display-pure-port port1) ;; display raw connects of the page
;  careful it automatically closes port when its done

(define sxml1 (html->xexp port1)) ;; converts html to an x-expression
; (xexpr? sxml1)  ;; --> #t

(permissive-xexprs #t)
(permissive-xexprs)
(define xml1 (xexpr->xml sxml1)) ;; converts to strict xml
;; xml1 is not a port its a content
; xml1
; (write-xml/content xml1) ;; displays it raw
; (display-xml/content xml1) ;; displays it in a cleaner way

;; create an output file for storing the files
(define out (open-output-file "./wikiTz.xml"))
(display-xml/content xml1 out)
(close-output-port out)
;; no longer a port, and so needs to be converted to a prot
; (define doc1 (read-xml xml1)) ;; read the xml into a doc
; doc1

