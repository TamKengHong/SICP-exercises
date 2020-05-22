#lang sicp

;we will need to delay the integrand as seen in the text above.
;and we are done. we shall put it after initial-value so integrand
;wont be evaluated until we need to.
(define (integral delayed-integrand initial-value dt)
  (cons-stream
   initial-value
   (let ((integrand (force delayed-integrand)))
   (if (stream-null? integrand)
       the-empty-stream
       (integral (stream-cdr integrand)
                 (+ (* dt (stream-car integrand))
                    initial-value)
                 dt)))))