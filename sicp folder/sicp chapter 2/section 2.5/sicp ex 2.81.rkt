#lang sicp
;heres the apply-generic definition.
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1)))
                  (cond
                    ((eq? type1 type2) (error "No method for these types"
                                              (list op type-tags)))
                    (t1->t2
                     (apply-generic op (t1->t2 a1) a2))
                    (t2->t1
                     (apply-generic op a1 (t2->t1 a2)))
                    (else (error "No method for these types"
                                 (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))

;side note, the reason why (if proc) works is because if will only skip to the
;else part when proc has a value of false, otherwise, as proc has a value
;of anything other than false (not necessarily true), then it will just
;do proc on the contents.

;part a.
;during (get op type-tags), it will try to find 'exp in '(complex complex),
;however, since 'exp is not defined in '(complex complex), it will skip
;to the part with all the lets. Then, since t1->t2 is defined for the
;same types, the cond will be true, and will result in apply-generic
;to t1->t2 a2 that part. This will result in an infinite loop as the
;program will always try to coerce and apply generic.

;part b
;Apply-generic will work correctly as it is, as even when there is two
;arguments of the same type that do not have the method, it will try to
;coerce both of them but fail, thus returning no method for these types.
;which is the correct response. Thus, Louis is wrong and it works well.
;However, the concern he has about needless trying of coercing is right,
;as we can just skip the trying of coercing process if both of the types
;are the same, saving on resources.

;part c
;what we do is we check if same type, if so then theres error, otherwise
;continue on as usual. This skips the needless trying to coerce steps.