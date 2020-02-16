#lang sicp
;we added min and max to make sure they will always be upper and lower bound.
(define (lower-bound i) (min (car i) (cdr i)))
(define (upper-bound i) (max (car i) (cdr i)))