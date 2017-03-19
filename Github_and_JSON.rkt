#lang racket

(require github-api)
(require json)

(define id (github-identity 'password (list "christianrdumas" "********")))

(define github (github-api id))
(write-json (github-response-data (github "/repos/christianrdumas/FP1")))