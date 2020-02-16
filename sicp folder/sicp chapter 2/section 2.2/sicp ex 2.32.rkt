#lang sicp
(define (subsets s)
 (if (null? s)
     (list nil)
     (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))
;ok this works. i seeked help tho, i tried to do map car s and couldnt do it.
;time to understand and decipher this code.
;i tried to draw inspiration from the coin counting change,
;where the subsets is the subsets without first element + subsets with first
;element.

;what the map does is that it cons the first element of the list to the rest
;of the list, to generate the complete set.
;next, it runs thru the subsets (cdr s), doing the same mapping and and cons
;to make smaller sets. For each rest being called, it runs thru another
;instance of the subset procedure which generates more subsets by consing
;the rest with car s. so it will enumerate all the sets.

;im not really sure... but it seems like it will enumerate all sets,
;then append them all.