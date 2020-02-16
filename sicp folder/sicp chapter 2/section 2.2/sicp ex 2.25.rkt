#lang sicp
;1st one cdr cdr car to get (5 7), then extract 7 by cdr car.
(car
 (cdr
  (car
   (cdr
    (cdr (list 1 3 (list 5 7) 9))))))

;2nd, since its (list (list 7)), it should be car car to get list 7 then 7
(car
 (car (list (list 7))))

;3rd, run thru the list by cdr then car to get the next layer out. (6 times.)
(car
 (cdr
  (car
   (cdr
    (car
     (cdr
      (car
       (cdr
        (car
         (cdr
          (car
           (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))))))))

;well this works.
