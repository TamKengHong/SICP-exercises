#lang sicp
;pretty easy just same as the first few exercises in the chapter.
(define (make-vect x-cor y-cor)
  (cons (x-cor y-cor)))

(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v1 a)
  (make-vect (* (xcor-vect v1 a))
             (* (ycor-vect v1 a))))