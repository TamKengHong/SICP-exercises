#lang sicp
;from ex 3.3,
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (cond ((not (eq? p password)) (error "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: MAKE-ACCOUNT"
                       m))))
  dispatch)

;ok what we need here is we need to define paul-acc as peter-acc but with
;a different password to make transactions. I suppose that if u use
;peter-accs password on paul-acc it wont work. We also would like to create
;joint accounts of 3 or more accounts to make it scalable.

;now lets time to do up make-joint.
;i have an idea to use set! to make peter-acc paul-acc, but how to change
;to diff password? maybe use set! again to make a new password?
;we should not set! balance to be equal to peter acc cuz the transactions
;can only go one-way and changes wont be updated to both.

;we will need a selector to extract out the password of the account, to
;compare. The selector is a clever trick which passes the 1st-pass to the
;first account to see whether u can deposit or not.

(define (make-joint acc 1st-pass new-pass)
  (define (dispatch p m)
    (cond ((eq? p new-pass) (acc 1st-pass m))
          (else (error "Wrong password"))))
  (begin ((acc 1st-pass 'deposit) 0)
         ;this does a clever check on whether 1st-pass is correct.
         dispatch))

(define peter-acc (make-account 100 'hello))
(define paul-acc (make-joint peter-acc 'hello 'bye))
(define my-acc (make-joint paul-acc 'bye 'hi))

;ok it works. What it does is it checks if you key in the 1st-password
;correctly when making the joint acc, by trying out the 1st pass to deposit
;0 dollars into the account. Next, what it does is it takes ur password
;and checks it against new-pass, if its correct then it can do a 1st-pass
;onto your message to be passed into the original account. Which lets
;make-account settle all the dirty work for you! you can also make many
;joint accounts all sharing together.
  
          






           