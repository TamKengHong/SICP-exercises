#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))
;ok this works, what i did was cons a new list of the dot products of v *
;row 1 of matrix, and row 2 of matrix and so on, which gives the ans.

(define (transpose mat)
(accumulate-n cons nil mat))

;row become column and column become row, eg ((1 2 3) (4 5 6)) >
;((1 4) (2 5) (3 6))
;this works, as accumulate n will just do the operation on each first
;element of sublist, each second and so on. what we need is just to
;cons them tgt to form new sublists and we are done.

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))
;transpose just flips the rows and column so they can be multiplied
;nicely by matrix*matrix. Then we do a matrix*vector on the matrix cols
;with each subsequence of m, to get the answer.

;testing
(define v (list 1 2 3))
(define m1 (list (list 1 2 3) (list 4 5 6)))
(define m2 (list (list 1 2) (list 3 4) (list 5 6)))