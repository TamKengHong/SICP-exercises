#lang sicp
;first lets think of what to do, and draw inspiration from intersection-set.
;oh lol its just v similar to intersection set, but if x1=x2, then cons
;otherwise, construct either x1 or x2 depending on which is lesser than,
;den move down the list.

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2)
                 (cons x1 (union-set (cdr set1)
                                     (cdr set2))))
                ((< x1 x2)
                (cons x1 (union-set (cdr set1) set2)))
                ((< x2 x1)
                 (cons x2 (union-set set1 (cdr set2)))))))))

;ok this took a bit more work than needed. What happened was if they equal,
;den just cons x1, if x1 less, then cons it and move down, if x2 less, cons
;and move down. At the end right, if one set is empty alr then we return
;the other set, to ensure that the rest of the other set get consed together
;as well. then thats it.

