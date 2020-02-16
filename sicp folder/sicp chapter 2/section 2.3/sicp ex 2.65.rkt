#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;lets use tree->list2 for o(n) implementation (refer ex 2.63 for reason why)
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

;copy pasting...
(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2))) 
        (let ((left-result
               (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts
                     (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))
;testing
(define odd-set (list->tree '(1 3 5)))
(define even-set (list->tree '(2 4 6)))
(define low-set (list->tree '(1 2 3 4)))
(define high-set (list->tree '(3 4 5 6)))


;ok now lets brainstorm for ideas on union-set and intersection-set.
;the clue is we use 2.63 and 2.64, so what they do? convert to and fro
;from ordered lists and trees. This means that we can just reuse
;our ordered list representation for union-set and intersection-set
;which is o(n). So 1. convert to ordered list 2. do union/intersection
;3. convert back and we are done.

(define (union-set s1 s2)
  (define (union set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else
           (let ((x1 (car set1)) (x2 (car set2)))
             (cond ((= x1 x2)
                    (cons x1 (union (cdr set1)
                                        (cdr set2))))
                   ((< x1 x2)
                    (cons x1 (union (cdr set1) set2)))
                   ((< x2 x1)
                    (cons x2 (union set1 (cdr set2)))))))))
  (let ((list1 (tree->list-2 s1))
        (list2 (tree->list-2 s2)))
    (list->tree (union list1 list2))))

(define (intersection-set set1 set2)
  (define (intersect s1 s2)
    (if (or (null? s1) (null? s2))
        '()    
        (let ((x1 (car s1)) (x2 (car s2)))
          (cond ((= x1 x2) (cons x1 (intersect (cdr s1) (cdr s2))))
                ((< x1 x2) (intersect (cdr s1) s2))
                ((< x2 x1) (intersect s1 (cdr s2)))))))
  (let ((list1 (tree->list-2 set1))
        (list2 (tree->list-2 set2)))
    (list->tree (intersect list1 list2))))


;ok it works.