# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

#Part 1: Get github
If you don't have a github account, go get one. https://github.com/
This whole assignment will be done and submitted via github, and you're already here!
 
#Part 2: Try a Library
In this exercise, you will play with at least one library provided by the Racket developers. You will have the opportunity to explore another library later.

Please choose libraries that you think you might be interested in using in your final project.

Start off at the Racket home page, http://racket-lang.org/, and then click on the Documentation link, taking you here: http://docs.racket-lang.org/.
 
There are lots of libraries. Play with one.
 
Your job is to explore one library and write up your results. Load the library and write some code to drive it around.
For example, maybe you are interested in retrieving data from the web. If we look at the net/url library, we will find functions for creating URLs, issuing HTTP GET commands, and displaying the results. Here is a little bit of code for driving around a few of the functions in this library:
```racket
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```
Notice that `(require net/url)` is all you need to put in your buffer in order to load the library and start using it.
This above is a trivial example; to complete this for the purposes of this assignment (if you go down the path of pulling HTTP requests), you should use the parsing libraries to parse the HTML, JSON, or XML that is returned.

### The following libraries are not allowed for project explorations:
* games/cards
* racket/gui
* racket/draw 

You can still use these in your project, but you must explore different libraries for this assignment.

#Part 3: Write your Report
Write your report right in this file. Instructions are below. Delete the instructions when you are done. Also delete all my explanation (this stuff), as I've already read it.

You are allowed to change/delete anything in this file to make it into your report. It will be public, FYI.

This file is formatted with the [**markdown** language][markdown], so take a glance at how that works.

This file IS your report for the assignment, including code and your story.

Code is super easy in markdown, which you can easily do inline `(require net/url)` or do in whole blocks:
```
#lang racket

(require net/url)

(define myurl (string->url "http://www.cs.uml.edu/"))
(define myport (get-pure-port myurl))
(display-pure-port myport)
```

## My Library: sql db csv-reading
My name: Christopher Pearce

Write what you did!
Remember that this report must include:

For this assignment I tested out the sql db and csv-reading libraries, to test the csv-reading library I downloaded
the iris dataset from https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data and used compose to
store the result in a list of lists

```
#lang racket 
;; define list of iris data directly from url
(define iris_url "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")
(define iris ((compose csv->list get-pure-port string->url) iris_url))

;; define list of iris data from .csv file
(define filename "irirs.data.csv")
(define (csvfile->list filename)
  (call-with-input-file filename
                        csv->list))
```

To test out the db library I created a sqlite database "my.db" and created some a test table and a table to store the some rows of iris data in.

```
; create test table 
(query conn
            "create table testing(id integer Primary key autoincrement, test text not null)")
 
;; create table for iris dataset 
(query-exec conn
            "create table iris
(id integer not null primary key autoincrement,
sepal_len float not null,
sepal_width float not null,
petal_len float not null,
petal_width float not null,
class text not null)")
```

The third library I tested was the sql library. it has a framework to produce sql queries using values instead of strings in the examples below
```
;; use statement above to insert a row into iris db
(query conn insert_iris
       "5.1" "3.5" "1.4" "0.2" "Iris-setosa")
       
;; see how many rows, should return a list of rows (as vectors), in this case a list of a single zero
;; vector
(query-rows
 conn
 "select count(*) from testing")

;; return all the rows in iris 
(query-rows
 conn
 "select * from iris")

;; creating an insert statement using sql lib
(insert #:into iris #:set (sepal_len "5.9") (sepal_width "3.0") (petal_len "5.1") (petal_width "1.8")
        (class "Iris-virginica"))
```
the output of running the test code is below 
```
(object:connection% ...)
(simple-result '((insert-id . #f) (affected-rows . 0)))
(simple-result '((insert-id . 1) (affected-rows . 1)))
(sql-statement
 "INSERT INTO iris (sepal_len, sepal_width, petal_len, petal_width, class) VALUES ('5.9', '3.0', '5.1', '1.8', 'Iris-virginica')")
'(#(0))
'(#(1 5.1 3.5 1.4 0.2 "Iris-setosa"))
> iris
'(("5.1" "3.5" "1.4" "0.2" "Iris-setosa")
  ("4.9" "3.0" "1.4" "0.2" "Iris-setosa")
  ("4.7" "3.2" "1.3" "0.2" "Iris-setosa")
..............
..............
..............
  ("6.5" "3.0" "5.2" "2.0" "Iris-virginica")
  ("6.2" "3.4" "5.4" "2.3" "Iris-virginica")
  ("5.9" "3.0" "5.1" "1.8" "Iris-virginica")
(""))
```

![DB after inserts](sample.png)


The narrative itself should be no longer than 350 words. Yes, you need at least one image (output, diagrams). Images must be embedded into this md file. We should not have to click a link to see it. This is github, handling files is awesome and easy!

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule].

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

