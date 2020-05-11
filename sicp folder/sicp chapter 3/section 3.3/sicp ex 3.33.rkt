#lang sicp

;basically our relations would be: a+b = x, x/2 = c. and we fit this
;into our adder and multiplier respectively.

(define (averager a b c)
  (let ((x (make-connector))
        (y (make-connector)))
    (adder a b x)
    (multiplier c 2 x)
    (constant 2 v)))