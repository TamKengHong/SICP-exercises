#lang sicp
; we want to divide by 2 and count each step until we cannot do it to get a
; divide by 3 and count to get b. This is due to fundamental theorem of
; arithmetic.

; we first set up our cons which is self explanatory.
(define (cons a b)
  (define (expt base n)
    (if (= n 0)
        1
        (* base (expt base (- n 1)))))
  (* (expt 2 a) (expt 3 b)))

;now we do a repeated division counter to extract a or b out.
(define (extract div count number)
  (if (= (remainder number div) 0)
      (extract div (+ 1 count) (/ number div))
      count))

(define (car x)
  (extract 2 0 x))
(define (cdr x)
  (extract 3 0 x))
;ok this works.