#lang sicp
;first lets copy paste everything that was given.
(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr pairs))))))

;now we have to implement a huffman tree using successive-merge, which
;keeps merging the lowest weighted value pairs until theres no more pairs.

;so to think, we want to merge lowest weighted value pairs till theres no
;more pairs. make-leaf-set will always create an ordered list of pairs
;so we can take the first two elements there to merge. to merge, we use
;make-code-tree defined above. take note, we need to make-leaf-set the
;whole thing again since the weight gets added up and everything jumbles

;the trouble now is with make-leaf-set creating (leaf A 1) etc for each
;symbol frequency pair, and then we want to strip the symbol and frequency
;for each. so we have to cadadadadr properly.

;new idea. maybe we just do a sort after every make-code-tree so that
;new instances of leaf wont appear and it does the same thing.

;new idea, since the rest of the set is ordered, when we construct a
;make-code-tree, we just do some adjoining to the set to retain the
;sets orderedness. it should work.

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))


(define (successive-merge pairs)
  (if (and (pair? pairs) (not (null? (cdr pairs))))
      (let ((new-element (make-code-tree (car pairs)
                                         (cadr pairs)))
            (rest-of-list (cddr pairs)))
        (successive-merge (adjoin-set new-element rest-of-list)))
      (car pairs)))

;hell yea this gave the correct answer. so what we did here is we do a
;successive merge on the pairs, making a new code-tree out of the smallest
;two elements. once we have that codetree, we adjoin it to the rest of the
;set to keep its order. then we just repeat until we have the final tree,
;when theres no more pairs left.
;the not(null? cdr pairs) just ensures the stopping condition is correct
;so it will terminate correctly given the cadr and not result in cadr of
;a nil which results in error.

(define test1 (list (list 'A 4) (list 'B 2) (list 'C 1) (list 'D 1)))
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))