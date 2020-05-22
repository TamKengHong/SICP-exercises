#lang sicp
;same copy pasting exercise:

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter
                       pred
                       (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (display-line x) (newline) (display x))

(define (display-stream s)
  (stream-for-each display-line s))

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (show x)
  (display-line x)
  x)

(define x
  (stream-map show
              (stream-enumerate-interval 0 10)))

(define sum 0)
;sum: 0
(define (accum x) (set! sum (+ x sum)) sum)
;sum: 0
(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))
;sum: 1
(define y (stream-filter even? seq))
;??
(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))

(stream-ref y 7)

(display-stream z)

;ans:
;0 136
;
;10
;15
;45
;55
;105
;120
;190
;210 done