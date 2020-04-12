#lang sicp
;so we need to use set to return values of f differently.
(define (f x)
  (cond ((= x 0)
         (begin (set! f (lambda (x) 0)) 0))
        ((= x 1)
         (begin (set! f (lambda (x) 0)) 1))))

;ok this works, firstly, it evaluates the first f, then if x = 0, it sets
;f to be the procedure which always returns zero, and begin will give a
;value of 0 to the whole thing. Likewise if x=1, it sets f to be procedure
;which always returns 0 and then begin returns a 1.

;evaluating by hand: left to right:
;(+ (f 0) (f 1)) = (+ 0 (lambda (1) 0) = 0
;right to left:
;(+ (f 0) (f 1)) = (+ (lambda (0) 0) 1) = 1

;can test by switching f0 and f1 around since racket evals left to right.