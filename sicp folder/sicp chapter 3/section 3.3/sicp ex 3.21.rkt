#lang sicp
;the reason why the intepreter displays it this way is that it displays the
;front pointer of the queue which is the entire list, and the rear ptr
;which is the last element of the list, which is why that happens.
;also delete-queue wont change the rear pointer so b still remains.

(define (print-queue q)
  (display (front-ptr q)))

(define (front-ptr q) (car q))

;this just prints the front-pointer of the queue which is the entire queue.