this isn't done  yet. 

## My Library: 2htdp/image
My name: Steve Kim

Narrative: I played with a relatively simple library.  The libary 2htdp/image allows you to use function calls to produce shapes.  I started with printing text in a different color, then justmaking an circle and finally moved to making a line.  I combined the using the function add-line to make a null symbol in the REPL, whlile far from the most exciting was a facet of the language I was unaware existed.  I am considering utalizing this library in the form of a game.  One of the challanges will be to create a seperate window since compiling the game in the REPL will most likely not be  that impressive.  A secondary challange will make the game aesthetically pleasing which is an area I could improve on. 

Code Snipits: 
```
; self made null  
;(add-line image x1 y1 x2 y2 pen-or-color) → image?  
(define made-null (add-line (circle  30 'outline "red")0 0 60 60 "red")) 

; not mine but looks awesome
(define not-mine-complex1 (above`
   (beside (crop 40 40 40 40 (circle 40 "solid" "violet"))
           (crop 0 40 40 40 (circle 40 "solid" "red")))
   (beside (crop 40 0 40 40 (circle 40 "solid" "black"))
           (crop 0 0 40 40 (circle 40 "solid" "green")))))
```






