#lang sicp

;since it doesnt have a delay like cons-stream, it will recurse infinitely
;and will not stop, (there is no lazy evaluation here due to no delay
;in the infinite stream)