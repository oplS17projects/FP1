#lang racket
 
(require simple-xlsx)
 
(let ([xlsx (new xlsx%)])
  (send xlsx add-data-sheet
        #:sheet_name "DataSheet"
        #:sheet_data '(("month/company" "Price($)" "Change(%)" "Market Cap(B)")
                       ("AAPL" 100 3 200)
                       ("GOOG" 200 1 300)
                       ("MSFT" 300 5 400)
                       ))
  (send xlsx set-data-sheet-col-width! #:sheet_name "DataSheet" #:col_range "A-B" #:width 50)
  (send xlsx set-data-sheet-cell-color! #:sheet_name "DataSheet" #:cell_range "B2-D2" #:color "DBDDDE")
  (send xlsx set-data-sheet-cell-color! #:sheet_name "DataSheet" #:cell_range "B3-D3" #:color "00BCD4")
  (send xlsx set-data-sheet-cell-color! #:sheet_name "DataSheet" #:cell_range "B4-D4" #:color "8BC34A")
 
  (send xlsx add-chart-sheet #:sheet_name "LineChart1" #:topic "Horizontal Data" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B1-D1")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "GOOG")
  (send xlsx add-chart-serial! #:sheet_name "LineChart1" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "MSFT")
 
  (send xlsx add-chart-sheet #:sheet_name "LineChart2" #:topic "Vertical Data" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "A2-A4" )
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "B2-B4" #:y_topic "Price")
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "C2-C4" #:y_topic "Change")
  (send xlsx add-chart-serial! #:sheet_name "LineChart2" #:data_sheet_name "DataSheet" #:data_range "D2-D4" #:y_topic "Market Cap")
 
  (send xlsx add-chart-sheet #:sheet_name "LineChart3D" #:chart_type 'line3d #:topic "LineChart3D" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "A2-A4" )
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-B4" #:y_topic "Price")
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "C2-C4" #:y_topic "Change")
  (send xlsx add-chart-serial! #:sheet_name "LineChart3D" #:data_sheet_name "DataSheet" #:data_range "D2-D4" #:y_topic "Market Cap")
 
  (send xlsx add-chart-sheet #:sheet_name "BarChart" #:chart_type 'bar #:topic "BarChart" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "GOOG")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "MSFT")
 
  (send xlsx add-chart-sheet #:sheet_name "BarChart3D" #:chart_type 'bar3d #:topic "BarChart3D" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "GOOG")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "MSFT")
 
  (send xlsx add-chart-sheet #:sheet_name "AAPL PieChart" #:chart_type 'pie #:topic "AAPL PieChart" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "AAPL PieChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "AAPL PieChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
 
  (send xlsx add-chart-sheet #:sheet_name "AAPL PieChart3D" #:chart_type 'pie3d #:topic "AAPL PieChart3D" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "AAPL PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "AAPL PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
 
  (write-xlsx-file xlsx "test.xlsx")
 
  (with-input-from-xlsx-file
   "test.xlsx"
   (lambda (xlsx)
     (printf "~a\n" (get-sheet-names xlsx))
     ;("DataSheet" "LineChart1" "LineChart2" "LineChart3D" "BarChart" "BarChart3D" "AAPL PieChart" "AAPL PieChart3D"))
 
     (load-sheet "DataSheet" xlsx)
     (printf "~a\n" (get-sheet-dimension xlsx)) ;(4 . 4)
 
     (printf "~a\n" (get-cell-value "A2" xlsx)) ;201601
 
     (printf "~a\n" (get-sheet-rows xlsx))))
     ; (("month/company" "Price ($)" "Change (%)" "Market Cap(B)")("AAPL" 100 3 200) ("GOOG" 200 1 300)("MSFT" 300 5 400)))
  )
 
  (printf "~a\n" (sheet-name-rows "test.xlsx" "DataSheet"))
  ; (("month/company" "Price ($)" "Change (%)" "Market Cap(B)")("AAPL" 100 3 200) ("GOOG" 200 1 300)("MSFT" 300 5 400)))
 
  (printf "~a\n" (sheet-ref-rows "test.xlsx" 0))
  ; (("month/company" "Price ($)" "Change (%)" "Market Cap(B)")("AAPL" 100 3 200) ("GOOG" 200 1 300)("MSFT" 300 5 400)))
