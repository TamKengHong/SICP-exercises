#lang sicp
(define (equal? a b)
  (and
   (cond ((and (not (pair? a))
               (not (pair? b)))
          (eq? a b))
         ((and (pair? a) (pair? b))
          (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
         (else false))))
      
;we need to see whether they are symbols (not pair) and do accordingly.
;ok this worked, took me a while to debug (20 mins), cuz i have to read
;the qn v carefully and implement everything out exactly as they said.
;note to self, when they say stuff like if both symbols, dont gloss over,
;take note, what is meant by symbol? not pairs. also like if both lists etc
;i have to be careful of the way i use my conds and recursions and quotes.
;they laid it out straightforwardly, just have to decipher and code out.