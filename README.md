# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: 2htdp/universe 2htdp/image 2htdp/planetcute

My name: Devon Hills

### What I Did:

I browsed through the libraries available, and decided to focus on the image/universe libraries for this introductory assignment. As a visual learner, it's easier to get a grasp on learning something that I can easily see the results of! I dont know if my final project will involve these libraries, but I definitely like playing around with them. The image library gives a basis for creating and modifying shapes and custom designs. This block creates the basis for stacking planetcute graphic tiles to create a fleshed out environment.
```
(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (underlay/xy (first imgs) 0 80
                          (stack (rest imgs)))]))
```

Then I used the planetcute library simply to build a small world with premade sprites and graphics, aligning all columns of tiles along the bottom of the background.
```
(define background
  (beside/align
   "bottom"
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))
   (stack (list grass-block water-block water-block water-block water-block water-block grass-block))))
```

The universe library is used to build it all into a runnable window, where I simply tested the animation feature of universe, and made my "castaway" sprite drift across a river on a block of wood.
```
(define (drift t)
  (place-image castaway (- width t) (/ height 2) background))

(define castaway (overlay/xy character-boy 0 40 wood-block))

(animate drift)
```

All of this produces the following (in a live view, he drifts across the screen from right to left):

![test image](/testimage.png?raw=true "my output")
