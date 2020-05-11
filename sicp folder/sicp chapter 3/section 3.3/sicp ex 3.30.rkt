#lang sicp

;we will need a recursive function that goes down the list and generates
;full adders using cars of the list.

(define (ripple-carry-adder A B S C)
  (cond ((null? (cdr A)) 'ok)
        (else
         (let ((Cn (make-wire)))
           (full-adder (car A) (car B) C (car S) Cn)
           (ripple-carry-adder (cdr A) (cdr B) (cdr S) Cn)))))

;so what i did was, i go down the list to form a full-adder of car a b s ...
;then, recurse by going down ripple-carry-adder of the cdr of all, making
;sure that i propagate the things correctly.

;the delay is quite tricky, skipped.