#lang racket
(require net/url)
(require json)

;;(define myurl (string->url "http://api.openweathermap.org/data/2.5/weather?zip=94040,us&APPID=1fce647522bdaea5dcce577570765ce5"))
;;(define myport (get-pure-port myurl))
;;(display-pure-port myport)

;;(define parse (htmlIn))

(display "Weather app\n")
(display "Please enter a zip code: ")


;;Create the web address by reading the zip code from the user
(define webSiteString (format "http://api.openweathermap.org/data/2.5/weather?zip=~a,us&APPID=1fce647522bdaea5dcce577570765ce5" (read-line)))

;;Test input because the openweathermap api is very strict about number of times you can access it
;;(define websiteOut "{\"coord\":{\"lon\":-122.08,\"lat\":37.39},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"base\":\"stations\",\"main\":{\"temp\":296.85,\"pressure\":1016,\"humidity\":46,\"temp_min\":293.15,\"temp_max\":302.15},\"visibility\":16093,\"wind\":{\"speed\":4.1,\"deg\":360},\"clouds\":{\"all\":40},\"dt\":1489791600,\"sys\":{\"type\":1,\"id\":451,\"message\":0.0106,\"country\":\"US\",\"sunrise\":1489760057,\"sunset\":1489803521},\"id\":5375480,\"name\":\"Mountain View\",\"cod\":200}")

(define websiteOut (get-pure-port (string->url webSiteString)))

;;Reads the json from the website and converts it into a 2d hash table
(define getJson (read-json  websiteOut))
;;Converts Kelvin to Fahrenheit
(define (kToF input) (round (-(* input (/ 9 5)) 459.67)))
;;Gets the weather hash table from the 2d has table
(define getWeather (car(hash-ref getJson 'weather)))
;;Gets the main hash table from the 2d has table
(define getMain (hash-ref getJson 'main))
;;Gets the wind hash table from the 2d has table
(define getWind (hash-ref getJson 'wind))

;;Use printf to print out the forecast
(printf "\nTodays forecast: ~a" (hash-ref getWeather 'description))
(printf "\nCurrent Temp: ~a degrees F" (kToF (hash-ref getMain 'temp)))
(printf "\nHigh Temp: ~a degrees F" (kToF (hash-ref getMain 'temp_max)))
(printf "\nLow Temp: ~a degrees F" (kToF (hash-ref getMain 'temp_min)))
(printf "\n\nWind speeds up to ~a miles per hour" (hash-ref getWind 'speed))

