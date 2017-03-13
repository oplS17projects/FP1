
## My Library: (math/statistics and plot)
My name: Joao Carlos Canto De Almeida

For this assignment, I have explored the math/statistics and plot library. 

First I started to play around with simple procedures from this library, that allowed me to do things such as find the mean, standard deviation, and variation of a list of reals. Then I began to think of ways that I could represent a real life problem using these tools. I found that I could represent discrete distributions using this library.  I was a little rusty on this subject, so I watched these two videos: https://www.youtube.com/watch?v=WWv0RUxDfbs and https://www.youtube.com/watch?v=NF0lrkqXIkQ. 

I decided to work with a Binomial Distribution, using a “real life” problem to illustrate it. Imagine that you are asked to toss a fair coin 5 times, and predict probability that you will get tails x times (where 0 < x <= 5). To create a Binomial Distribution object in racket, I needed two pieces of information. First how many times the coin was tossed (5 times) and the probability that it will result in tails in each trial (½ – head or tail). 

Once I had this object I could figure out the standard deviation, mean  of this distribution. But, most importantly it created a pdf in the form of a list, which gave me the probability of each x – which would help answer the question from above. But, I thought it would be neat if I could represent this distribution as a graph. So, I used the plot library to do so.


```racket
(define plot-bd (plot (discrete-histogram
         (map vector (build-list 6 values) (build-list 6 (distribution-pdf bd))))
                      #:x-label "number of heads" #:y-label "probability"))
;; it uses the pdf to build the discrete graph
```
![plotimg](/plotimg.png?raw=true "plotimg")

The last thing I did was a procedure that looks for the xth element in the pdf list; which would also answer the original question

```racket
(define (find-prob-of-x lst x)
  (if (= x 0)
      (car lst)
      (find-prob-of-x (cdr lst) (- x 1))))
```
![find_prob_of_x](/find_prob_of_x.png?raw=true "find_prob_of_x")

