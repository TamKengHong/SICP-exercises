#lang sicp
;lets copy paste everything we need first
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
(try first-guess))

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define dx 0.00001)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
; so we given g(x) -> x^3 + ax^2 + bx +c, and we need to find zeros
; using newtons method.
; cubic will take a b c as arguments and give x^3 + ax^2 +bx +c
;this is simple to implement, where initial guess x=1.
(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
;we want cubic to return a procedure where it takes in x,
;and returns a cubic afterwards.
;ok this works after testing out. also, when you test for certain values
;of x, they will converge to diff values of x for the same cubic, as
;cubics have 3 solutions.