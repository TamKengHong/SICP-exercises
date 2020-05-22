#lang sicp

;lets break this down recursively.
;1. list containing the current triple (i j k)
;2. i and j are the same, but k increases.
;3. i is the same, j increases, k is the same.
;4. i increases, j and k are same.

;actually u know what, we can just use pairs twice. first, pairs (i j),
;then pairs ((i j) k) to get the stream.

(define (triples i j k)
  (pairs (pairs i j) k))

;this way, i<=j , i and j <=k always. and we are done!!! abstraction ftw.

;now we set things up using stream-filter, the format for triples is
;((i,j) k) so we just deal with it using appropriate cars and cdrs.

(define pythagorean-triples
  (stream-filter
   (lambda (triple) (=
                     (+ (square (stream-car (stream-car triple)))
                          (square (stream-car (stream-cdr (stream-car triple)))))
                     (square (stream-car (stream-cdr triple)))))
   (triples integers integers integers)))
