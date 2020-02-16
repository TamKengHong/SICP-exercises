#lang sicp
(define (make-rat n d)
  (define (positive? n) (> n 0))
  (define (negative? n) (< n 0))
  (let ((g (abs (gcd n d))))
    (cond
      ((and (positive? n) (negative? d)) (cons (/ (- n) g) (/ (- d) g)))
      ((and (negative? n) (positive? d)) (cons (/ n g) (/ d g)))
      ((and (negative? n) (negative? d)) (cons (/ (- n) g) (/ (- d) g)))
      (else (cons (/ n g) (/ d g))))))
; ok this works and its pretty self explanatory