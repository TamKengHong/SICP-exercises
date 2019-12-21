#lang sicp
(define (fib x)
  (define (fib-iter n prev count)
    (if (= n 1)
        count
        (fib-iter (- n 1) count (+ prev count))))
  (if (= x 0) 0 (fib-iter x 0 1)))