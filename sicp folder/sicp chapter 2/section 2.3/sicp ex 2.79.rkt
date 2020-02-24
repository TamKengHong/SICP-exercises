#lang sicp
;firstly lets use apply generic
(define (equ? a b) (apply-generic 'equ? a b))

;now lets implement for normal numbers, rat numbers and complex numbers
;so normal numbers is just equal, rat numbers u need to check top and bottom
;equal, complex number u need check mag and ang equal, that way rect and
;polar forms can be equal as well.
(define (equ?rat a b) (and (eq? (numer a) (numer b))
                           (eq? (denom a) (denom b))))
(define (equ?complex a b) (and (eq? (magnitude a) (magnitude b))
                               (eq? (angle a) (angle b))))

;put them tgt at the end
(put 'equ? '(scheme-number scheme-number) =)
(put 'equ? '(rational rational) equ?rat)
(put 'equ? '(complex complex) equ?complex)