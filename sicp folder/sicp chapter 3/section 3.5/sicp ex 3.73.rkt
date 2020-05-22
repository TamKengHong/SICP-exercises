#lang sicp

;lets just copy the formula as shown in fig 3.33

(define (RC R C dt)
  (lambda (i v0)
    (add-stream (scale-stream i R)
                (integral (scale-stream i (/ 1 C)) v0 dt))))