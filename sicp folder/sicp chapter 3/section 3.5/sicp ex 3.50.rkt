#lang sicp

;we fill in the details intuitively.
(define (stream-map proc . argstreams)
  (if (the-empty-stream? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))
  