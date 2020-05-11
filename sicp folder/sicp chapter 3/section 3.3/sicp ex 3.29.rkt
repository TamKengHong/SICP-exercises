#lang sicp

;after trial and error and drawing out, i found that or-gate requires this:

; A----(NOT A)----C----
;                      |---(AND C D)---E---(NOT E)--- output.
; B----(NOT B)----D----

;where A B C D E output are wires.


(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input) 'ok)

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay
       and-gate-delay
       (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

;since we built the gates alr, we can use them. with help from textbook:

(define (or-gate A B output)
  (let ((C (make-wire))
        (D (make-wire))
        (E (make-wire)))
    (inverter A C)
    (inverter B D)
    (and-gate C D E)
    (inverter E output)
    'ok))

;delay time of or gate is 2 x inverter delay + and-gate-delay because the
;first part runs in parallel.