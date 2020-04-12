#lang sicp
(define (make-monitored f)
  (define (mf counter)
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) counter)
            ((eq? x 'reset-count) (begin (set! counter 0) counter))
            (else (begin (set! counter (+ counter 1)) (f x))))))
  (mf 0))
;ok this works, was quite complex but followed the instructions and got it.
;so what happens was we needed mf to take in an input x, which was done by
;using lambda. We check if the input equals to how-many-calls or reset-count,
;then do the following to the counter.
;else, we increase the counter, and then we return the value of (f x)
;begin is useful as it allows us to do 2 things at once and then return
;the value of the code as (f x), note that (f x) is last cuz thats the
;final value returned.
;initialise the counter of mf to be 0 to begin the thing.

(define s (make-monitored sqrt))