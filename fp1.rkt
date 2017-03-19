#lang racket

(require racket/file)
(require binary-class/mp3)

(define nil '())

(define mypath (string->path "/home/delysid/Music"))
(define (mypred p) (string-suffix? (path->string p) ".mp3"))

(define myfiles (find-files mypred mypath))

(define (get-ids lst)
  (if (null? lst)
      nil
      (cons (read-id3 (car lst))
            (get-ids (cdr lst)))))

(define myids (get-ids myfiles))

(define (get-album ids artistname albumname)
  (define newids (filter (lambda (a) (and (string-ci=? (album a) albumname)
                                          (string-ci=? (artist a) artistname)))
                         ids))
  (define (make-list ids)
    (if (null? ids)
        nil
        (cons (string-append
               "(" (year (car ids)) ") " (artist (car ids)) " [" (album (car ids)) "] - " (song (car ids)))
              (make-list (cdr ids)))))
  (make-list newids))

(get-album myids "BONES" "Skinny")