# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017


## My Library: net/url + html + xml + xml/path
My name: Chintushig Ochirsukh

I started out as playing with just the net/url library by learning how to open, display and close a port

(define my-url (string->url "https://www.reddit.com/r/DotA2/"))
(define my-port (get-pure-port my-url))
(display-pure-port my-port)
(close-input-port my-port)

Then it hit me. If i can convert any html files into actual readable xml files i can extract data from it.
However, my knowledge on this subject was very scarce so i had to google up stuff. Which lead me to this piece of code. 

(define (read-html-as-xexprs in) 
  (caddr
   (xml->xexpr
    (element #f #f 'root '()
             (read-html-as-xml in)))))
  
(define xe (call/input-url my-url                ;; source
                           get-pure-port         ;; creating a port
                           read-html-as-xexprs)) ;; function

(se-path*/list '(a #:href) xe)

I examined the code very thoroughly and found out that it was first reading the html as xml then turning it into xexpr
and extracting <a href> files. (Further comments are in the main code)
Also i found out that some websites redirects a lot.  
