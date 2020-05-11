#lang sicp
;just copy paste and modify the stuff in textbook first...
(define (make-deque) (cons '() '() ))
(define (front-ptr d) (car d))
(define (rear-ptr d) (cdr d))

(define (set-front-ptr! d item)
  (set-car! d item))

(define (set-rear-ptr! d item)
  (set-cdr! d item))

(define (empty-deque? d)
  (null? (front-ptr d)))

(define (front-deque d)
  (if (empty-deque? d)
      (error "front called with empty deque" d)
      (car (front-ptr d))))

(define (rear-deque d)
  (if (empty-deque? d)
      (error "rear called with empty deque" d)
      (car (rear-ptr d))))

(define (front-insert-deque! d item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? d)
           (set-front-ptr! d new-pair)
           (set-rear-ptr! d new-pair)
           d)
          (else
           (set-cdr! (rear-ptr d) new-pair)
           (set-rear-ptr! d new-pair)
           d))))

(define (rear-insert-deque! d item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? d)
           (set-front-ptr! d new-pair)
           (set-rear-ptr! d new-pair)
           d)
          (else
           (set-cdr! new-pair (front-ptr d))
           (set-front-ptr! d new-pair)
           d))))

(define (front-delete-deque! d)
  (cond ((empty-deque? d)
         (error "DELETE! called with an empty queue" d))
        (else (set-front-ptr! d (cdr (front-ptr d)))
              d)))

(define (rear-delete-deque! d)
  (cond ((empty-deque? d)
         (error "DELETE! called with an empty queue" d))
        (else (set-car! (rear-ptr d) nil)
              d)))

(define dq (make-deque))

;ok after testing, my deque works o(1) for front and rear insert, front
;delete.
;rear delete doesnt work, may need to use some weird doubly linked lists
;or some other shit that is beyond my comprehension for now.
;i give up.