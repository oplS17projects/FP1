# Final Project Assignment 1: Exploration (FP1)

```
#lang racket

(require graphics/graphics)

(open-graphics)
(define a (open-viewport "Graphics-lib" 500 500))
((draw-solid-rectangle a) (make-posn 50 40) 400 400)
(close-viewport a)
(close-graphics)
```

## My Library: Graphics: Legacy Library
My name: **Prachi Patel**

The view port graphics library is a relatively simple toolbox of graphics commands. 

I have used some basic commands of Graphics: Legacy library, (open-graphics) command initializes the library’s graphics routines which must be called before any other graphics operations. Third line of the code draws solid rectangle border in the viewport at given position with sides width across and height tall.  (close-graphics) closes all the windows.  

Mouse operation and keyboard operations are also useful tools of graphics library. It contains function that determine if there are any click or where the mouse is. Keyboard operations returns the value of the key that get pressed. 

![test image](/outputimage.png?raw=true "Output image")



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

