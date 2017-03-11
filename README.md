## My Library: html-writing
My name: Raphael Megali

I used the html-writing library to create a simple webpage in HTML from Racket. 

My program opens a new file for writing (index.html), converts what I wrote in Racket to HTML code,
then writes that code to the .html file I opened previously.
Then I can open the webpage from the new written file.

## Code exerpt:

```
(define out (open-output-file "index.html"))

(write-html
 '((html (head (title "Sample Webpage"))
         (body (@ (bgcolor "white"))
               (h1 "HEADER")
               (p "Hello world!")
               (p "This is a paragraph."))))
 out)

(close-output-port out)
```
## Screenshot of webpage
![alt tag](https://github.com/ramegali/FP1/blob/master/Sample%20Title.png)

*A screenshot of the resulting output is also included in this directory.*

