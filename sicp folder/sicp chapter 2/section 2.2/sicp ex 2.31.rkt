#lang sicp
(define (square x) (* x x))
(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))
(define (square-tree tree) (tree-map square tree))

;hell yea this works, just abstract away the common processes, take out the
;things that are common and repeated and just make them into treemap, a
;more general method.