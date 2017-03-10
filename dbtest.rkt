#lang racket
(require sql db)
(require net/url)
(require csv-reading)

;; create a db
(sqlite3-connect #:database "my.db"
                   #:mode 'create)

;; db connection
(define conn (sqlite3-connect #:database "my.db"))


;; define list of iris data directly from url
(define iris_url "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")
(define iris ((compose csv->list get-pure-port string->url) iris_url))


;; define list of iris data from .csv file
(define filename "irirs.data.csv")
(define (csvfile->list filename)
  (call-with-input-file filename
                        csv->list))

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

;; insert statement string
(define insert_iris "INSERT INTO iris(sepal_len, sepal_width, petal_len, petal_width, class)  
VALUES (?, ?, ?, ?, ?)")


;; use statement above to insert a row into iris db
(query conn insert_iris
       "5.1" "3.5" "1.4" "0.2" "Iris-setosa")

;; creating an insert statement using sql lib
(insert #:into iris #:set (sepal_len "5.9") (sepal_width "3.0") (petal_len "5.1") (petal_width "1.8")
        (class "Iris-virginica"))


;; see how many rows, should return a list of rows (as vectors), in this case a list of a single zero
;; vector
(query-rows
 conn
 "select count(*) from testing")

;; return all the rows in iris 
(query-rows
 conn
 "select * from iris")

;;close database
(disconnect conn)