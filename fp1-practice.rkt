#lang racket
(require xml/plist)
(require xml/path)
(require xml)


(display "Reads in an XML document")
(display "\n")
(xml->xexpr (document-element
               (read-xml (open-input-string
                          "<doc><bold>hi</bold> there!</doc>"))))

(display "\n")
(display "*** Writes XML document ***")
(display "\n")
(display "\n")
(parameterize ([empty-tag-shorthand html-empty-tags])
    (write-xml/content (xexpr->xml `(html
                                      (body ((bgcolor "green"))
                                            (a ((front-size "big")) "Have a nice day")
                                        "Hello!" (br) "Good Bye!")))))


(define some-page
    '(html (body (a ([class "good-active"]) "Learning stage") (p "Having fun"))))

(display "\n")
(display "\n")
(se-path*/list '(p) some-page)
(display "\n")
(se-path* '(p) some-page)
(display "\n")
(se-path* '(p #:class) some-page)
(display "\n")
(se-path*/list '(body) some-page)
(display "\n")
(se-path*/list '() some-page)