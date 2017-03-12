## My Library: (2htdp/image), (2htdp/universe)
My name: **Molly McGuire**

The goal of my project is to simulate the classic flash game, Bubble Trouble 2, thourgh using simulated physics, a graphic user
interface, and frame updates. In this exploration, I gravitated towards making the basics for this game. The game consists of
mulitcolored balls that vary in size when interacted with. I decided to use the image library from 2htdp do to so.
```
(define BALL1 (circle 10 160 "red"))
(define BALL2 (circle 15 200 "green"))
(define BALL3 (circle 20 180 "yellow"))
```
I then chose a background that emulated that of the original game, and had all images interact using the image library once again. 
```
(overlay (beside (beside BALL1 BALL2) BALL3) DUNGEON)
```
After completing this task, I decided that I would try to animate this feature, seeing that this is a flash game that most 
definately needs to show changes in frames. 
```
(define (base_scene height)
  (underlay/xy DUNGEON 500 height (beside BALL3 (beside BALL1 BALL2))))
(define (next_scene height)
  (underlay/xy base_scene 50 height BALL1))
  
  (animate base_scene)
```

The following was produced: 
![output](/output.png?raw=true "output")
 
This background image was found at: https://www.pinterest.com/sashabilton/dwimmermount/
