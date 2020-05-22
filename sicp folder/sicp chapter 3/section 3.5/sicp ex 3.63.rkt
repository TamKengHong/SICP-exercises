#lang sicp

;his procedure calls sqrt-stream x at the end, instead of guesses. What this
;does is that it recomputes the whole sqrt-stream from the start again for
;each call of cdr. While guesses just takes the previous value stored as a
;local variable and then computes that.

;the two versions would probably not differ in efficiency if delay wasnt
;memoised. (idk)