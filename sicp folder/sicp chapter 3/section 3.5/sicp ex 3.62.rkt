#lang sicp
;so we have 2 series, s1 and s2. We want to get s1/s2.
;s1/s2 = s1 * (1/s2). we have the functions from the previous exercises.

(define (div-series num denom)
  (mul-series num
              (invert-unit-series denom)))

;for tangent, its sin/cos.

(define tangent-series (div-series sine-series cosine-series))