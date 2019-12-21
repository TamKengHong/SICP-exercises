#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
;recursive process above

;now, this seems similar to fibonacci iterative so lets try that.
;lets set up a counter which runs from 1 to n and sums it all up

(define (g n)
  (define (g-iter n a b c)
    (if (= n 2)
        c
        (g-iter (- n 1) b c (+ (* 3 a) (* 2 b) c))))
  (if (< n 3)
      n
      (g-iter n 0 1 2)))
;linear iterative process above, holy hell this took me 40 mins this is so hard
;i finally solved it after so much thinking