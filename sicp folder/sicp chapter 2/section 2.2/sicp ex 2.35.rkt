#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;for reference, from section 2.2
(define (count-leaves1 x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (count-leaves t)
 (accumulate + 0 (map (lambda (x) (if (not (pair? x))
                                      1
                                      (count-leaves x)))
                      t)))
;ok this works and it took me a freaking long time to get this to work.
;i tried so hard with implementations of length and enumerate tree, etc.
;so we know the initial value is 0 and the operation to do is +
;now what do we need to map? map will produce a new list. so if we
;want a new list where all the non-pairs are now 1 (to be accumulated
;properly), then we just write a procedure where map takes in the tree,
;and if its non-pair, then change it to 1, else, we run thru the same
;procedure of count-leaves to the sublist, which will add and change
;everything else to 1 and so on, down all lists, so each sublist will
;have its own total value, and just sum everything up thru accumulate.


(define x (cons (list 1 2) (list 3 4)))