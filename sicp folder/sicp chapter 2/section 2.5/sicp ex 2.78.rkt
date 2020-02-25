#lang sicp
;lets copy paste the tags definitions so we can modify them.
(define (attach-tag type-tag contents)
  (if (eq? type-tag 'scheme-number)
      contents
      (cons type-tag contents)))
(define (type-tag datum)
  (cond
    ((number? datum) 'scheme-number)
    ((pair? datum) (car datum))
    (else (error "Bad tagged datum: TYPE-TAG" datum))))

(define (contents datum)
  (cond
    ((number? datum) datum)
    ((pair? datum) (cdr datum))
      (error "Bad tagged datum: CONTENTS" datum)))

;maybe use symbol? and number? to determine the types as stated in the qn
;so we want numbers to have no types.

;lets also take a look at the representation for scheme numbers
(define (install-scheme-number-package)
  (define (tag x) (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number (lambda (x) (tag x)))
  'done)
;so basically we dw all these. ok easy. so basically if the contents
;is just a number, return the number, if u want type tag of a number
;it should return scheme number, and attach-tag should check the type-tag
;first, if it just returns the number aft checking the contents is a number
;for example (attach-tag 'log 5), then this would return 5 which is an error.
;thus we do not want it to ignore type-tag, meaning we need to check for it.
