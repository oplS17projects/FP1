# Final Project Assignment 1: Exploration (FP1)

## My Library: (net/...)
My name: John Summers

To begin created a basic web scrapper using the 'net' lirbary, specifically the /url, /url-structs, and /sendurl sublibraries. This is simply done in Rachet by using the net/url dependency to perform a HTTP GET command and displaying its contents via the our Rachet IDE. It will also open up the corresponding webpage for comparison b/w the raw HTML and its final product.

Code: 
```
(define google "http://google.com")
(define Google (string->url google))
(define in (get-pure-port Google #:redirections 5))
(define out-WB (send-url google))
(define out-TXT (display-pure-port in))

```
Output:

![test image](/FP-Output.png ?raw=true "FP Output")

