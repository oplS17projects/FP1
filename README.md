# Final Project Assignment 1: Exploration (FP1)
DUE DATE: Sunday, March 12, 2017

## My Library: simple-xlsx
My name: Sohit Pal

While handling data in Racket, it might be helpful to document it in a nicely formatted manner. With simple-xlsx, I hoped to find a way to organize, display, and tranfer data via Excel Spreadsheets.

To begin, install simple-xlsx using: ```raco pkg install simple-xlsx```

To create a new Excel spread sheet and insert data:

```racket
#lang racket

(require simple-xlsx)

(let ([xlsx (new xlsx%)])
  (send xlsx add-data-sheet
        #:sheet_name "Test Sheet"
        #:sheet_data '(("Name" "Age" "Address" "Favorite Food")
                       ("Joe Smith" 68 "123 Main Street" "Pasta")
                       ("John Doe" 25 "123 Main Street" "Oreos")
                       ("Jane Doe" 23 "123 Main Street" "Cheese Pizza")))
```

The resulting output in an Excel spreadsheet will look like this:

![excel spreadsheet image](/spreadsheetOutput.png?raw=true "excel spreadsheet image")

To read from a previously created Excel Spreadsheet:

```racket
#lang racket

(require simple-xlsx)

(let ([xlsx (new xlsx%)])
  (write-xlsx-file xlsx "file.xlsx")

  (with-input-from-xlsx-file "file.xlsx"
   (lambda (xlsx)
     (load-sheet "Test Sheet" xlsx)
     (printf "~a\n" (get-sheet-rows xlsx)))))
```

... and the resulting output (shown in Dr.Racket IDE):

![excel spreadsheet image](/drracketOutput.png?raw=true "excel spreadsheet image")
