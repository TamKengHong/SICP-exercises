#lang sicp
(define (make-interval a b) (cons a b))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
;to get the lower bound of the new interval, its lowerbound x - upperbound y
;as this gives the smallest value, and then vice versa for upper bound.
(define (lower-bound i) (min (car i) (cdr i)))
(define (upper-bound i) (max (car i) (cdr i)))