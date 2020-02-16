#lang sicp
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

;(car (cons x y)) = (car (lambda (m) (m x y)))
;= ((lambda (m) (m x y)) (lambda (p q) p))
;this can be read as. ((procedure which takes in a procedure m, and does
; (m x y)). The input is then the procedure (lambda (p q) p))
;since it does the procedure (lambda (p q) p), this becomes
;= ((lambda (p q) p) (x y))
;this selects the first argument when the procedure is given 2 arguments.
;= x!!!

(define (cdr z)
  (z (lambda (p q) q)))