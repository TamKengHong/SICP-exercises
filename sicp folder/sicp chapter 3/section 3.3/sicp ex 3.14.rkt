#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

;lets try it out. mystery x reverses the list x. just follow the code
;it keeps setting each element one by one into the new list.

;when printed, v is (a), w is (d c b a)
;w is obvious from what mystery does. v is (a) because at the first instance,
;v is taken in by loop and set-cdr, thus the cdr of v gets set to empty set,
;causing (a b c d) to become (a).