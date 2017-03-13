#lang racket
(require data/queue)

(define obj (make-queue))

(enqueue! obj 1)
(enqueue! obj 2)
(enqueue! obj 3)
(dequeue! obj)
(queue-length obj)
(queue->list obj)
(enqueue! obj 4)
(enqueue! obj 5)
(enqueue! obj 6)
(enqueue! obj 7)
(queue->list obj)
(queue-filter! obj odd?)
(queue->list obj)