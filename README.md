## My Library: 2htpd (image and universe)
My name: Hung Q. Nguyen

Write what you did!

Initial thought: I wanted to make a circle that smoothly making a "Cardioid" animation.
More infomation about Cardioid: https://en.wikipedia.org/wiki/Cardioid

Result: Not quite as I expected because the value of alpha is not corresponding to the value of height when height get decreased by time.

What I did:
	- Using 2htpd image to create a circle with 50px as a radius and filled with blue color.

	```
	(define ball
		(circle 50 "solid" "blue"))
	```

- I define a function called "initscreen" to initialize a screen (500x500) and animate the ball with the equation x and y provided to make the "Cardioid" animation which is provided in the wiki page.

![alt tag](https://github.com/hnguyenworkstation/FP1/images/function.png)

	```
	(define (initscreen height)
	  (place-image ball
	               (+ 350 (* 2 (* 50 (* (cos height) (- 1 (cos height))))))
	               (+ 250 (* 2 (* 50 (* (sin height) (- 1 (cos height))))))
	               (empty-scene 500 500)))
	```

- I define a function bounding which will decrease 5px of the position of the height by each milisecond.

	```
	(define (bounding height)
  		(- height 5))
  	```

- Using the defined function big-bang in 2htpd universe to make run Cardioid animation for 5000/100 seconds (it will also stop when height reaches 0).

	```
	(big-bang 500
         (on-tick bounding)
         (to-draw initscreen)
         (stop-when zero?))
    ```

###### RESULT SCREENSHOT

![alt tag](https://github.com/hnguyenworkstation/FP1/images/result.png)

