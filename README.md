## My Library: net/url, html-parsing, xml, ports(built in)
My name: Ibrahim Mkusa

Write what you did!

I retrieved a web page via the net/url library. I then used html parsing to
convert the raw html to an X-expression(SXML). I converted the x-expression to
true xml via xml libraries xexpr-xml function. I then saved the xml of the page
to a local file by opening another port and writing the xml via a funciton
from the xml library. Html parsing was not included by default, and had to be
installed via raco pkg tool
The code is short and fits here nicely. I left out the require statements.
```
..
(define url1 (string->url "https://en.wikipedia.org/wiki/Tanzania"))
(define port1 (get-pure-port url1))
(define sxml1 (html->xexp port1)) ;; converts html to an x-expression
...
(define xml1 (xexpr->xml sxml1)) ;; converts to strict xml

;; create an output file for storing the files
(define out (open-output-file "./wikiTz.xml"))
(display-xml/content xml1 out)
(close-output-port out)
```

![test image](/wikiTz.png?raw=true "test image")

