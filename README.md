## My Library: racket/file and binary-class/mp3
My name: Benjamin Mourad

I am passionate about music, so I decided that the `binary-class/mp3` module
would be interesting to play with.

With help from `racket/file`, we search a specified directory recursively
using `find-files`, which returns a `(listof path?)`. We only care about
MP3 files, so we have our predicate account for this.
```
(define mypath (string->path "/home/delysid/Music"))
(define (mypred p) (string-suffix? (path->string p) ".mp3"))

(define myfiles (find-files mypred mypath))
```
Using this list of file paths, we make a list of id3 objects. This structure
contains tags for a given MP3 file, which consists of artist, album, year, genre,
song, and so on. The length of each "song" is not included.
```
(define (get-ids lst)
  (if (null? lst)
      nil
      (cons (read-id3 (car lst))
            (get-ids (cdr lst)))))

(define myids (get-ids myfiles))
```
From this, I had it output a formatted list of all the songs from a
specific album by a specific artist in string format.
```
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
```

Resulting output:

![test image](/testimage.png?raw=true "test image")

