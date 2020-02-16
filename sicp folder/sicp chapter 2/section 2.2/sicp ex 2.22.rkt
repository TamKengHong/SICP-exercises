#lang sicp

;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things)
;              (cons (square (car things))
;                    answer))))
;  (iter items nil))

;his code produces ans list in reverse order as he consed the first value
;to the answer first, resulting in the first value being at the last part
;of the list and so on.

;(define (square x) (* x x))
;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things)
;             (cons answer
;                   (square (car things))))))
; (iter items nil))

;this doesnt work as he keeps constructing the answer which is nil at first
;to the (square car things). Thus nil will get constructed to the "list"
;many times throughout, resulting in the answer not being a list as the
;car of the answer will be nil as you run down the answer.
;just to test:
;> (square-list (list 1 2 3 4 5))
;(((((() . 1) . 4) . 9) . 16) . 25)