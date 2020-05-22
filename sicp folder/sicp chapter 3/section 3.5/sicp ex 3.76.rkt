#lang sicp

;first we just copy the style of the code.
;then we do a cons (car s) first to make the procedure correctly avg each
;value of sense data with the previous one. without the start, it would be
;avging the future values.

(define (smooth s)
  (let ((avpt (/ (+ (stream-car s)
                    (stream-car (stream-cdr s)))
                 2)))
    (cons-stream
     (stream-car s)
     (cons-stream
      avpt
      (smooth (stream-cdr s))))))
;this is a naive way without using stream-map


(define (make-zero-crossings input-stream)
  (let ((smoothed-stream (smooth input-stream)))
  (cons-stream
   (sign-change-detector (stream-car smoothed-stream)
                         (stream-car (stream-cdr smoothed-stream)))
   (make-zero-crossings
    (stream-cdr input-stream)))))

;the answers online are quite different. (cuz they use stream-map)