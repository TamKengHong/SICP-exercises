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

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (if (and (pair? pairs) (not (null? (cdr pairs))))
      (let ((new-element (make-code-tree (car pairs)
                                         (cadr pairs)))
            (rest-of-list (cddr pairs)))
        (successive-merge (adjoin-set new-element rest-of-list)))
      (car pairs)))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

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

;ok now lets generate a huffman tree and do an encode.

(define tree1 (generate-huffman-tree (list (list 'a 2)
                                           (list 'Get 2)
                                           (list 'Sha 3)
                                           (list 'Wah 1)
                                           (list 'boom 1)
                                           (list 'job 2)
                                           (list 'na 16)
                                           (list 'yip 9))))
(define encoded-message
  (encode '(Get a job
            Sha na na na na na na na na
            Get a job
            Sha na na na na na na na na
            Wah yip yip yip yip yip yip yip yip yip
            Sha boom)
          tree1))
;this works perfectly. i encoded and decoded and get back same msg

;189-106 = 83 bits. the code gives 83 lines of 1 bit each so theres 83 bits
;for the huffman encoding.
;compared to fixed-length encoding, since theres 8 symbols, 2^3 is 8, thus
;it uses 3 bits per symbol. 36 total symbols x 3 = 108 bits.
;so huffman encoding results in a ~23% saving in space.
;
