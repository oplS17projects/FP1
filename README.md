# Final Project Assignment 1: Exploration (FP1)
DUE Sunday, March 12, 2017

## My Library: (RSound)
My name: Ethan Cumming 

I used the RSound Library to import music. I could then visualize the musical frequency with built-in functions. I converted an mp3 in my music library to WAV format. I input the file using `(play(rs-read "test.wav"))` where play takes an ‘rsound’ object. My goal was to manipulate this piece of music to better understand the library. The track is broken down into frames. I determined I could use either:
```
(rs-read-frames "test.wav")
(rs-frames(rs-read "test.wav"))
```
to get the number of frames of my track.  I used `(clip (rs-read "test.wav") 0 1900000)` to isolate certain parts of the track. I also used the `(require rsound/draw)` module to draw a graph of the frames and varying frequencies as seen here:
![alt text](http://i.imgur.com/mvGo6nG.png "Graph")
I then tried three other manipulation functions on the track. First I used `(rs-overlay ding (clip (rs-read "test.wav") 0 1900000))` to combines two sounds. In this case I used the singular sound and my imported track. The resulting track had my imported track suppressed the sound of the ding. Next I tried `(rs-scale 5 (clip (rs-read "test.wav") 0 1900000))` which multiplied the music frames by a scalar value. This made the music sound distorted to the point where I could barely understand it. Lastly, I tested `(rs-mult (rs-read "test.wav")(rs-read "test.wav"))` where I squared the imported track. The result was an audible sound, but sounded robotic and annoying to the ears. Here is the graph for the squared track: 
![alt text](http://image.prntscr.com/image/77a087930a524fb7b2c75b9eb36c2d15.png)
I notice none of the lower y values are present. I assume this is due to no negative frequency after the `rs-mult`. To conclude my experiment with RSound, I tried the code examples at the bottom of the library's documentation. The results were neat however my knowledge of musical tech. prevented me from understanding how these sounds were produced. In that sense, aspects of this library are too advanced for me.


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

