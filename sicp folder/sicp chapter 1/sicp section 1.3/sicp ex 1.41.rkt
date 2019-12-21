#lang sicp
;(define (double f)
;  (f (f)))
;ok results in bug. lets examine the code for (double inc)
;if we call ((double inc) 2), it should lead to 4 as the ans
;((double inc) 2) must lead to (inc (inc 2)), so ((double f) 2) must
; lead to (f (f 2))

;(define (double f)
; (f f))
;this doesnt work either, cuz (f f) will return a value not a procedure.
; we want it to return a procedure,

(define (double f)
  (lambda (x) (f (f x))))
;ok this works. I just defined double f to be the procedure which takes in
;procedure f, and returns the procedure of one argument x, which is
;f applied 2 times to x, (f (f x)), when u give the procedure an input x.

(((double (double double)) inc) 5)
;gives value of 21, why? by doubleing a double of a double, u end up with
;8 incs. wait what.

;lets eval this by substitution.
;(((double (double double)) inc) 5)
;expand innermost bracket
;=(((double (double (double (some x))) inc) 5)
;double the double x process
;=(((double ((double (some x) (double (some x)))))))

;ok holy shit i gave up. see the below link for how complex this is.
;https://jots-jottings.blogspot.com/2011/09/sicp-exercise-141-double-trouble.html
;luckily the qn never ask why. but only ask what is the value.
;wtf that link took 8 pages to explain and substitute all. ok done.
                                                     