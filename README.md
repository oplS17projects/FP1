## My Library: JSON
My name: Cassandra Cooper

I created a (very) basic task list manager, which stores its data in a JSON file. The manager supports the creation of a single task list, the addition of new tasks to that list, and overriding the list with a new one. Tasks have a name and due date field.

The JSON library implements json objects as hash tables, and stores them using Rackets hash table objects (particularly, immutable hash tables which use eq for comparisons). Hash tables can be created from lists of cons cells, where the car of the cell is the key and the cdr of the cell is the value. The code for creating a new task object simply creates a hash table with "name" and "due" keys:
```
(define (makeTask name due)
  (make-immutable-hasheq
   (list
    (cons 'name name)
    (cons 'due due))))
```
The rest of the data structure follows pretty simply. The top level object has only one key, tasks, which contains a list of task objects. Here's a sample task object in JSON:
```
{
	"tasks": [
		{
			"name": "OPL Exploration 2",
			"due": "26 Mar 17"
		},
		{
			"name": "OPL Exam 2", 
			"due":"27 Mar 17"
		},
		{
			"name":"OS HW 4",
			"due":"28 Mar 17"
		}
	]
}
```

The JSON library itself comes with functions to write the objects to file. All the library consumer needs to do is provide a port connected to the file. This is demonstrated in the `overrideTaskList` function, which takes a list of task pairs and overrides the existing task list with them:
```
(define (overrideTaskList taskPairs)
  (let ([out (open-output-file taskFile #:exists 'truncate)])
    (begin
      (write-json (makeTaskList taskPairs) out)
      (close-output-port out))))
```

A basic interaction cycle can be seen below:
![Sample Output](/output.png?raw=true "output")

