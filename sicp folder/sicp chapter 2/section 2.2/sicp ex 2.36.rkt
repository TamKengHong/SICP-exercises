#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (append (car x))) seqs))
            (accumulate-n op init (map (lambda (x) (append (cdr x))) seqs)))))
;ok this took me wayyyy too long like 3h. I didnt know what to accumulate
;or what accumulate-n to call, and dont rly know how to do anything at first.
;after a long time thinking, i realised that for accumulate to work as
;intended, i needed to (accumulate + 0 (list containing all the first
;elements of sublist.) so to get list of first elements, we can just use map
;and take out the cars. next, we can do the same accumulation for the second
;elements of sublists, so how? we just take out all the first elements of the
;original list and accumulate that. Then so on, till we have all the
;accumulates. we cons those tgt and that gives the ans.
;the solution i found uses (map car seqs) which results in same ans but
;is more elegant.

;ans key solution:
;(define (accumulate-n op init seqs)
;  (if (null? (car seqs))
;      nil
;      (cons (accumulate op init (map car seqs))
;            (accumulate-n op init (map cdr seqs)))))

;testing
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(map (lambda (x) (append (car x))) s)
(map (lambda (x) (append (cdr x))) s)
(map (lambda (x) (append (car x))) (map (lambda (x) (append (cdr x))) s))
(accumulate + 0 (map (lambda (x) (append (car x))) s))