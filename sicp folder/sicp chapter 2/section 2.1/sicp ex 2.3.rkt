#lang sicp
(define (make-segment s e) (cons s e))
(define (start-segment b) (car b))
(define (end-segment b) (cdr b))
(define (make-point x y) (cons x y))
(define (x-point a) (car a))
(define (y-point a) (cdr a))

(define (make-rect h-seg v-seg) (cons h-seg v-seg))
(define (h-seg rect) (car rect))
(define (v-seg rect) (cdr rect))

;we construct our rectangle from a horizontal and vertical line segment.
;assume rectangle sides run parallel to the axis for easier calculation.

(define (length rect)
  (abs (- (x-point (end-segment (h-seg rect))) (x-point (start-segment (h-seg rect))))))
(define (width rect)
  (abs (- (y-point (end-segment (v-seg rect))) (y-point (start-segment (v-seg rect))))))
;this length width thing above simplifies our code a lot, may lead to
;generalisations also (abstraction barrier).

(define (perimeter rect)
  (* (+ (length rect) (width rect)) 2))

(define (area rect)
  (* (length rect) (width rect)))

;test. r1 works when i cdr and car everything is fine, perimeter and area
;also fine :) good job i completed this.
(define r1
  (make-rect
   (make-segment (make-point 0 0) (make-point 2 0))
   (make-segment (make-point 0 0) (make-point 0 4))))

;next design, rectangle made by inputting length and width.
(define (make-rect2 l w) (cons l w))
(define (length2 rect2) (car rect2))
(define (width2 rect2) (cdr rect2))

(define (perimeter2 rect2)
  (* (+ (length2 rect2) (width2 rect2)) 2))
(define (area2 rect2)
  (* (length2 rect2) (width2 rect2)))
;ok this works too. how to generalise such that perimeter and area will
;give same calculations for both representation?
;basically, since perimeter & area uses length and width, how do we know
;which length and width to take out? given the two diff representations?
;the procedures for perimeter and perimeter2 is mostly the same, but
;how can i make sure extract length and width correctly? i do not know.