#lang sicp
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))
;first we copy paste the code
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
;after testing some primes in the code, i found that *** is produced
;for prime numbers, and non primes dont have.
(define (searchprime first last)
  (cond ((<= first last) (searchprime (+ first 2) last)))
  (timed-prime-test first))
;i coded out an iterative for loop for timed-prime-test (it only
;works when u give it an odd first integer)