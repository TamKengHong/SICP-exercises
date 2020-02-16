#lang sicp
(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse1 a)
  (define (iter a)
    (cond
      ((not (pair? (car a))) (car a))
      ((not (pair? (cdr a))) (cdr a))
      ((pair? a) (cons (iter (reverse (car a)))
                       (iter (reverse (cdr a)))))))
  (iter a))

(define (deep-reverse2 a)
  (cond
    ((not (pair? (car a))) (car a))
    ((not (pair? (cdr a))) (cdr a))
    (else
     (cons
      (deep-reverse2 (reverse (car a)))
      (deep-reverse2 (reverse (cdr a)))))))

;i tried so hard but failed (did this for like a few hours). My reasoning was
;that deep-reverse will reverse the top layer of the list, then go thru
;into the deeper parts of the tree and reverse all those as well. it is the
;cons of deep reverse car and cdr, to run thru the entire tree, while reversing
;it. Somehow, this does not work. I even implemented a check to see if the
;thing we are reversing must be a pair. somehow it doesnt work pls save me
;i had to think so hard about how to construct and recurse thru the tree,
;while reversing it and checking for pairs in order to not reverse them :(

(define (deep-reverse l)
  (define (iter remaining result)
    (cond ((null? remaining) result)
          ((pair? (car remaining))
            (iter (cdr remaining) (cons (deep-reverse (car remaining)) result)))
          (else (iter (cdr remaining) (cons (car remaining) result)))))
  (iter l nil))
;heres the correct one i could never have came up with this myself. as i
;did not take inspiration from the way i did the reverse procedure. :(
;lesson learnt: try to take inspiration from previous procedures and
;modify them to fit into tree recursion.

;this correct procedure is actually damn smart. we do the same reverse
;procedure, which is consing the remaining to the result which will lead to
;a reversed list. However, in this case, if the car of the remaining itself
;is a list, we call a deep-reverse again to reverse that list. Then we smack
;that reversed list into the result which is consing it. This will ensure
;that all sub-lists are always evaluated and reversed and consed into the
;result list. it goes thru the big list linearly, and deepens its search
;once it hits an inner layer, and goes all the way deepest reverse and inside
;out. then it conses the everything into the result list which is reversing it.

;lesson number 2: we can do tree recursion by linearly going thru the big
;list and doing consing to the result, and also calling itself to go thru
;the sublists one by one.