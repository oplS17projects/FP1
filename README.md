# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: simple-xlsx
Sim Dy

## What I Did:

I messed around with the simple-xlsx library. Based on the sample example provided through documentation, I learned that library has the ability to both read and write xlsx files. The library can also produce a variety of different graphs, charts, and can highlight and color different cells in the xlsx file. 

The graphs that are produced can be used to represent stock market data, which is what I am looking to do for final project. 

For example:

```racket
 
  (send xlsx add-chart-sheet #:sheet_name "BarChart3D" #:chart_type 'bar3d #:topic "BarChart3D" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "GOOG")
  (send xlsx add-chart-serial! #:sheet_name "BarChart3D" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "MSFT")

```

This section of code produces a 3D bar chart of the data.
![3D Bar Chart] (https://github.com/simthyrearch/FP1/blob/master/BarChart3D.png)

The data I've written into the xlsx file using:

```racket
  (send xlsx add-data-sheet
        #:sheet_name "DataSheet"
        #:sheet_data '(("month/company" "Price($)" "Change(%)" "Market Cap(B)")
                       ("AAPL" 100 3 200)
                       ("GOOG" 200 1 300)
                       ("MSFT" 300 5 400)
                       ))
```

Other graphs that can be produced include:

# Bar Chart
```racket
  (send xlsx add-chart-sheet #:sheet_name "BarChart" #:chart_type 'bar #:topic "BarChart" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B3-D3" #:y_topic "GOOG")
  (send xlsx add-chart-serial! #:sheet_name "BarChart" #:data_sheet_name "DataSheet" #:data_range "B4-D4" #:y_topic "MSFT")
```
![Bar Chart] (https://github.com/simthyrearch/FP1/blob/master/BarChart.png)

# AAPL Pie Chart
```racket
  (send xlsx add-chart-sheet #:sheet_name "AAPL PieChart" #:chart_type 'pie #:topic "AAPL PieChart" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "AAPL PieChart" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "AAPL PieChart" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
```
![AAPL Pie Chart] (https://github.com/simthyrearch/FP1/blob/master/AAPL%20PieChart.png)

# AAPL 3D Pie Chart
```racket
  (send xlsx add-chart-sheet #:sheet_name "AAPL PieChart3D" #:chart_type 'pie3d #:topic "AAPL PieChart3D" #:x_topic "$")
  (send xlsx set-chart-x-data! #:sheet_name "AAPL PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B1-D1" )
  (send xlsx add-chart-serial! #:sheet_name "AAPL PieChart3D" #:data_sheet_name "DataSheet" #:data_range "B2-D2" #:y_topic "AAPL")
```
![AAPL 3D Pie Chart] (https://github.com/simthyrearch/FP1/blob/master/AAPL%20PieChart3D.png)

# Impact on Final Project
I'm looking to make a web scraper which will pull stock market data out of Google Finance or Yahoo Finance, write into an xlsx file and produce graphics to demonstrate how the market has changed over days, months, or specific key cycles such as the US Election cycle. The simple-xlsx library is part of this project idea.
