#lang sicp
;like the front part of chap 2, just do segments

(define (make-vect x-cor y-cor)
  (cons (x-cor y-cor)))

(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))