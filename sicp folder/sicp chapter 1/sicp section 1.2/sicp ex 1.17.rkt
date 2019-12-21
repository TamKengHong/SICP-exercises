#lang sicp
(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (mul a b)
  (cond ((= b 0) 0)
        ((even? b) (+ (mul (double a) (halve b))))
        (else (+ a (mul a (- b 1))))))
;just copy page 58 of the book but edit accordingly
                