#lang sicp
;just read the exercise carefully and try to decipher what its trying
;to say, then translate it into code.

(define (iterative-improve good-enuf? improve)
  (lambda (guess)
    (define (iter n)
     (if (good-enuf? n)
         n
         (iter (improve n))))
    (iter guess)))
;after this is done, its just translate the rest into code as well.
;a method for finding good enuf, and a method for improve.

(define (close-enough? v1 v2) 
  (< (abs (- v1 v2)) tolerance))
(define tolerance 0.0001)

(define (fixed-point f first-guess) 
  ((iterative-improve 
    (lambda (x) (close-enough? x (f x))) 
    f) 
   first-guess)) 
  
(define (sqrt x) 
  ((iterative-improve 
    (lambda (y) 
      (< (abs (- (square y) x)) 
         0.0001)) 
    (lambda (y) 
      (average y (/ x y)))) 
   1.0)) 