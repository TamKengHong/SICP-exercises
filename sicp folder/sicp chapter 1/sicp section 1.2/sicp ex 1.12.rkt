#lang sicp
(define (pascal r c)
  (if (or (= r 1) (= r c) (= c 1))
      1
      (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))
; when row = 1 or row = column or column =1, this results in 1
; else, you take sum of the previous two pascal values above it.