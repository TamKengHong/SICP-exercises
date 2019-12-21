#lang sicp
(define (smooth f)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))
;this works
(define dx 0.00001)
(define (square x) (* x x))

;now copy paste repeated and its just a simple application of it from there.
(define (repeated f n)
  (lambda (x)
    (define (repeated-iter f n result)
      (if (= n 0)
          result
          (repeated-iter f (- n 1) (f result))))
  (repeated-iter f n x)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
;repeated smooth n will apply smooth to a function n times, so we
;pass f along to repeated smooth n for f to be smoothed n times.