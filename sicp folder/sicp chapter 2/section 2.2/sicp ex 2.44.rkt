#lang sicp
(#%require sicp-pict)

;easy just switch the positions like what the exercise said.
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))