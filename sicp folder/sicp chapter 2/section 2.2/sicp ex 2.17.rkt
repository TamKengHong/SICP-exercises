#lang sicp
(define (last-pair a)
  (if (null? (cdr a))
      (list (car a))
      (last-pair (cdr a))))
;ok quite straightforward.