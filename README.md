## My Library: net/url
My name: Cameron Campbell

I used the net/url library to grab the weekly trending videos from YouTube. Regular Expressions were used in order to find the title of each trending video. The amound of videos it will find is user specified, but must be greater than 0 and less than 25 (YouTube only puts the top 24 Weekly trending). These titles are added to a list and displayed in order from #n - #1.

regex used to find a video title:
```racket
(define title-regex #px"[:alnum:]\"\\s\\stitle=\"[a-zA-Z 0-9.~|()!@#$%^&*+=\\-_'/]*")
```
A title on YouTube is typically just numbers and letters, but many include a few of the symbols seen above.

![screen_shot](/screenshot.png?raw=true "screen shot")
- YouTube Weekly Trending (https://www.youtube.com/feed/trending)
