#lang sicp
(define (sosl a b c)
  (define (square x) (* x x))
  (define (sos x y) (+ (square x) (square y)))
  (cond
    ((and (>= a c) (>= b c)) (sos a b))
    ((and (>= a b) (>= c b)) (sos a c))
    ((and (>= b a) (>= c a)) (sos b c))))
;what i did here was if a>=c and b>= c,
;this shows that c is the smallest and then
;we can just reduce this to 3 expressions instead of hardcoding 6