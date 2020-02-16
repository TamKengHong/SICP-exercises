#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

;so what we gonna do is we check if x <= (car set) for the set, if it is,
;then keep moving down the list, otherwise, we can put x in that position
;as it will then follow the order. so we just keep consing either car set,
;x or the rest of the set (cdr set) to form a list as we go down.

(define (adjoin-set x set)
  (cond ((element-of-set? x set) set)
        ((>= x (car set)) (cons (car set) (adjoin-set x (cdr set))))
        (else (cons x set))))

;ok this works as described above.