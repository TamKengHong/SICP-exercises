#lang sicp
;ok firstly, if P1 or P2 overrides each other.
;x=100 or x = 1000.

;next, with interleaving:
;scenario: P1 or P2 finishes, then x draws that value from it.

;thus, x= 100*100*100 = 1 000 000, or x = 1000*1000 =1 000 000 (same)

;scenario 2: P1 or P2 draws diff values of x cuz the other process has
;finished and changed the value of x midway.

;thus, x= 10* 1000 = 10000, or x = 10 * 10 * 100 = 10000, (same)
;or x = 10* 100 * 100 = 100000.

;thus all answers are: x = 100, 1000, 10000, 100000, 1000000.

;if serialised, only x= 1 000 000 as P1 then P2 or P2 then P1.