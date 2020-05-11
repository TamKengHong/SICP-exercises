#lang sicp

;so once we counted the pair, we need to "mark" them so that they wont
;be counted again. My idea is to set the car and cdr to 0 after counting.
;ok so u add 1 to the count, go down to car and cdr, and set the original to
;be 0.

;ok so if it has been counted already, then u can just add 0 instead of 1.
;we can mark objects as being counted or not, if we have a data structure
;that takes into account (counted? (list)), if counted, move on the list,
;if not counted, add 1, change the sign to counted, and move on the list.

;ok we need to generate a data structure which has the whole list, with
;a symbol in front to check if its counted.
;eg. (count? x) for every pair, so it becomes a triple.
;we dont have to generate new structure, just need to check if its been
;counted before.
;to check, we count it and slot it into a list of objects we encountered
;before already.

(define encountered-list '())

(define (count-pairs x)
  (cond
    ((not (pair? x)) 0)
    ((memq x encountered-list) 0)
    (else
     (set! encountered-list (cons x encountered-list))
     (+ (count-pairs (car x))
        (count-pairs (cdr x))
        1))))

;ok yes i finally got it after debugging and some help. Ok so, we have
;an encountered-list to check if x has been encountered in the list.
;so what happens is, its a cond, if x is not pair, 0, if x is found on list,
;0, else, this means x is found on list. thus we set! the list to be cons
;x and list, then we do a countpairs recursion +1.

;there was a bit of issue with set and environments so i could not get the
;ans correctly initially tho my method was correct.
                










;for testing:
(define l31 (list 'a 'b 'c))
 
(define l41 (list 'b 'c))
(define l42 (list 'a))
(set-car! l41 l42)
(set-car! (cdr l41) l42)
 
(define l71 (list 'c))
(define l72 (list 'b))
(define l73 (list 'a))
(set-car! l72 l73)
(set-cdr! l72 l73)
(set-car! l71 l72)
(set-cdr! l71 l72)
 
(define linf (list 'a 'b 'c))
(set-cdr! (cdr (cdr linf)) linf)

                   