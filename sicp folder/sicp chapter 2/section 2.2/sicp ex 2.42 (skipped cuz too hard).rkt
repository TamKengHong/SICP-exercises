#lang sicp
;copy paste all we need.
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;now copy paste the queens procedure. Then time to make sense of it
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;ok we have empty-board, safe?, adjoin-position to define. we must
;also know how to represent the set of board positions as a list.
;after some thinking, i found that the solutions can be represented
;by ( ((row,col) (row,col) ...)) ((row,col) (row,col)...)) and so on
;where the first car is the first solution of queens, then cadr
;for second solution, and also each solution is implemented as
;a list of row and cols.

;to understand new row, it does a for each element in (1 2 3 ... board size)
;and forms (newrow, k) into rest-of-queens. Rest of queens is just a possible
;solution to the queens puzzle.
;so what we need is just to append a (newrow,k) into rest-of-queens list.

(define empty-board nil)

(define (adjoin-position a b rest)
  (append rest (list a b)))

;ok leave safe for later cuz its pretty hard. my reasoning is we need to
;check whether the new queen does not share a row with the rest of queencols,
;and check if the new queen does not share a diagonal with the previous
;queen, for example, queen on (3 4) cant share a diagonal with (2 5) to (4 5)

(define (safe? k positions)
  (and ))
;ok this is way too hard i checked the solutions, i could never have done
;this. its insanely hard, i give up.

