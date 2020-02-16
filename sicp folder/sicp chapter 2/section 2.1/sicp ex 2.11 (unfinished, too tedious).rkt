#lang sicp
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (make-interval a b) (cons a b))
(define (lower-bound i) (min (car i) (cdr i)))
(define (upper-bound i) (max (car i) (cdr i)))

;first we break into cases and signs using cond.
; cases are: (signs of (car x) (cdr x) (car y) (cdr y) respectively)
; ++++, +++-, ++-+, ++--, +-++, +-+-, +--+, +---,
; -+++, -++-, -+-+, -+--, --++, --+-, ---+, ----.
; now lets group them to form 9 pairs!
; actually, since upperbound > lowerbound, it doesnt make sense for +-+- etc.
; thus we are left with:
; ++++, ++-+, ++--, -+++, -+-+, -+--, --++, ---+, ----
; 9 cases! yay (i spent so much care here lol)
; ok this just reduces very easily.

;to make things more readable, i come up with shortcuts

(define (+? n) (>= n 0))
(define (-? n) (< n 0))
(define ux (upper-bound x))
(define lx (lower-bound x))
(define ly (lower-bound y))
(define uy (upper-bound y))


(define (mul-interval x y)
  (cond
    ((and (+? lx) (+? ux) (+? ly) (+? uy)) (make-interval (* lx ly) (* ux uy))) d
    ((and (+? lx) (+? ux) (-? ly) (+? uy)) (make-interval (* ux ly) (* ux uy))) d
    ((and (+? lx) (+? ux) (-? ly) (-? uy)) (make-interval (* ux ly) (* ux uy)))
    ((and (-? lx) (+? ux) (+? ly) (+? uy)) (make-interval (* lx ly) (* ux uy)))
    ((and (-? lx) (+? ux) (-? ly) (+? uy)) (make-interval (* lx ly) (* ux uy)))
    ((and (-? lx) (+? ux) (-? ly) (-? uy)) (make-interval (* lx ly) (* ux uy)))
    ((and (-? lx) (-? ux) (+? ly) (+? uy)) (make-interval (* lx ly) (* ux uy)))
    ((and (-? lx) (-? ux) (-? ly) (+? uy)) (make-interval (* lx ly) (* ux uy)))
    ((and (-? lx) (-? ux) (-? ly) (-? uy)) (make-interval (* lx ly) (* ux uy)))))

;ok shit this is way too disgusting and cancerous. bob i just got cancer why did
;you let me do a 9x if else statement containing 16 possible signs and 9 diff
;ways of getting the intervals. i hate you bob. i leave this unfinished as its tedious af.