#lang sicp
;https://wizardbook.wordpress.com/2010/12/14/exercise-3-11/

;abit more complex but with enough visualisation its possible.

;make-account will generate a pair of code...
;when acc is created, it generates E1 where balance = 50, the other internal
;definitions (withdraw, deposit, dispatch) are pairs of code that points to
;E1.

;then when u ((acc 'deposit) 40), E6 is generated where the value of m
;(the message) is 'deposit, and E7 points to E6 where the amount is 40.
;this thus tells dispatch to go to the deposit function and set balance
;= 50 + 40.

;withdraw is the same process.

;when acc2 is defined, they dont share anything at all as shown in the pic.