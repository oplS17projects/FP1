#lang racket
(require simple-qr)
(qr-code "Welcome to OPL" "opl.png")
(qr-code "https://github.com/mohammednayeem" "github.png" #:module_width 10)