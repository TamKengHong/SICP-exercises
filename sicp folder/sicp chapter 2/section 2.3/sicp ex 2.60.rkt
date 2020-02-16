#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
;this stays same as we still have to check all elements of the set to see
;if they equal. o(n) time complexity for both

(define (adjoin-set x set)
  (cons x set))
;since dont need check for duplicate, just cons x to the set. o(1)
;compared to o(n)

(define (union-set set1 set2)
  (append set1 set2))
;dont need check for duplicate so its just appending the lists tgt. o(n)
;compared to o(n^2)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
;stays same as we have to check for each element in set 1, whether they
;equal to set 2. then we cons the thing tgt. o(n^2) for both.

;we can use this representation in preference if we have enough space
;to store the larger sets, since the time complexity of this representation
;is btr.