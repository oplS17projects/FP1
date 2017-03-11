#lang racket

(require net/url)
(require json)
(define myurl (string->url "http://ballotyelp.herokuapp.com/yelpsearch/sushi/lowell"))
;; String URL will basically creating a URL of type string, just like in Swift,
;; it would be URL(http://www blahblah.com)
(define myport (get-pure-port myurl))
;; makes the HTTP GET request! AWESOME STUFF HAPPENING HERE.. THEN.. WE GET OUR JSON!

;;(display-pure-port myport)
;; allows use to print the result that get-pure-port produced
;; the produced result is of type #<input-port:pipe>
(define isPort? (input-port? myport))
(define isJSON? (jsexpr? myport))

