#lang sicp
;so we are given a message (eg. ABABBACD) and then a tree containing the
;bits that encode the symbols in the message, then we need to produce an
;encoded message.

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

;we also given this. now lets think of how to do it. so we have to
;travel down the tree to search for the symbol, however how do we know
;how to travel down in the first place? since we are random guessing.
;an idea will be to recursively enumerate the tree to form a list of
;symbols and their bits, eg, ( (A 0) (B 100) (C 1101) ...)
;then from there, the encode-symbol searches for the symbol and returns
;the bits associated with the symbol.
;it would be indeed faster if we can just convert the tree into list of
;symbols and bits associated at the start, instead of doing that for
;each call of encode-symbol.
;ok so the new idea would be that for each tree, if encode symbol goes to
;the left branch, it cons a 0 and carries on searching for the symbol
;if it goes to the right branch, it cons a 1 and carries on searching
;once it reach a leaf, it checks for the symbol

;final idea. We are given a list of symbols for every tree, so we just need
;to check if the left or right branch has the symbol. Then, move accordingly
;till u reach a leaf, consing either 0 or 1 depending on how u move.
;when reach leaf just terminate and cons to nil, otherwise symbol not found.


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;we need to define a symbol check function. lets reuse element of set?
;and then modify it to check for symbols.

(define (symbol-check? x list)
  (cond ((null? list) false)
        ((equal? x (car list)) true)
        (else (symbol-check? x (cdr list)))))
              
(define (encode-symbol symbol tree)
  (cond
    ((null? tree) nil)
    ((leaf? tree) nil)
    ((symbol-check? symbol (symbols (left-branch tree)))
     (cons '0 (encode-symbol symbol (left-branch tree))))
    ((symbol-check? symbol (symbols (right-branch tree)))
     (cons '1 (encode-symbol symbol (right-branch tree))))
    (else (error "symbol not in tree"))))
;ok this works, what we did is if tree is null or a leaf then we cons to
;nil, otherwise, we do a symbol-check to see if the symbol is in left or
;right branch, then cons either 0 or 1 to it moving down the branches.
;it will eventually reach leaf or null and it will terminate.

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;after testing the answer is correct.