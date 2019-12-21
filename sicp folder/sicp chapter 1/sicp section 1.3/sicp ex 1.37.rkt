#lang sicp
; 1/phi = 0.61803398875
(define (cont-frac n d k)
  (define (recur i)
  (if (> i k)
      0
      (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))
;its easy to get the formula, but its hard to see what procedures to pass
;and how to pass the procedures.
;when k=11, accurate to 4 dp.

;time for iterative, trick for iter is to combine all to one result
;since k-1th term builds on k, we first find kth term, set result = 0
;and work it out.
(define (cont-frac2 n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
;yes it works dab i spent several hours on this to think about what
;procedures to pass.