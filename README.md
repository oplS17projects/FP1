## My Library: html-writing
My name: Raphael Megali

I used the html-writing library to create a simple webpage in html from racket. 


Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

'''
(define out (open-output-file "webpage.html"))

(write-html
 '((html (head (title "My Title"))
         (body (@ (bgcolor "white"))
               (h1 "My Heading")
               (p "This is a paragraph.")
               (p "This is another paragraph."))))
 out)

(close-output-port out)
'''

