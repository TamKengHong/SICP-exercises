#lang sicp
;rest is taken as a list and lets do list operations to it.
(define (same-parity first . rest)
  (define (parity-iter first rest result)
    (cond
      ((null? rest) result)
      ((and (= (remainder first 2) 0) (= (remainder (car rest) 2) 0))
         (parity-iter first (cdr rest) (cons (car rest) result)))
      ((and (= (remainder first 2) 1) (= (remainder (car rest) 2) 1))
         (parity-iter first (cdr rest) (cons (car rest) result)))
      (else
       (parity-iter first (cdr rest) result))))
 (cons first (reverse (parity-iter first rest nil))))

;wow this actually worked. im quite amazed at myself.

;time to run thru what i did. Firstly, we took in "rest" as a list.
;now we needed to invent an iterative procedure to run thru the list and
;cons the result. How i consed the result was: If the first value is even,
;and the value of the (car rest) is also even, then cons all the even values
;of rest and run it down the list. Likewise for odd. The else is there when
;we run into a situation of the first term being even but car rest being odd
;we just skip consing the value and move on down the list.
;then, as a final step, we have either all the even or odd values of the rest
;list already, then we just cons the first value to make it complete. i did
;a reverse (tho the ans only require returning same parity and dont care
;about order.) to match the resultant value produced.