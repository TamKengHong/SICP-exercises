#lang sicp

(define (square x) (* x x))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
;ok this works perfectly. what i did was: since accumulate takes in a
;procedure, we need to fill in the blanks for lambda x y. what lambda
;x y does is that it is a procedure which takes in inputs of x and y and
;outputs a value. We wanted a new list after mapping so we must have cons.
;what i did was i subbed the procedure back into accumulate definition,
;and found that i needed to (cons (p x) y), as we needed a cons operation
;and p x gives the cons of (p (car sequence)) and y, which is the rest of
;the list.

(define (append s1 s2)
  (accumulate cons s2 s1))
;just follow the definitions of accumulate, should be clear. we do a cons
;on s1 all the way, then when s1 ends it conses the s2, to form s1+s2.

(define (length sequence)
  (accumulate (lambda (x y) 0 (+ 1 y)) 0 sequence))
;ok i figured this out. we just want a procedure which takes in 2 arguments
;and returns (+ 1 y), so it will keep on +1 till y is finished, and return
;the length of the list. the first argument does nothing and is just a
;placeholder value.
