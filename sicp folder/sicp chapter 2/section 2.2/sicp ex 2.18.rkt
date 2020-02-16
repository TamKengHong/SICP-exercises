#lang sicp
(define (reverse a)
  (define (reverse-iter x y)
    (if (null? x)
        y
        (reverse-iter (cdr x) (cons (car x) y))))
  (reverse-iter a nil))

;ok this works. What i did here was: firstly, once we go down the list,
;we will not be able to access the previous values of the list anymore
;thus, we will have to cons the first few values first, into the empty
;list. This results in first few values being consed at the end part of the
;list and thus reverses it. This is o(n) algorithm so its the most efficient
;already, as we have to access all n elements of the first list.