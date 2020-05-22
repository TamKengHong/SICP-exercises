#lang sicp

(define (integrate-series s)
  (mul-stream s
              (stream-map / ones integers)))

;i found a btr solution online which is just (stream-map / s integers) wow.

;part b: integrate cos to get sin, int sin to get -cos. so they refer to
;each other.

(define cosine-series (cons-stream 1 sine-series))
(define sine-series (cons-stream 0 (scale-stream cosine-series -1)))