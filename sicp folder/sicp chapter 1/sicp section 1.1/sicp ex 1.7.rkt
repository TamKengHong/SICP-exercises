#lang sicp
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess)
             guess))
     0.001))
; i just changed it such that the change in guess
; is a small fraction 0.001.
(define (sqrt x)
(sqrt-iter 1.0 x))