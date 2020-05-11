#lang sicp

;we just have to change the way how our assoc works, change equal to samekey?

(define (same-key? key1 key2)
  (cond ((equal? key1 key2) true)
        ((and (number? key1) (number? key2)
              (<= (* key1 (abs (- key1 key2))) tolerance)) true)
        (else false)))

(define tolerance 0.01)

(define (assoc key records)
  (cond ((null? records) false)
        ((same-key? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

;the make-table doesnt need to change, due to data abstraction.
;same-key checks if they are equal, if not, checks if both are numbers and
;that the fractional distance is within tolerance. else false.
