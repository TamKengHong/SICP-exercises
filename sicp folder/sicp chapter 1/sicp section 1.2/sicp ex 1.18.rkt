#lang sicp
;lets first set up everything we need/
(define (double x) (+ x x))
(define (halve x) (/ x 2))

;this is kinda similar to 1.16
(define (mul a b)
  (define (mul-iter n a b)
    (cond ((= n 0) a)
          ((even? n) (mul-iter (halve n) a (double b)))
          (else (mul-iter (- n 1) (+ b a) b))))
  (mul-iter b 0 a))
;the key is to realise that multiplication is repeated addition, eg
;mul (a,b) = a + a...+a for a total of b times. That way, its like
;fast expt but instead of b,n u have a,b. Edit code accordingly.