#lang sicp

;the bug is that the signal recieves the avpt as the last value, which means
;the next value of the signal would be the avpt of the avpt and so on,
;resulting in multiple averages troughout the signal. but what we want
;is just the comparing avgs of the original two signal values.


(define (make-zero-crossings input-stream last-value last-avg)
  (let ((avpt (/ (+ (stream-car input-stream)
                    last-value)
                 2)))
    (cons-stream
     (sign-change-detector avpt last-avg)
     (make-zero-crossings
      (stream-cdr input-stream) (stream-car input-stream) avpt))))