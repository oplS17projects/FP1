# Final Project Assignment 1: Exploration (FP1)

## My Library: json
My name: Timothy Barber

For FP1, I made an application that retrieves the weather from the openweathermap.org web API and displays it for the user.
The user inputs the zip code they want for the city (US only). To read the user's input, I used the "read" method built into racket and then created the url `http://api.openweathermap.org/data/2.5/weather?zip=94040,us&APPID=1fce647522bdaea5dcce577570765ce5` where the zip was replaced by the user's input and the program will send that to the openweathermap API, and it will return the weather formatted in json. I used the json library, specifically the "read-json" method to turn the json into a 2-dimensional hash table using the code `(define getJson (read-json  websiteOut))`. The hash table returned from the request was consistent in its usage of sections so I was able to reference the section of the hash table and then the subsection of the element I wanted to display. For example, `(define getWeather (car(hash-ref getJson 'weather)))` was used as a method to return the weather section, which contained the current description of the weather (aka "cloudy" or "sunny"). `Car` was used since `'weather` was always at the head of the hash table. All others did not need to use `car` I then used the printf command to write `(printf "Todays forecast: ~a" (hash-ref getWeather 'description))`. The temperature was given in Kelvin, so I made a Kelvin to Fahrenheit converter `(define (kToF input) (round (-(* input (/ 9 5)) 459.67)))` and rounded the result to the nearest whole number using the built in round method.

The completed code gave the following output:
```
Weather app
Please enter a zip code: 01520
Todays forecast: clear sky
Current Temp: 37.0 degrees F
High Temp: 43.0 degrees F
Low Temp: 32.0 degrees F

Wind speeds up to 6.2 miles per hour
```

Diagram of Library interaction:

![Diagram](/Diagram.png?raw=true "Diagram")

