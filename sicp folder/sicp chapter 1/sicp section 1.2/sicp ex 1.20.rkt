#lang sicp
;normal eval order will use much more remainders, as when u expand
;gcd (a,b) to gcd (b,r); u expand that again to get gcd(r, r(b,r))
;then, gcd(r(b,r) ,r(r(b,r),r) and so on, where u keep taking the
;remainders of remainders until it hits 0. Thus its much more tedious
;compared to applicative order, where the remainder operations wont
;carry over, thus there is less in applicative order.