#lang sicp
;lets first try it out
(define (f g) (g 2))
;error message. application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
;  arguments...:

;so what happened was; (f f) -> (f 2) -> (2 2)
;and 2 is not a procedure to be done to (2 2)