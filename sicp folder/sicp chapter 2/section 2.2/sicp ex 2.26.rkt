#lang sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(cons x y)
(list x y)

;result:
;(1 2 3 4 5 6)
;((1 2 3) 4 5 6)
;((1 2 3) (4 5 6))

;this makes sense as append just makes a new list entirely from x and y
;cons just conses the first list with the next few in line, see box and
;pointer to know why its this shape
;then (list x y) constructs a new list with 2 elements x and y which are
;both lists, thus it has this structure.
