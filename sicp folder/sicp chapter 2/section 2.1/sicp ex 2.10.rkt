#lang sicp
;we test for values that span 0 by lower-bound to upper bound have diff signs
;to test for that, we just check if lower*upper has negative sign.

(define (div-interval x y)
  (if (< (* (car y) (cdr y)) 0)
      "error: spans zero"
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y))))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (make-interval a b) (cons a b))
(define (lower-bound i) (min (car i) (cdr i)))
(define (upper-bound i) (max (car i) (cdr i)))