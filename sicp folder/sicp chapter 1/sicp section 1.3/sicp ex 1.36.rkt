#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
;ok we want the number to display for every guess, so we put display in try.
 (define solution1 (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))
;this takes 34 steps before giving me solution 1

 (define solution2 (fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 2))
;this takes 9 steps before giving me solution 2
;this is because avg damping makes the guess deviate less
;so it converge faster