#lang sicp
(define (square x) (* x x))
(define (fast-expt b n)
  (define (expt-iter n a b)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (/ n 2) a (square b)))
          (else (expt-iter (- n 1) (* b a) b))))
  (expt-iter n 1 b))

;To solve this, we do a cumulative product on a. Note that when
;n is even, we square b and half n, so that the product remains
;constant. Also, i tried to square a instead but it didnt work because
;for example, at the start if n is even, squaring 1 is just pointless
;and gives the wrong ans. Therefore square b and half n.