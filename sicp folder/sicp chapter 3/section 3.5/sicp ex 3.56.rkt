#lang sicp

(define S (cons-stream 1 (merge
                          (merge (scale-stream S 2) (scale-stream S 3))
                          (scale-stream S 5))))

;just do a double merge. dont need to think too much about unrolling the
;stream.
                          