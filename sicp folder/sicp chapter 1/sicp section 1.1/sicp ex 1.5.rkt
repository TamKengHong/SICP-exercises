#lang sicp
;for applicative order eval, since we eval the inside brackets
;before substituting, p will keep evaluating to itself and it will
;never terminate. Whereas for normal order eval, it will terminate
;as we substitute everything first, leading to the if statement which
;evals as 0.