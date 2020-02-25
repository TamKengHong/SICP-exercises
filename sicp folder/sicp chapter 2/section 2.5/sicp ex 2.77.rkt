#lang sicp
;(magnitude z) doesnt work as it can only be called in the polar/rect number
;representation, so by applying (magnitude z), apply generic doesnt know
;what to apply magnitude to, as its not defined in rational/complex/scheme
;number arithmetic the next level up. Thus, by using put, we place the
;operations into the complex number representation one level up.

;ok now lets trace what happens to (magnitude z)
(define (magnitude z) (apply-generic 'magnitude z))

(magnitude z)
(apply-generic 'magnitude ('complex 'rect 3 4))
((get 'magnitude 'complex) ('rect 3 4))
(magnitude ('rect 3 4))
((get 'magnitude 'rect) (3 4))
((some-procedure-that-gives-mag-from-rect) (3 4))
=5.

;basically, apply generic first be like hey, i want to find the thing in
; mag/complex in the table. Then it fetches it, giving another magnitude
;procedure stated in ex 2.77, then it be like hey, this tells me to
;do an apply generic back on the table of mag and rect. This fetches
;the procedure that gives mag from rect, some sqrt of x^2 y^2 that we
;defined. Overall, 2 apply generics are called to strip the tags
;from the object.
