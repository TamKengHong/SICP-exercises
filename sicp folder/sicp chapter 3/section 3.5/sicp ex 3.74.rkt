#lang sicp

(define zero-crossings
  (stream-map sign-change-detector
              sense-data
              (stream-cdr sense-data)))

;we just need to compare sense-data and the next value of it for each
;instance of sense-data, so this just applies the procedure to sense-data
;and the next value of sense-data.