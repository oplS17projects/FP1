#lang racket

(require sql db)


;; opens up connection to database
;; I use a local one on my pc

(define sqlc
  (sqlite3-connect #:database "test.db" ))

;; The "db" library takes care of making the connection and performing
;; "query-exec" commands.
;; The "sql" library provides functions that produce opaque SQL statement objects.
;; These are represented as strings, but if passed to "query-exec <db_connection>"
;; the equivalent SQL statement will be performed on the associated database.


;;*************************************************************************;;
;;A few SQL statements written in Racket, and output as string...
;; ** These do not actually do anything to SQLite db, need query-exec for that**

;;create-table statement

(create-table #:temporary tmp_table
                          #:columns [first_n varchar] [last_n varchar] [age integer #:not-null])


;;;; two equivalent insert statements

(insert #:into tmp_table #:set [first_n "james"] [last_n "goguen"] [age 21])

(define jim "james")
(define jim_last "goguen")
(define jim_years 21)

(insert #:into tmp_table #:set [first_n ,jim] [last_n ,jim_last] [age ,jim_years])


;;select statement

(select first_n last_n age #:from tmp_table #:where (> age 18))


;;********************************************************************************;;

;;********************************************************************************;;
;; use different query functions from db library to perform SQLite statements on actual database

;;create a temporary table

(query-exec sqlc
            (create-table #:temporary student_age_tmp
                          #:columns [first_n varchar] [last_n varchar] [age integer #:not-null]))



;; Three ways to pass values to statements passed to query,
;; the second using a lambda like structure with query-exec,
;; the third using unquoting symbol ','

(query-exec sqlc
            (insert #:into student_age_tmp #:set [first_n "james"] [last_n "goguen"] [age 21]))

(query-exec sqlc
            (insert #:into student_age_tmp #:set [first_n ?] [last_n ?] [age ?]) "james" "goguen" 21)

(define fn "jimmy")
(define ln "giguen")
(define a 21)

(query-exec sqlc
            (insert #:into student_age_tmp #:set [first_n ,fn] [last_n ,ln] [age ,a]))


;; Use query, not query-exec to actually retrieve data using select statement

(query sqlc
       (select first_n last_n age #:from student_age_tmp #:where (= age 21)))
(query sqlc
       (select first_n last_n age #:from student_age_tmp #:where (= first_n "james")))


;; Already called this, calling again gives error for table is created in db already
;(query-exec sqlc
;           (create-table ages
;                        #:columns [age integer]))


;;clears all rows from table 'ages' with age >= 0 ... so all rows

(query-exec sqlc
            (delete #:from ages #:where (>= age 0)))


;; Here is a Racket function which will add the integers 0 through num to the 'ages' single integer column table in database

(define (add-ints-to-ages num)
  (if (= num 0)
      (query-exec sqlc (insert #:into ages #:set [age 0]))
      (begin (add-ints-to-ages (- num 1)) (query-exec sqlc (insert #:into ages #:set [age ,num])) )))

;;add 0->10 to 'ages' table

(add-ints-to-ages 10)

;; some join functionality
;;
;; create two temporary tables, fill them with values, select teams and their wins
;; joined together based upon the likeness of city_n column value

(query-exec sqlc
            (create-table #:temporary baseball_teams
                          #:columns [bteam_n varchar] [city_n varchar] [wins_b integer]))


(query-exec sqlc
            (create-table #:temporary football_teams
                          #:columns [fteam_n varchar] [city_n varchar] [wins_f integer]))

;; create two baseball teams

(query-exec sqlc
            (insert #:into baseball_teams #:set [bteam_n "Yankees"] [city_n "New York"] [wins_b 20]))
(query-exec sqlc
            (insert #:into baseball_teams #:set [bteam_n "Red Sox"] [city_n "Boston"] [wins_b 100]))

;; create two football teams

(query-exec sqlc
            (insert #:into football_teams #:set [fteam_n "Jets"] [city_n "New York"] [wins_f 10]))

(query-exec sqlc
            (insert #:into football_teams #:set [fteam_n "Patriots"] [city_n "Boston"] [wins_f 100]))

;; select ( baseball_team, wins ; footballteam, wins) from either table, where both table rows share same city_n

(query sqlc
       (select bteam_n wins_b fteam_n wins_f #:from (inner-join baseball_teams football_teams #:on (= baseball_teams.city_n football_teams.city_n ))))