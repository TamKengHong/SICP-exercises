#lang sicp
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (reverse1 sequence)
(fold-right (lambda (x y) (append y (list x))) nil sequence))
;ok since (cons y x) produces (((). 3).2).1) or some weird null pair thing,
;we can use append to make a clean list. so we append y with (list x).
;so what it does is that it generates a lot of appends to the (list (car x))
;to make it into a clean reversed list.

(define (reverse2 sequence)
(fold-left (lambda (x y) (cons y x)) nil sequence))
;reverse2 makes sense as it just does (cons y x) first, then again and again
;to generate a reversed list, consing the sequence into nil.

;