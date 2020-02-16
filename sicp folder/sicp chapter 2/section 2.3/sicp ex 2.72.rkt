#lang sicp
;the tree will usually be log n deep as it splits into two branches and so on
;so it will be log n growth to encode a symbol. usually o(log n)
;however, due to the special case in 2.71, it is n deep, and will have an
;o(n) order of growth for the least frequent symbols as it travels all the
;way down, but o(1) for most frequent as its on top of the tree, avg case
;is still o(n)

;ok slight error, symbol-check in encode-symbol iterates thru the list which
;is an o(n) process, so usually for normal trees it would then be o(n log n)
;and for least frequent symbols of special case 2.71 it would be o(n)
;most frequent symbols would be o(n^2)
;i.e. just times my previous working with n.