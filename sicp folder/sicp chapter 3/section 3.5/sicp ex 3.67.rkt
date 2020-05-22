#lang sicp

;easy, instead of going down both cdrs, we only go down stream cdr s
;this is cuz, the stream is broken into 3 parts.
;1. the pair
;2. the rest of pairs in first row
;3. the rest of pairs in rest of rows (down cdr s)

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) t))))