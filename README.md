## My Library: github-api
My name: **Christian Dumas**

I first looked through the list of libraries we could use. I saw the github api and that looked pretty fun to use.

I used Racket's Package Manager to install the github-api package, but accidentally also installed the github package. I don't know what that does.

I then used the "require" line, as well as the example code. I had to go into the github api page to find out how to access the url for my github projects. I also had to unpack the github objects with a JSON parser, and structure accesses. My code produces data about the github for this project.

Shown below is the output for the program, but with the correct password instead of 8 asterisks.
![test image](/github_output.png?raw=true "test image")

This line of code does the heavy lifting.
`(write-json (github-response-data (github "/repos/christianrdumas/FP1")))`
