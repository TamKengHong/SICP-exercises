#lang sicp
(define (make-accumulator initial)
  (define (sum a)
    (begin (set! initial (+ a initial))
           initial))
  sum)
;ok what we do here is we must define an internal procedure for it to sum up
;the arguments. So a sum is just setting the initial value to become
;a + initial, then return the initial value. Then, make-accumulator procedure
;is just the sum procedure, where u can input diff values to sum.

(define A (make-accumulator 5))