#lang sicp

;(n-2) additions are performed as to get the next fib, just add one time.

;if the delay is not implemented with memoization, then, since fib is a
;recursive process which grows exponentially, there will be exponential
;additions as it will only perform addition on the base cases of fib 0 1.