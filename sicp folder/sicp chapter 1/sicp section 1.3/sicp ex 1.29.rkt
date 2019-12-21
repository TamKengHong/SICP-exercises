#lang sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (cube x) (* x x x))
;now the hard part is finding out what to sum and how to sum it.
;the trick is to get all the terms out, then sum them just by incrementing
(define (simpint f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
;h and yk is easy to define
  (define (k-multiple k)
    (cond ((or (= k 0) (= k n)) 1.0)
          ((even? k) 2.0)
          (else 4.0)))
;we need to know what to multiply yk by, so this^
  (define (kth-term k)
    (* (k-multiple k)
       (y k)))
;to get the individual terms for summing^
  (* (sum kth-term 0 inc n)
     (/ h 3.0)))
                   