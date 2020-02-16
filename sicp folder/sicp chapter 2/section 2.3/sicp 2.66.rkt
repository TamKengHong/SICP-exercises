#lang sicp
;ok lets first think of what to do for a binary search tree.
;luckily we already have this from the textbook, not that i cant code it
;out lol.
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (lookup1 given-key set-of-records)
  (element-of-set? given-key set-of-records))

;(entry set) pulls out the key from the set-of-records.
;actually i should just copy paste and edit element-of-set to be lookup
;but nvm. ok shit i got the wrong ans, cuz it doesnt return the record
;and other stuff.

;heres the right ans.
(define (key record)
  (car record))

(define (lookup given-key set-of-records)
  (if (null? set-of-records)
      #f
      (let ((entry-key (key (entry set-of-records))))
        (cond ((= given-key entry-key) (entry set-of-records))
              ((< given-key entry-key)
               (lookup given-key (left-branch set-of-records)))
              ((> given-key entry-key)
               (lookup given-key (right-branch set-of-records)))))))
;taken from https://jots-jottings.blogspot.com/2011/12/sicp-exercise-266
;-looking-up-data.html
;i did not properly do it up, i should have modified the elements of set
;procedure to make it fit a lookup.

