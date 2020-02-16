#lang sicp
;direct method, just modify from scaletree,this works
(define (square x) (* x x))
(define (square-tree a)
  (cond ((null? a) nil)
        ((not (pair? a)) (square a))
        (else (cons (square-tree (car a))
                    (square-tree (cdr a))))))
;map and recurse method, just modify as well.
(define (square-tree2 a)
  (map (lambda (x)
         (if (pair? x)
             (square-tree2 x)
             (square x)))
       a))
;this maps the procedure to the list a, which recurse thru into deeper parts
;of the tree too, to map the sublists as well.