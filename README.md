# Final Project Assignment 1: Exploration (FP1)
## My Library: (XML: Parsing and Writing)
My name: **Vibhuti Patel**

As part of exercise. I started off looking at racket library documentation. But one thing which I like to explore more and learn is
XML: Parsing and Writing library. Because, XML file format is used for many purposes of big project on professional level. I read whole
documentation on this library which is provided on website. Practice makes more understanding and perfect, so with this thought I started
coding some basic function and playing with it. From this learning I got to know that the XML library does not expand user-defined
entities or read user-defined entities in attributes. It does not interpret namespaces either.

I covered all points related to this library like : DataTypes, X-expression Predicate and Contract, Reading and Writing XML, XML and
X-expression Conversions, Parameters, Plist Library and simple X-expression path queries. I am giving some highlights of my code
which is covering Reading XML, Writing XML and figuring out path queries topics of library. 

### Reading XML
```racket
(display "Reads in an XML document")
(display "\n")
(xml->xexpr (document-element
               (read-xml (open-input-string
                          "<doc><bold>hi</bold> there!</doc>"))))
```

You can see in the code which is written above that Reads in an XML document from the given or current input port XML documents contain
exactly one element, raising xml-read:error if the input stream has zero elements or more than one element. There are other functions in
library like: read-xml/document and read-xml/element. read-xml and read-xml/document functions return output in document structure
datatype. This the below screen shot pic is the output of the above code.

![ouput image](/Screen-Shot-output-read-xml-fun.png?raw=true "ouput image")

### Writing XML
```racket
(display "*** Writes XML document ***")
(display "\n")
(display "\n")
(parameterize ([empty-tag-shorthand html-empty-tags])
    (write-xml/content (xexpr->xml `(html
                                      (body ((bgcolor "green"))
                                            (a ((front-size "big")) "Have a nice day")
                                        "Hello!" (br) "Good Bye!")))))
```


write-xml/content function writes document content to the given output port. empty-tag-shorthand parameter that determines whether
output functions should use the <‹tag›/> tag notation instead of <‹tag›></‹tag›> for elements that have no content. The html-empty-tags
constant contains the W3 consortium’s recommended list of XHTML tags that should use the shorthand. This list is the default value of
empty-tag-shorthand. 
   
![ouput-write-xml image](/Screen-Shot-output-write-xml-fun.png?raw=true "ouput-write-xml image")   
   
Thus, The xml library contains functions for parsing and generating XML. XML can be represented as an instance of the document
structure type, or an X-expression.

