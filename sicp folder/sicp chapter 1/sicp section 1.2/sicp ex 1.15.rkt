#lang sicp
;because its (p (sine (/ angle 3.0))), the evaluator will eval the
;inside brackets first, so it will become (sine 12.15)->(p (sine 4.05))
;-> (p (p (sine 1.35) and so on until 0.05, which is total 5 times.

;both the time and space complexity is logarithmic, specifically log3
;this is because for space complexity, we keep track of the number of p
;which grows logarithmically wrt. the angle as we repeatedly divide by 3
;the number of steps taken is counted by the number of times you apply
;procedure p, thus its also logarithmic.