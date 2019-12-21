#lang sicp
(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))
;first try:
;(define (repeated f n)
;  (lambda (x)
;    (if (<= n 1)
;        (f x)
;        (compose f (repeated f (- n 1))))))
;this doesnt work as compose returns a procedure and repeated is a procedure,
;thus the lambdas will stack. it returns procedure instead of 625.
;now lets just try a recursive implementation again.

;(define (repeated f n)
;  (lambda (x)
;     (define (recur n)
;      (if (<= n 1)
;        (f x)
;        (compose f (recur (- n 1)))))
;    (recur n)))
;ok failed again. Lets try a different approach.
;i think we should evaluate the expression inside out, starting from
;the innermost value first, therefore lets go with iterative.

(define (repeated f n)
  (lambda (x)
    (define (repeated-iter f n result)
      (if (= n 0)
          result
          (repeated-iter f (- n 1) (f result))))
  (repeated-iter f n x)))
; ok hell yea this works and i did not even use compose!
; so what happened was i do a (repeated f n) which takes an input x
; and feeds it into an iterative repeated compose thing.
; So what happened is since i now have a value of x,
; i just spam (f result) for n times to get a value of (f (f ... (f x)))
; this doesnt run into the problem of outputting a procedure
; as the result will always be a numerical value.