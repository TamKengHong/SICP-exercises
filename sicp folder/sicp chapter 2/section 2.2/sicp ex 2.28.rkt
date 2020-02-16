#lang sicp
(define (fringe x)
  (define (fringe-iter x)
   (define (iter remaining result)
    (cond
      ((null? remaining) result)
      ((not (pair? (car remaining)))
        (iter (cdr remaining) (cons (car remaining) result)))
      (else (iter (cdr remaining) (append (fringe-iter (car remaining)) result)))))
   (iter x nil))
  (reverse (fringe-iter x)))

;I DONT UNDERSTAND HOW THIS WORKS BUT IT DOES LOL. 
;ok lets first understand fringe-iter. it gives a reversed answer of fringe.
;how it works is thru tree recursion. What i did was: make an iteration
;going thru the entire list, if its not a pair, cons it to the result,
;making result into a reversed list.

;and if its a pair, we append the pair (a list) to the result, resulting
;in a new list with both the remaining + result. What happens is
;fringe-iter will be evaluated first to be done on car remaining,
;all the way till we reach a non-pair. Then, that total fringe-iter result
;will be a reversed list. append this reversed list with the earlier
;reversed result, and then everything is still in reversed order.
;thus, final step is to reverse it back and get the original fringe ans.
;im still not quite sure.

(define x (list (list 1 2) (list 3 4)))
(define y (list 1 (list 2 (list 3 4) 5) (list 6 7) 8))


;what we want to do is to strip off the numbers and make them into a new list.
;fringe must always result in a non-pair, then list them.

