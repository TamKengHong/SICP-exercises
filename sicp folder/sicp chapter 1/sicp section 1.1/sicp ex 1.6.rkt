#lang sicp
;new-if uses applicative order eval and will always call itself in the
;else clause. thus it will never evaluate. for normal if we know how
;it works so thats fine (will eval the predicate first, then skip the
;else if conditions are met.)