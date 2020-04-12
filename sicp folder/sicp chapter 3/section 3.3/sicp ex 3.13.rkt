#lang sicp
;the list is (a b c) and then it points back to a.
;(last-pair z) will run forever, as

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

;this checks for null? which there will never be a null, and the thing
;will keep going on and on.