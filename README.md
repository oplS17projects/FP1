## My Library: racket/draw
My name: Brian Medina

I decided to use the draw library to make some pictures. First of all, I loaded up some sample code provided in the basic documentation for pict constructors:

![triangle](/1.png "triangle")

First thing I did was change a few values in here to make sure I knew what they did.

```racket
(require pict
    racket/draw)

(dc (λ (dc dx dy)
        (define old-brush (send dc get-brush))
        (define old-pen (send dc get-pen))
        (send dc set-brush
          (new brush% [style 'transparent]
                      [color "black"]))
        (send dc set-pen
          (new pen% [width 3] [color "black"]))
        (define path (new dc-path%))
        (send path move-to 0 0)
        (send path line-to 100 0)
        (send path line-to 50 100)
        (send path close)
        (send dc draw-path path dx dy)
        (send dc set-brush old-brush)
        (send dc set-pen old-pen))
    100 100)
```

This gave me exactly what I expected:

![black triangle](/2.png "black triangle")

Now to unpack what this code is doing...

Documentation has this to say about the `dc` constructor:

```
    (dc draw w h [a d]) → pict?

  draw : (-> (is-a?/c dc<%>) real? real? any)
  w : real?
  h : real?
  a : real? = h
  d : real? = 0
```

So here's what I take this to mean:

`dc` is a procedure with 5 arguments. The first one is a procedure, which as the documentation states, `concocts a dc<%> object with a random initial state, calls the draw argument with that dc<%> and then checks to make sure that draw the state of the dc<%> object is the same as it was before draw was called.` I take this to mean `dc` needs to be given another `dc` that tells it what to do. Its contract says that it can do whatever it wants but it has to start out where it started originally in terms of state. We see this is satisfied because it starts out defining `old-brush` and `old-pen`, then sending that back. If the procedure didn't do that, the procedure would not run. The other 4 arguments say what the bounding box is - how far the brushes or paths can go.

Now there's a lot of other stuff in the lambda too, since it's what actually draws our rectangle. 

`brush%` sets what the fill of the triangle will be. In the first example, it's slate gray with diagonal hatching. I tried transparent in mine. I changed it to black as well, but I suppose I could just remove it because it's transparent anyway. 

`path` is something that is defined as a `dc-path%`, an object created by the `move-to` and `line-to` objects. The style is defined by `set-pen` above it, which I changed to black. `path` uses the `send` procedure, which is basic Racket syntax for sending the second argument to the first, both objects.

Finally, the `draw-path` is given the `path` object and draws it within dx and dy, the bounding box constraints of the lambda expression. I changed those to both be 100, double the size of the original one. 

So now I have a decent idea of the way this particular procedure works. It's used for "freeform" drawing of shapes and curves defined via paths, like vector images or something. But it's not the only `pict` to make. There are simpler ones.

```racket
(blank 50)
(text "text")
(hline 10 3)
(vline 4 100)
(ellipse 10 20)
(circle 30)
(disk 30)
(rectangle 100 50)
```

![pictures](/3.png "pictures")

These are also valid constructors that make pictures. Specifically, these are all `pict`, so anything in this library that does stuff with `pict` can also work on these things. For instance, `frame` draws a frame around a `pict`. 

For most of these things, they have style options accessed with `#:color`,`#:border-color`, `#:border-width`, and so on, depending on which `pict` object it is. 

Now, to control overlays of these images.

There's an entire page of combiners in the documentation I looked at. There's `vl-append` as well as a suite of other `-append`s that stick images next to each other. I use a non-recursive accumulator here because after trying to get normal for loops to work in Racket, I gave up and ended up amending [a user's Stackoverflow work](http://stackoverflow.com/questions/11660230/what-is-the-correct-way-to-append-via-loop-in-racket) because I've never used a non-recursive fold in Racket before. But here's what I learned:

```racket
(for/fold ((result (blank)))((i (in-range 29)))
  (lt-superimpose (circle (* i 10)) result))
```

`for/fold` is a special variant of for that uses accumulation like `foldl` or `foldr`. The first thing, `result`, is like the initial object that's added. `for/fold` then takes an argument that is the range for which it will do its stuff. `i` is index, as usual, and `in-range` returns a list as a stream up to 29. I could just as easily put in `'(1 2 3 4 5)` or something like that as well. Then the next argument is what I'm doing and it's the point of this exercise.

![spirals](/4.png "spirals")

As we can see, `superimpose` throws up new circles each time on top of the other one.

Now I can play with these things to make pictures using all sorts of combiners.