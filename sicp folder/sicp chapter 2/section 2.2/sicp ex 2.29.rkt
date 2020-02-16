#lang sicp
(define (make-mobile left right)
 (list left right))
(define (make-branch length structure)
 (list length structure))
;part a
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))
;test values
(define mobile1
  (make-mobile (make-branch 10 1)
               (make-branch 2 5)))
(define mobile2
  (make-mobile (make-branch 10 1)
               (make-branch 2 (make-mobile (make-branch 4 1)
                                           (make-branch 1 4)))))
(define mobile3
  (make-mobile (make-branch 9 1)
               (make-branch 2 4)))
;part b (actually can just sum the (fringe mobile))
(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

;ok, drawing inspiration from count-leaves procedure, we extract the
;branch-structure of the left and right branches of a mobile, which may
;be a pair (a mobile consisting of left and right branches as pairs),
;or it may be null (when extracting the next branch structure it is nil),
;thus add 0. Or it may be a non-pair, which is a weight. Then, we sum
;them all up according to what the next mobile extracted may be, either
;a mobile, which we do total-weights again to get the weights,
;or a nil, then we return 0, or a weight, which we just return the weight
;to be added. a really smart solution (some other ppl use branch-weight and
;other procedures they define in order to get total weight, v inelegant).

;part c
;first lets define what torque is. the torque of branch is l*w of branch
;this works. then translate it into code, similar to part b.
(define (torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (cond
    ((null? mobile) true)
    ((not (pair? mobile)) true)
    ((and
      (= (torque (left-branch mobile))
         (torque (right-branch mobile)))
      (balanced? (branch-structure (left-branch mobile)))
      (balanced? (branch-structure (right-branch mobile))) true))
    (else false)))
;HELL YEA THIS WORKS PERFECTLY. ok what i did was: first lets get the torque.
;torque is done correctly and explained above, by extracting l and w of
;branch. Now, to check for balanced?, a lone weight and an empty mobile
;is by default balanced. Otherwise, we check if torque left = torque right
;and if the previous branches are balanced.

;part d
;we only have to change the selectors as thats what we are working with
;in our procedures, so the rest dont need to change. This is the power
;of having abstraction barriers so we can independently work with
;branches and mobiles instead of caring how they are implemented
;and selected.