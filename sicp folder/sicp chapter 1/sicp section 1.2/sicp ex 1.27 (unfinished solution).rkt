#lang sicp
;copy paste everything we need
(define (square x) (* x x))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (full-fermat-test n)
  (define (fermat-iter a n)
    (cond ((< a n) (fermat-iter (+ a 1) n))
          ((= (expmod a n n) a) true)
          (else false)))
  (cond
    ((and (fermat-iter 1 n)) true)
    (else false)))
   

;modify fermat test to go from 1 to n
;problem: i dont know how to make the thing iterate giving
;true or false for each, then feed that input back into fermat test
;and check all to see if its true or false. its pretty hard. i will
;leave this unfinished for now.