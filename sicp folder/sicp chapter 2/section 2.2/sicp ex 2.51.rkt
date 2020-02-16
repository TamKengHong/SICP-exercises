#lang sicp
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-down
           (transform-painter
            painter1
            (make-vect 0.0 0.0)
            (make-vect 0.0 1.0)
             split-point))
          (paint-up
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

;its kinda like this, just visualise and sub the values.

(define (below painter1 painter2)
  (rotate90 (beside (rotate90 painter2) (rotate90 painter1))))
;we can rotate the images first, then put them beside, then rotate the
;final image formed to get a below. visualise.