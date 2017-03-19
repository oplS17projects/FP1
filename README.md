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

IMAGE HERE

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

IMAGE HERE

Remember that this report must include:

* a narrative of what you did
* highlights of code that you wrote, with explanation
* output from your code demonstrating what it produced
* at least one diagram or figure showing your work


The narrative itself should be no longer than 350 words. 

You need at least one image (output, diagrams). Images must be uploaded to your repository, and then displayed with markdown in this file; like this:

![test image](/testimage.png?raw=true "test image")

You must provide credit to the source for any borrowed images.

Code should be delivered in two ways:

1. Full files should be added to your version of this repository.
1. Key excerpts of your code should be copied into this .md file, formatted to look like code, and explained.

Ask questions publicly in the email group.

## How to Prepare and Submit this assignment

1. To start, [**fork** this repository][forking]. 
  2. (This assignment is just one README.md file, so you can edit it right in github)
1. Modify the README.md file and [**commit**][ref-commit] changes to complete your report.
1. Add your racket file to the repository. 
1. Ensure your changes (report in md file, and added rkt file) are committed to your forked repository.
1. [Create a **pull request**][pull-request] on the original repository to turn in the assignment.

## Project Schedule
This is the first part of a larger project. The final project schedule is [here][schedule].

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
[markdown]: https://help.github.com/articles/markdown-basics/
[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

