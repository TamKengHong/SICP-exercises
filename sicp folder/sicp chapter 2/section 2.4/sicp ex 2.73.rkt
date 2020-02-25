#lang sicp
(define (deriv1 exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv1 (addend exp) var)
                   (deriv1 (augend exp) var)))
        ((product? exp)
         (make-sum (make-product
                    (multiplier exp)
                    (deriv1 (multiplicand exp) var))
                   (make-product
                    (deriv1 (multiplier exp) var)
                    (multiplicand exp))))
        (else (error "unknown expression type: DERIV" exp))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;what the data directed deriv does is, first it checks if the exp is a
;number or variable and just gives the base cases
;else, it is an algebraic expression, to know if the expression is a
;sum or product, we take the operator exp which tells us the info
;from there, we will use get to get the deriv procedure stored in a table
;of deriv and operators to know what to do with each different type.
;we cannot use number? and variable? in the dispatch as the expression
;is a list eg. (+ ax b), so given a number or variable at the start
;of the list will result in error as those arent procedures applied to the
;list.

;moving on, we will write deriv procedures for sums and products.
;lets just take it from the original code.

(define (deriv-sum exp var)
  (make-sum (deriv (addend exp) var)
            (deriv (augend exp) var)))
(define (deriv-product exp var)
  (make-sum (make-product
             (multiplier exp)
             (deriv1 (multiplicand exp) var))
            (make-product
             (deriv1 (multiplier exp) var)
             (multiplicand exp))))
;time to put them in the table of deriv/operators
(put 'deriv '+ deriv-sum)
(put 'deriv '* deriv-product)

;lets add exponents, copying from ex 2.56, but the rest of the things not
;defined yet like make-exponentiation and base etc, but doesnt matter
;cuz we cant even test our code, as we dk what is get and put but
;assume they are primitives, so lets do the same for this.
(define (deriv-expo exp var)
  (make-product
   (make-product (exponent exp)
                 (make-exponentiation (base exp)
                                      (make-sum (exponent exp) -1)))
   (deriv (base exp) var)))

(put 'deriv '** deriv-expo)
;done, note how this simplifies the addition of extra modules into the
;code, as we organised things nicely.

;for part d, the only thing that matters is the way we put the procedures
;into the system, instead of putting it as 'deriv, 'op we just do a
; 'op 'deriv, and nothing much will change, as the procedures are pretty
;much untouched.
