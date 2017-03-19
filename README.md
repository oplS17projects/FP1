## My Library: 2htdp/image
My name: Jacob Phillips

Using the 2htdp/image library I played around with the functions to produce a Boston Celtics logo. To start I made a darkgreen rectangle with a white circle inside and the word Celtics with the following code:
```
#lang racket

(place-image
 (text "Celtics" 40 "white")
 96 20
 (place-image
  (circle 72 "solid" "white")
  96 108
  (rectangle 192 192 "solid" "darkgreen")))
```
This produced this:

![Selection_002](/Selection_002.png?raw=true "Selection_002")

Then I added six ellipses to form the three pedals for the clover on the logo. I figured if I positioned them right two ellipses could form a pedal. After playing with the positions for a long time I was able to get something that looked relatively similar. After that I used the scene+curve function to add a curve for the stem of the clover. Once again after playing with it for a little while I got it to look pretty good.
The final result:

```
#lang racket

(require 2htdp/image)

(place-image
 (rotate 210(ellipse 45 25 "solid" "darkgreen"))
 111 110
 (place-image
 (rotate 150(ellipse 45 25 "solid" "darkgreen"))
 111 110
 (place-image
 (rotate 120(ellipse 45 25 "solid" "darkgreen"))
 96 90
 (place-image
 (rotate 60(ellipse 45 25 "solid" "darkgreen"))
 96 90
 (place-image
 (rotate 330(ellipse 45 25 "solid" "darkgreen"))
 81 110
(place-image
 (rotate 30(ellipse 45 25 "solid" "darkgreen"))
 81 110
 (place-image
  (text "Celtics" 40 "white")
  96 20
  (place-image
   (scene+curve
    (circle 72 "solid" "white")
    74 80 180 1/2
    89 105 90 1/2
    (make-pen "darkgreen" 7 "solid" "round" "round"))
   96 108
   (rectangle 192 192 "solid" "darkgreen")))))))))
```

![Selection_003](/Selection_003.png?raw=true "Selection_003")
