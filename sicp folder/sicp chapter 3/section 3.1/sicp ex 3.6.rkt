#lang sicp

(define (rand arg)
  (let ((x random-init))
    (cond ((eq? arg 'generate)
           (lambda ()
             (set! x (rand-update x))
             x))
          ((eq? arg 'reset)
           (lambda (new-value) (set! random-init new-value)))))

;ok so, rand arg just does the usual rand that was given by the textbook,
;when given generate. Then for reset, it just takes in an input of new-value
;and sets it to the random init.
;note that we cant test this as we dont have rand-update procedures.
         