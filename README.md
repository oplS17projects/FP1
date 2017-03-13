# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: JSON
My name: Michael Bertucci

I played around with the JSON library which converts JSON strings to Racket expressions and vice versa.
As a source of sample JSON text to feed to the library procedures I used this example from the JSON website (json.org):
{"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}

I first tried out converting the whole structure using the procedure `string->jsexpr`. To do this I first had to escape all the quotes in the original text.
```racket
(string->jsexpr "{\"menu\": {
  \"id\": \"file\",
  \"value\": \"File\",
  \"popup\": {
    \"menuitem\": [
      {\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},
      {\"value\": \"Open\", \"onclick\": \"OpenDoc()\"},
      {\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}
    ]
  }
}}")
```
This generated the output:
```racket
'#hasheq((menu
          .
          #hasheq((popup
                   .
                   #hasheq((menuitem
                            .
                            (#hasheq((onclick . "CreateNewDoc()") (value . "New"))
                             #hasheq((onclick . "OpenDoc()") (value . "Open"))
                             #hasheq((onclick . "CloseDoc()") (value . "Close"))))))
                  (id . "file")
                  (value . "File"))))
                  ```
The key-value pairs in the JSON objects are converted to Racket hash tables.
Next I tried out converting smaller portions of the text, like the array of menuitem objects:
```racket
(string->jsexpr "[
      {\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},
      {\"value\": \"Open\", \"onclick\": \"OpenDoc()\"},
      {\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}
    ]")
```
And the output was a list of hash tables:
```racket
'(#hasheq((onclick . "CreateNewDoc()") (value . "New")) #hasheq((onclick . "OpenDoc()") (value . "Open")) #hasheq((onclick . "CloseDoc()") (value . "Close")))
```
The JSON library adds a predicate for checking if a Racket expression is an expression representing JSON code, `jsexpr?`. I tried this out on a few different types of expressions:
```racket
(jsexpr? (string->jsexpr "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}"))
(jsexpr? "10")
(jsexpr? 10)
(jsexpr? '(4 5 6))
(jsexpr? #hasheq((onclick . "CreateNewDoc()") (value . "New")))
(jsexpr? #hasheq((onclick . CreateNewDoc) (value . New)))
(jsexpr? "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}")
(jsexpr? (string->jsexpr "{\"value\" \"New\", \"onclick\" \"CreateNewDoc()\"}"))
```
The last line was missing the colons separating the key-value pairs, so I expected it to fail. It threw an error to the REPL:
![Result of parsing malformed JSON](/parse_error_test.png?raw=true)

Lastly I did a couple tests in the other direction - converting Racket expressions to JSON with the procedure `jsexpr->string`. I first tried applying it to a nested call to `string->jsexpr`, to check that the JSON string that was passed in there would ultimately be returned again, and it worked as expected. I then tried applying it to some made up values to see how it would convert them:
```racket
(jsexpr->string #hasheq((test1 . 5) (test2 . "str_1") (test3 . #hasheq((test4 . 100)))))
```
And the JSON representation was returned:
```racket
"{\"test2\":\"str_1\",\"test3\":{\"test4\":100},\"test1\":5}"
```

