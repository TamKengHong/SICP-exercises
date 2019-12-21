#lang sicp
(define (cont-frac n d k)
  (define (recur i)
  (if (> i k)
      0
      (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))
(define (top i) 1)
(define (bottom i)
  (cond
     ((<= i 2) i)
     ((= (remainder (+ i 1) 3) 0) (* 2 (/ (+ i 1) 3)))
     (else 1)))
;from the pattern, we see that if i+1 is divisible by 3, then the value of
;di will be (i+1)/3 *2
(define (e-approx k)
  (+ 2 (cont-frac top bottom k)))