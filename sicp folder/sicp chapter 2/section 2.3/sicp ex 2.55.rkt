#lang sicp
(car ''abracadabra)
;as mentioned in footnote 34, 'a = (quote a), its a special form. so,
; ''abracadabra = (quote (quote abracadabra)), so the car just reaches for
;quote, because the outer quote gives '(quote abracadabra), a list
;containing quote and abracadabra.
;note that (car 'a) gives an error, as u cant car a symbol, only
;can car a list.