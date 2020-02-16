#lang sicp

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

;lets do first one
(define (origin1 frame) (car frame))
(define (edge1.1 frame) (cadr frame))
(define (edge2.1 frame) (caddr frame))

;second one
(define (origin2 frame) (car frame))
(define (edge1.2 frame) (cadr frame))
(define (edge2.2 frame) (cddr frame))