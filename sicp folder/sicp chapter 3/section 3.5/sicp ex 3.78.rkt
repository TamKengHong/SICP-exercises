#lang sicp

;so we try to follow the diagram, our procedure takes in a b y0 dy0,
;produces a stream of successive y. now we set up the scale, add and
;integrals.

;we kinda copy the solve procedure in the text too, and set up the links
;of y, dy, ddy, and all the procedures.

(define (solve-2nd a b y0 dy0 dt)
  (define y (integral dy y0 dt))
  (define dy (integral ddy dy0 dt))
  (define ddy (add-stream (scale-stream dy a)
                          (scale-stream y b)))
  y)

;now, as long as we do the "smart" integral where we delay and force,
;there shouldnt be a problem.
  