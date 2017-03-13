My Library: simple-qr
My name: Mohammed Nayeem
I chose to explore the simple-qr library. QR code because takes some text and scrambles it into a pattern. This pattern can be then interpreted by a QR reader which can then give back when your scrambled text is. This text can be a link or a phrase. Using the library, I was able to change the text, change what is embedded in the qr code, and change the size of the code. I have two images that I tested out. The first image has the phrase “Welcome to OPL”. 
(qr-code "Welcome to OPL" "opl.png")
The second code has an URL to my github.
This line of code just sets the text to the link of “Welcome to OPL” and sets the output image to opl.png. The size is given an default value in the background.
(qr-code "https://github.com/mohammednayeem" "github.png" #:module_width 10)
This line of code just sets the text to the link of my github, sets the output image as github.png, and changes the size of the image.

This is what the end result looks like when the QR code is printed with a larger size.
![GitHub Image](/github.png?raw=true "GitHub Image")
