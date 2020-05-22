#lang sicp

;we shall use horners rule as mentioned wayyy earlier in the textbook.
;p = a0 + a1 x + a2 x^2 + a3 x^3... = a0 + x(a1 + x(a2...))
;its a recursive stream.

;to multiply, its like multiplying binomial expansions.
;lets say we have 2 streams, (a0 + s1) (b0 + s2), then,...
;ok nvm skipped as too hard, couldnt find the pattern or solve

(define (mul-series s1 s2)
  (cons-stream
   (* (stream-car s1) (stream-car s2))
   (add-stream (mul-series (stream-cdr s1) (stream-cdr s2)))))
               
   