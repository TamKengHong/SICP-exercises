#lang sicp
;copy paste all we need.
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

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

;ok lets do some analysis... try to understand every line and describe it.
;also (list->tree (list 1 3 5 7 9 11))
;(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;there are many defined terms inside, lets just unravel all of them.
;left size is size of how many elements in the left side of the tree,
;left result is the result of doing partial-tree on the left side.
;as stated in the qn, partial tree forms pair whose car is tree and cdr
;is elements not consed in the tree. so left-tree, non-left-elts, rightsize
;are quite self-explanatory.
;this-entry is the top of the node of the tree, then right-result is the
;right branch of the tree.

;ok so what partial tree does is that it conses make-tree for this-entry
;left-tree and right-tree which are defined above, with remaining elements.
;so it first takes the list, does a cons (make-tree this-entry, left right)
;and this does a partial-tree of the left and right sides, and so on,
;until it reaches n=0 and thus it just cons a nil to end the branch, as
;both the left and right branch will be nil since theres no remaining
;elements.

;anyways since we defined all the stuff above we can just keep doing
;recursive make-tree on left and right branches, which splits the list
;in half each time to form a sub-tree and so on until we reach the end.
;since the list is ordered, the left is always less than right, and since
;it splits the stuff in half, while this-entry is the middle part of the list
;then we can achieve a balanced binary search tree because it retains its
;order, as all the entry on the left side is less than this-entry, entry
;on right is more than this-entry. and also the height of the tree is
;log(n) since it branches into halves all the time, thus balanced.

;order of growth is o(n) since it calls partial-tree for both left and
;right branches, so its log(n) * 2^n = o(n) steps. makes sense cuz
;minimum order of growth is o(n) since u need to parse n elements of the list