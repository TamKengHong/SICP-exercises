#lang sicp
(define (=zero? a) (apply-generic 'zero a))

;for normal number, just check (= a 0), for rat number, check (= (numer x) 0)
;for complex number, check that mag = 0.

(define (zeronum a) (= a 0))
(define (zerorat a) (= (numer a) 0))
(define (zerocomplex a) (= (magnitude a) 0))

(put '=zero? '(scheme-number) zeronum)
(put '=zero? '(rational) zerorat)
(put '=zero? '(complex) zerocomplex)

;from the exercises solutions i see, its best to put them in part of the
;general package, so we dont have to keep changing names and stuff,
;the package will be more contained and easier to manage.