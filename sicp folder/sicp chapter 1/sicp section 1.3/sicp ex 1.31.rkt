#lang sicp
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
;copypasted from 1.30 but just change operators and starting value
(define (identity x) x)
(define (factorial n)
  (product identity 1 inc n))

;now time for recursive
(define (product2 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product2 term (next a) next b))))

;time to compute pi using the formula given
;by seeing pattern, if n is even, then top part +2(n/2), if n is odd,
;bottom +2(n+1/2)
(define (pi-term k)
  (define (numerator k)
    (cond ((even? k) (+ 2.0 k))
          (else (+ 2.0 (- k 1.0)))))
  (define (denominator k)
    (cond ((odd? k) (+ 2.0 k))
          (else (+ 1.0 k))))
  (/ (numerator k) (denominator k)))
;ok wtf im so happy i just exhausted all possible cases of values for
;numerator and denominator and i spent 20 mins fixing this shit. it works.

(define (piformula n)
  (* 4.0 (product pi-term 1.0 inc n)))