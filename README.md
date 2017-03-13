## My Library: data/gvector
My name: Nicholas Puopolo

I found this library on the site, and while it is mundane, I was curious if I could add some new functionality to it. I settled on creating a map function, as it wasn't included. I'll start off with the end result.


```
#lang racket
(require data/gvector)

(define (gvector-map3 gvec op num)
  (map-helper3 gvec op num 0))

(define (map-helper3 gvec op num count)
  (if (equal? count (gvector-count gvec))
      (void)
      (begin (gvector-set! gvec count (op num (gvector-ref gvec count)))
             (map-helper3 gvec op num (+ count 1)))))
```

The most important thing here is gvector-map3, specifically the 3. There were two map functions prior to this, plus a hardcoded scaling function I wrote to understand how the gvector functions work. Now, let's go back to the first version of map.

```
(define (gvector-map gvec op num)
  (map-helper gvec (make-gvector) op num))

(define (map-helper gvec new op num)
  (if (equal? gvec (make-gvector))
      new
      (begin (gvector-add! new (op num (gvector-ref gvec 0)))
             (gvector-remove! gvec 0)
             (map-helper gvec new op num))))

```

The first version of the function was iterative, emptying a vector and creating a new one. I tested for the original vector being empty (using the make-gvector, which returns an empty vector), if yes, return the new vector. Otherwise, make the wanted modification to the current element of the original, and put it in the new vector. Then, remove said element from the original. Finally, iterate with both the modified vectors.

This, obviously, isn't how map should work. I'll fix it step by step. First, let's stop it from emptying the original.

```
(define (gvector-map2 gvec op num)
  (map-helper2 gvec (make-gvector) op num 0))

(define (map-helper2 gvec new op num count)
  (if (equal? count (gvector-count gvec))
      new
      (begin (gvector-add! new (op num (gvector-ref gvec count)))
             (map-helper2 gvec new op num (+ count 1)))))
```

This was just a matter of adding a count variable, and using the gvector-count on the original. But, it's still doing stuff wrong. It's storing the result in a new vector. Also, the functions that modify gvectors return void, rather than the vector. Mine should do this as well, which brings us to where we started.

```
(define (gvector-map3 gvec op num)
  (map-helper3 gvec op num 0))

(define (map-helper3 gvec op num count)
  (if (equal? count (gvector-count gvec))
      (void)
      (begin (gvector-set! gvec count (op num (gvector-ref gvec count)))
             (map-helper3 gvec op num (+ count 1)))))
```

And, and example of it in work:

![Example](/gvec_map_example.png?raw=true "test image")
