#lang sicp
;lets copy paste the apply generic first.
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
                    (t1->t2
                     (apply-generic op (t1->t2 a1) a2))
                    (t2->t1
                     (apply-generic op a1 (t2->t1 a2)))
                    (else (error "No method for these types"
                                 (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))

;lets draw inspiration from what they told us. One strategy is to attempt
;to coerce all the arguments to the type of the first argument, then to the
;type of the second argument, and so on.
;so now we need to think in lists of arguments and recursion to cover them
;all.
;ok the if (length args 2) part wont work already, have to change the whole
;thing there. ok so we need a list of all the different types, which is
;type-tags.
;ok one idea would be, try to see if there exists coercion to the first type
;for the rest of the tags (implement this procedure). If so, then coerce all
;the arguments to their corresponding coercion types (how? pls work on this
;soon). Otherwise, do the same for the second type and the rest of the
;tags. (ok this is hard, since now we skipped the first tag but need to
;implement it like 2nd tag will also affect the first in the list.)
;if all fail then present error.

;ok now to discuss the limitations of this strategy.
;for the two-argument version, the strategy does not try to see if we
;can coerce both arguments into a third type to do the procedure.

;for the multiple argument version, it also suffers from the above, and also
;by attempting to coerce all into first argument, second argument etc,
;u miss some parts where eg, half can be coerced to first type and half
;to second type, then we can actually do the apply-generic. however
;our code may not take into account of this.

;ok the implementation is too hard and takes like 50 lines of code and i
;dont even know how it works. too hard, skip exercise.
