#lang sicp
(define (for-each proc list)
  (define (for-iter proc list x)
    (if (null? list)
      true
      (for-iter proc (cdr list) (proc (car list)))))
  (for-iter proc list nil))
;ok yea this works. What i did was, since we need to iterate thru the list
;i came up with for-iter, with a dummy value x, for the iteration to do its
;procedure on x like a memory place. then run thru the whole list.
;i initialised x to be nil.