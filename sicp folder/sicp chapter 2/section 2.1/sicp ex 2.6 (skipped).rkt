#lang sicp

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;ok i just ran zero, (zero) and (add-1 zero) and they all give me procedures
;this is too hard. skip.