# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017


## My Library: net/smtp
My name: Scott Mello

I used the net/smtp library as well a few others, such as net/head, and openssl.
The main purpose of what i did was to send email through Gnail using racket. 
The user is asked to input their Gmail and password, then it sends a test
email to their account. The following are my defines and the main procedure 
i used.

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

(smtp-send-message	 	
        server-address	 	 	 	 
 	 	from	 	 	 	 
 	 	to	 	 	 	 
 	 	header	 	 	 	 
 	 	message	 	 	 	 
 	 [	#:port-no port-no/k	 	 	 	 
 	 	#:auth-user user	 	 	 	 
 	 	#:auth-passwd pw	 	 	 	 
 	 	#:tcp-connect connect	 	 	 	 
 	 	#:tls-encode encode	 	 	 	 
 	 	port-no])

        
The server-address is "smtp.gmail.com". The To and From fields are self
explanatory. port is optional but google recommends 587. tls-encode is using 
the SSL wrapper interface ports->ssl-ports

To create the header which consists of From, To, cc, bcc, and
subject fields, I used the standard-message-header procedure in the net/head
library.

(define header (standard-message-header From
                         (list To)
                         empty
                         empty
                         Subject))
                         


Output will be displayed in the image below
                         


![test image](/ps1_image.png?raw=true "test image")

