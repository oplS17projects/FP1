## My Library: (library name here)
My name: Jonathan Murphy

I found the markdown library and the web-server library. My first idea was to write a markdown file and have it display to a webserver. And then I found [this guide](https://docs.racket-lang.org/markdown/index.html), and the following code from that guide is very close to that.

```
(require markdown)
(define xs (parse-markdown "I am _emph_ and I am **strong**."))
; xs = '((p () "I am " (em () "emph") " and I am " (strong () "strong") "."))
(display-xexpr `(html ()
      (head ())
      (body () ,@xs)))
```

The main difference is that I had to read it from a file and otuput it to a file which can be accomplished with the following:

	(define xs (parse-markdown (file->string "filename.md)))

Ok so that wasn't super exciting or hard, so I had another challenge, which was to have a text file with a list of text files and output them to a webpage. I concatinated the text files into appropriate html and then what I thought was a correct xexpr santax, but I couldn't figure it out. String->xexpr gave an error that I annotated in my [main.rkt](main.rkt) file.

So I went back to the working markdown file to webpage code and it works. Everything that failed is still in the directory.

DrRacket Output and Firefox screenshots:

![Racket image](racketoutput.png?raw=true "test image")
![Firefxo image](browser.png?raw=true "test image")