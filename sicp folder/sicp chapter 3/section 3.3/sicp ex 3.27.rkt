#lang sicp

;defining memo-fib to be (memoize fib) will not work as you would still
;compute the value of (fib n) before storing it, thus defeating the
;purpose of memoizing in the first place, as the values are not stored
;or called as fib calls another fib and so on, breaking the memoization.