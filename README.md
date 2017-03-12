My name: Minh Nguyen

For this short assignment I did some research and took a look at the libraries available for Racket. What I chose even though might look unimportant at first,
however I think I will be using a lot for this project, is the while loop library. The creator of this library made it very intuitive, as long as you understand how while
loop operates, it will be a breeze using this. For the main project I was thinking of making an application that could continuously update a database using the information
extracted from websites, and I think this while loop will come in very handy. Here is a snippet that I created using the while loop.

```
#lang racket/base

 (require dyoo-while-loop)
 
(printf "Hello world! \n")
(printf "Do you want to see hello world again?\n")
(while (not (string=? (read-line) "no"))
  (printf "Hello world! \n")
  (printf "Do you want to see hello world again?  "))

(while #t
   (define input (read-line))
   (unless (regexp-match #px"no" input)
     (continue))
   (when (regexp-match #px"yes" input)
     (break)))
```
	 
This snippet basically prints out Hello World then asks the user if he/she wants to continue seeing it. Then it uses regular expression to sort out the answer to yes/no
and loop the program accordingly.

![Alt text](Users/minhn/Desktop/Untitled.png?raw=true "Screenshot")