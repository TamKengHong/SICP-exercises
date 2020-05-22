#lang sicp

;literally just x = 1 - Sr x as shown. convert to code.

(define (invert-unit-series S)
  (cons-stream
   1
   (scale-stream (mul-series (stream-cdr S)
                             (invert-unit-series S))
                 -1)))
                             