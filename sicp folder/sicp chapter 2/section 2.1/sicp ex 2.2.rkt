#lang sicp
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment s e) (cons s e))
(define (start-segment b) (car b))
(define (end-segment b) (cdr b))
(define (make-point x y) (cons x y))
(define (x-point a) (car a))
(define (y-point a) (cdr a))

(define (midpoint-segment seg)
  (make-segment
   (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
   (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))
;ok this works, dr racket also dont need the printpoint procedure it will
;auto print. What we do is we take the avg of x-point and y-point to get
;midpoint.