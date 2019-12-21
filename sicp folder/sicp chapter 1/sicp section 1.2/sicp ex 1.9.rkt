#lang sicp
(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))
(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))
;first is recursive as it needs to keep memory of how many incs there
;are, so it blows up and shrinks in shape. second is iterative as the
;size of it is the same due to applicative order eval.