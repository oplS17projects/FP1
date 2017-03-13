# Final Project Assignment 1: Exploration (FP1)

## My Library: 2htdp/image 2htdp/universe
My name: Christopher Munroe

I made a simulator for 2D balls to bounce around in a small window. It uses 2htdp to render the animation. Most of my code is organized into two objects, MakeBall and MakeBallHouse. The ball house object symbolizes the larger encapsulating object which contains a list of balls and the dimensions of the space. The Ball object contains simple (x, y) location information and (x, y) velocity component vectors. To access the helper functions and attributes of the objects, it uses a dispatch paradigm (like the make-account examples we did in class).

The heart beat of the program: 
```
(big-bang 0 ; initial tick value (unused)
          (on-tick (ballHouse 'update))
          (to-draw (ballHouse 'render))
          (stop-when (lambda (x) #f)))
``` 
big-bang function repeatedly calls update on the ballHouse. The update function of ballHouse recursively calls the update function for each ball. Each ball's update function updates the x-pos by doing x-pos += x-velocity. If that resulting coordinate is out of bounds, it inverts the x-velocity and tries again. The same goes for the y-coordinate. 
the ball update procedure calls update-x and update-y which look like: 
```
(define (update-x)
    (begin
      (if (or (< (- (+ x xVel) radius) 0) (> (+ x xVel radius) SCENE-WIDTH))
        (set-xVel (* -1 xVel)) 0)
      (set-x (+ x xVel))))
```
After calling the on-tick procedure to update the position of all the balls, big-bang calls the to-draw function to update the screen. This is the ballHouse render function. It returns the image of a single frame. This function was the most interesting to me.
```
  ; generates the image for one frame of the entire animation
  ; tickTime is an unused parameter that is required by any to-draw procedure
  (define (render tickTime)
    ; tail-recursive helper function to repeatedly call place-image on an originally empty canvas.
    (define (render-helper balls scene)
      (if (null? balls)
          scene
          (let ([ball (car balls)])
            (render-helper (cdr balls)
                           (place-image (ball 'render)
                                        (ball 'x)
                                        (ball 'y)
                                        scene)))))
    (render-helper balls (empty-scene width height)))
```
place-image is a procedure from 2hdtp which superimposes an image onto another and returns the result. I start off by calling render-helper with an initial value of 'empty-scene' which is just a white canvas. On the first render-helper call it places the first circle in the list onto a blank canvas. Then for the next recursive call the next circle is placed on that merged image and so on until we have the entire frame rendered with all the circles. I went out of my way to make it tail-recursive to make it more efficient because it is a resource intensive procedure.

![Image of simulation](/myimage.png?raw=true)

<!-- Links -->
[schedule]: https://github.com/oplS17projects/FP-Schedule
