#lang sicp
;ok so we will need to have a counter and use set to increment it.
;take note its seven consecutive times, so if u access correctly it will
;reset to 0.
;the thing to change here is the error incorrect password part.

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define counter 1)
  (define (dispatch p m)
    (cond ((> counter 7) (call-the-cops))          
          ((not (eq? p password)) (begin (set! counter (+ counter 1))
                                         (error "Incorrect password")))                                  
          ((eq? m 'withdraw) (begin (set! counter 0)) withdraw)
          ((eq? m 'deposit) (begin (set! counter 0)) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

;ok this works perfectly.
(define (call-the-cops) (lambda (x) (display "police alerted")))

(define acc (make-account 100 'secret-password))