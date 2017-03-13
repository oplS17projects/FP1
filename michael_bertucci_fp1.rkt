#lang racket

;; Michael Bertucci
;; OPL Exploration 1
;; JSON parsing library

(require json)

;; Testing with example JSON messages from JSON's own site json.org
;;{"menu": {
;;  "id": "file",
;;  "value": "File",
;;  "popup": {
;;    "menuitem": [
;;      {"value": "New", "onclick": "CreateNewDoc()"},
;;      {"value": "Open", "onclick": "OpenDoc()"},
;;      {"value": "Close", "onclick": "CloseDoc()"}
;;    ]
;;  }
;;}}

;; Converting the JSON string to a Racket expression
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

;; Checking if writing the input on one line affects the format of the output.
;; Result: It doesn't. The procedure output still has proper indentation, etc.
(string->jsexpr "{\"menu\": {\"id\": \"file\",\"value\": \"File\",\"popup\": {\"menuitem\": [{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},{\"value\": \"Open\", \"onclick\": \"OpenDoc()\"},{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}]}}}")

;; Trying out just the inner array part
(string->jsexpr "[
      {\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},
      {\"value\": \"Open\", \"onclick\": \"OpenDoc()\"},
      {\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}
    ]")

;; Same expression but missing a bracket, so should throw an error.
;; Result: It does throw an error, so commented it out for now to allow code
;;  below it to continue.
;(string->jsexpr "[
;      {\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},
;      {\"value\": \"Open\", \"onclick\": \"OpenDoc()\",
;      {\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}
;    ]")

;; Using the jsexpr? predicate
(jsexpr? (string->jsexpr "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}")) ;#t
(jsexpr? "10") ;#t
(jsexpr? 10) ;#t
(jsexpr? '(4 5 6)) ;#t
(jsexpr? #hasheq((onclick . "CreateNewDoc()") (value . "New"))) ;#t
(jsexpr? #hasheq((onclick . CreateNewDoc) (value . New))) ;#f
(jsexpr? "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}") ;#t
;(jsexpr? (string->jsexpr "{\"value\" \"New\", \"onclick\" \"CreateNewDoc()\"}")) ;error

;; Converting Racket expressions to JSON strings
(jsexpr->string (string->jsexpr "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}"))

(jsexpr->string (string->jsexpr "{\"menu\": {
  \"id\": \"file\",
  \"value\": \"File\",
  \"popup\": {
    \"menuitem\": [
      {\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"},
      {\"value\": \"Open\", \"onclick\": \"OpenDoc()\"},
      {\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}
    ]
  }
}}"))

(jsexpr->string #hasheq((test1 . 5) (test2 . "str_1") (test3 . #hasheq((test4 . 100)))))