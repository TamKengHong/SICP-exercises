#lang sicp
;by using *, there are now two copies of the original expmod procedure,
;thus it will keep splitting up into 2^log(n) copies, which runs in O(n) time
;compared to just using square where theres one instance of expmod, so its
;O(log n)