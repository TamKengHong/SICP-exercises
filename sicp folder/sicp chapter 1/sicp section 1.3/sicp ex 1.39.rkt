#lang sicp
(define (cont-frac n d k)
  (define (recur i)
  (if (> i k)
      0
      (/ (n i) (- (d i) (recur (+ i 1))))))
  (recur 1))
;we change to minus sign for cont frac, then change ni and di accordingly
(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                    x
                   (* x x)))
             (lambda (i)
               (- (* 2 i) 1))
             k))
;ok this works.