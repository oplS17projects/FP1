## My Library: RackUnit
My name: Alexander Infantino

I decided to look into the unit testing library present in Racket. The reason for this is that writing unit tests are essential for any project. They ensure that your code works the way it is intended, and also help you better understand how your code works. At my job, I learned about the importance of unit testing, which is why I decided to look into this library.

Tests can be created, ran, and grouped in multiple ways. I decided to create a simple test-suite (a group of test cases and/or suites) to run various test cases (a group of checks that form one conceptual unit).

First, I created the most basic function.
```
(define (isFortyFive value)
    (= value 45))
```

This code simply checks to see if the number provided is equal to forty five.

I then created a test-suite to ensure that my function works as is expected. To test this function, I want to provided multiple checks where the result is false, and also one check where the result is true.

```
(test-suite
    "isFortyFive Test Suite"
    (test-case
        (check-false (isFortyFive -45))
        (check-false (isFortyFive 46))
        (check-false (isFortyFive 33)))
    (test-case
        (check-true (isFortyFive 45))))
```

This suite does a few things. First it checks that isFortyFive correctly returns false when -45, 46, and 33 are passed to it. Secondly, it checks that isFortyFive is true when 45 is passed to it. These are some basic checks that shows how easy unit tests are to write in racket, but you can get more complicated than that.

If you wanted your funtion to do some kind of calculation i.e. you had a function cube that cubes the number you provide it, you could provide test cases as so using various forms of check

```
...
    (check-eq? (cube 3) 27)
    (check-eq? (cube 2) 8)
    (check-not-eq? (cube 9) 1)
    (check-eq? (cube 999) 1 ["Error, cube of 99 is not 1"])
...
```

This shows that if for some reason your evaluation fails (the last expression should fail) you can even provided messages the explain what may have gone wrong.

Lastly, the rackunit library has a gui available to better organize and visualize the tests that you want to run (see image below).

![Image of Gui Test Runner]
(GuiExample.jpg)
