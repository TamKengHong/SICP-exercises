#lang sicp
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))
;this just gives a + abs value of b, we substitute + or - operator
;depending on whether b is positive or negative