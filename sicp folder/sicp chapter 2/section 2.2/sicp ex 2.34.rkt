#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
                0
                coefficient-sequence))
;yes this is correct. what happens is we needed to nest the additions
;and multiplications, like this. (+ a0 (* x accumulate-rest-of-list))
;= (+ a0 (* x (+ a1 (* x ...restoflist)
;= (+ a) (* x (+ a1 (* x (+ a2...)))) all the way till it reaches an
;then it just evals the whole thing.