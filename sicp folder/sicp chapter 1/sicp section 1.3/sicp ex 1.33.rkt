#lang sicp
;just edit if procedure to add in filter. if its not true, then null.
;(define (filtered-accumulate filter combiner null-value term a next b)
;  (if (or (> a b) (not (filter a)))
;      null-value
;      (combiner (term a)
;                (filtered-accumulate filter combiner null-value term (next a) next b))))

;after plugging in some values i observed the code above only works for prime
;1 2 and 3. wtf?
;oh i understand why now. once it reaches a nonprime. it just returns null
;and never calls the next iteration of a.

(define (identity x) x)
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;now lets modify it so it actually works. lets use cond
(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
               (combiner (term a)
                         (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else (filtered-accumulate filter combiner null-value term (next a) next b))))
(define (sops n)
  (filtered-accumulate prime? + 0 square 1 inc n))
;ok this works now lets build a relatively prime filter.
;we copy paste the gcd code first.
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;just check for each x whether gcd(x,n) is 1.
(define (product-relative-primes n)
  (define (relatively-prime? x) (= (gcd x n) 1))
  (filtered-accumulate relatively-prime? * 1 identity 1 inc n))