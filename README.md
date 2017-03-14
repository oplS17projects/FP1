## My Library: sql / db
My name: James R. Goguen


* a narrative of what you did

 The first library I explored was actually firmata, which allows the control of microcontrollers via a serial port.
 After a handful of issues with using the library I decided to go wit hthe SQLite Structured notation package. The db (Database) library enables a Racket program to create a conenction to a few different database structures, one of which was SQL. The SQLite companion library to the db package, sql, provides Racket functionality for creating opaque objects representing SQL statements. These objects are output as strings if called alone, but are meant to be passed to the db package query functions. Through the passing of Racket defined "SQL statement" objects to the appropriate query function, a user can effectivitevely create and manipualte SQLite tabels in a provided database.
  I spent time going over SQLite syntax, then began to explore the libraries documentation. After learning how to define a connection to a database on my pc, I ran a few .rkt programs where I created, added to, and pulled data from some tables/ joined tables. Afterwards, I wrote the brief final program which stepped through how a Racket programmer can employ this functionality. 

* highlights of code that you wrote, with explanation


This statement opens up connection defined as sqlc, to my local SQLite database, test.
```
#lang racket

(require sql db)

(define sqlc
  (sqlite3-connect #:database "test.db" ))

```

Sql library provides Racket functions to produce SQL statements, these simply output as string if executed alone.
They do not actually do anything to SQLite db, need query-exec for that.

Creating create-table statement
```
(create-table #:temporary tmp_table
              #:columns [first_n varchar] [last_n varchar] [age integer #:not-null])
```

Creating insert statement
```
(insert #:into tmp_table #:set [first_n "james"] [last_n "goguen"] [age 21])
```

Creating select statement
```
(select first_n last_n age #:from tmp_table #:where (> age 18))
```

The db library provides query function, which can be passed an opaque SQL statement object to execute.
These executed statements can actually affect the databases tables.

Create a temporary table
```
(query-exec sqlc
            (create-table #:temporary student_age_tmp
                          #:columns [first_n varchar] [last_n varchar] [age integer #:not-null]))
```

Insert into table using lambda-like format with query-exec.
The ?'s are placeholders for succeeding values passed to query-exec.
```
(query-exec sqlc
            (insert #:into student_age_tmp #:set [first_n ?] [last_n ?] [age ?]) "james" "goguen" 21)
```

Use query, not query-exec to actually retrieve data using created select statement
```
(query sqlc
       (select first_n last_n age #:from student_age_tmp #:where (= age 21)))
```

Use the delete functionality to produce SQL delete statements for query-exec
This one will clears all rows from table 'ages' with age >= 0 ... so all rows
```
(query-exec sqlc
            (delete #:from ages #:where (>= age 0)))
```


![output image](/project_fp1_output.png?raw=true "output image")


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

