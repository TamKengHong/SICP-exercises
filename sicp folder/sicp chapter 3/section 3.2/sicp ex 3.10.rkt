#lang sicp
;https://wizardbook.wordpress.com/2010/12/14/exercise-3-10/
;pictures here

;define make-withdraw is straightfoward as it produce a pair of code,
;then when W1 is created, as balance is internal to initial-amount,
;it points to the environment where initial amount is, where initial-amount
;is 100 and balance is 100.
;then, when u do (W1 50), an environment is created where amount is 50 and
;points to E2, where it sets balance = balance - amount.

;for W2, it just creates an all new environment all together, thus they
;are seperate accounts.