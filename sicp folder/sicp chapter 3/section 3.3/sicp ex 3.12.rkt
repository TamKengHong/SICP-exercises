#lang sicp
;the responses are:
;(b)
;(b c d)

;this is because append! sets last-pair x to be y, thus x becomes (a b c d)
;thus cdr x is (b c d), but for normal append, x is the same (a b) thus
;cdr x is just (b).