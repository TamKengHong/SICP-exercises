#lang sicp

;so we want to see whether the list goes back to the same object.
;we have to keep track along the way, and if it goes back to the same
;object we terminate and say yes, if it reaches the end without going back
;we say no.

(define encountered-list '())

(define (cycle? x)
  (cond
    ((null? (cdr x)) false)
    ((memq x encountered-list) true)
    (else (set! encountered-list (cons x encountered-list))
          (cycle? (cdr x)))))

;this is a simpler puzzle of 3.17, inspired by 3.17, we can add encountered
;list to it, and then check if (cdr x) it has been encountered before,
;or check if the list terminates.

;test
(define l1 (list 'a 'b 'c))
(define l2 (list 'a 'b 'c))
(set-cdr! (cdr (cdr l2)) l2)
(define l3 (list 'a 'b 'c 'd 'e))
(set-cdr! (cdddr l3) (cdr l3))
(define l4 (list 'a 'b 'c 'd 'e))
(set-car! (cdddr l4) (cddr l4))