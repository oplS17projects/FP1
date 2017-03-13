#lang racket

(require simple-xlsx)

(let ([xlsx (new xlsx%)])
  (send xlsx add-data-sheet
        #:sheet_name "Test Sheet"
        #:sheet_data '(("Name" "Age" "Address" "Favorite Food")
                       ("Joe Smith" 68 "123 Main Street" "Pasta")
                       ("John Doe" 25 "123 Main Street" "Oreos")
                       ("Jane Doe" 23 "123 Main Street" "Cheese Pizza")))
  
  (write-xlsx-file xlsx "file.xlsx")
 
  (with-input-from-xlsx-file "file.xlsx"
   (lambda (xlsx) 
     (load-sheet "Test Sheet" xlsx) 
     (printf "~a\n" (get-sheet-rows xlsx)))))