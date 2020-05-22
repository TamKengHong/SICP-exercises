#lang sicp

;so we want to do recursive addition of all previous elements of the stream
;basically, we just keep doing (new Sn) = Sn-1 + Sn.
;we will need an iteration.

;ok nvm i thought of a good solution using just add-stream.
;so basically, we do an add-stream to add (cdr S) to all elements of the
;entire partial-sums stream we have.

;so the first element is stream-car S, the next element of it would be
;the add-stream of (cdr S) to ITSELF. meaning, when we do an add-stream
;of cdr S, we are adding the element (cdr S) to the next element of
;partial sums S. its just Sn = Sn-1 + Sn
;so, Sn calls itself as partial-sums S again. 

(define (partial-sums S)
  (cons-stream
   (stream-car S)
   (add-stream (stream-cdr S) (partial-sums S))))

;eg: S = (1 2 3 4 5)
;1st element of partial-sums S = 1
;2nd element of partial-sums S = (add-stream (2 3 4 5) (partial-sums S)
;= (add-stream (2 3 4 5) (1 ...)) = (3 ...)
;now, 3rd element of partial-sums S = (add-stream (3 4 5) (3 ...))
;= (6 ...), then the 4th element is 6 added to 4 = 10, 5th element
;is 10 added to 5 = 15 and so on. Basically, we compute the stream
;as we go along the way. At first it doesnt know whats the value of
;the 2nd or 3rd or so on partial-sums, but as u fill in the values by
;doing add-stream, it will get more info kinda like math induction.