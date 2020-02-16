#lang sicp
(#%require sicp-pict)

;just abstract things out like how we usually do it, which is
;copy paste but generalising things.

(define (split a b)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split a b) painter (- n 1))))
          (a painter (b smaller smaller))))))
;split takes in painter and n as inputs so we lambda that, then does its
;thing.

(define right-split (split beside below))
(define up-split (split below beside))

;testing with (paint (up-split einstein 4)), it works well.