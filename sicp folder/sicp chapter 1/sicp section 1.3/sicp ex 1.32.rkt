#lang sicp
;quite easy just follow the format of sum and product, and edit accordingly
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
(define (square x) (* x x))
(define (identity x) x)
;time for iterative.
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
    (iter a null-value))