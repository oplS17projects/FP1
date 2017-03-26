#lang racket

(require json)

; file path to store json data in
(define taskFile "tasks")

; read the task list from the json file
(define (readTaskList)
  (call-with-input-file taskFile read-json))

; Display the entire task list
(define (displayTasks)
  (define (iter list)
    (if (null? list)
        #t
        (begin
          (writeTaskObject (car list))
          (iter (cdr list)))))
  (iter (hash-ref (readTaskList) 'tasks)))

; Display a single Task object
(define (writeTaskObject Task)
  (begin
    (write "Task: ")
    (write (hash-ref Task 'name))
    (write ", Due: ")
    (writeln (hash-ref Task 'due))))

; Create a new task object
(define (makeTask name due)
  (make-immutable-hasheq
   (list
    (cons 'name name)
    (cons 'due due))))

; Create a new task list object
(define (makeTaskList taskPairs)
  (make-immutable-hasheq
   (list
    (cons
     'tasks
     taskPairs))))

; Create a new task with specified name and date and add it to the task list. Write result in json file.
(define (addTask name due)
  (let ([taskList (readTaskList)]
        [out (open-output-file taskFile #:exists 'truncate)])
    (begin
      (write-json
       (makeTaskList
        (cons ; add new task to list of existing tasks
         (makeTask name due)
         (hash-ref taskList 'tasks)))
       out)
      (close-output-port out))))     

; Create a new task list to override the existing one in json file
(define (overrideTaskList taskPairs)
  (let ([out (open-output-file taskFile #:exists 'truncate)])
    (begin
      (write-json (makeTaskList taskPairs) out)
      (close-output-port out))))