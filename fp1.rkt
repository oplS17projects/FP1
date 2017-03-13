#lang racket
(require openssl)
(require net/head)
(require net/sendurl)
(require net/smtp)


;(send-url "www.google.com" #t)

(print "Enter Gmail")
(define user (read-line(current-input-port) 'any))
(print "Enter Password")
(define pw (read-line (current-input-port) 'any))

(define To user)
(define From To)
(define Body "This a test for PS1")
(define Subject "Library Fun")
(define server-address "smtp.gmail.com")
(define port-no 587)

(define header (standard-message-header From
                         (list To)
                         empty
                         empty
                         Subject))

(smtp-send-message server-address
                   From
                   (list To)
                   header
                   (list Body)
                   #:auth-user user
                   #:auth-passwd pw
                   #:port-no port-no
                   #:tls-encode ports->ssl-ports)