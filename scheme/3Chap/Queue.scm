;(define (front-ptr q) (car q))
;
;(define (rear-ptr q) (cdr q))
;
;(define (set-front-ptr q item)
;  (set-car! q item))
;
;(define (set-rear-ptr q item)
;  (set-cdr! q item))
;
;(define empty-queue?
;  (lambda (queue)
;    (if (null? (front-ptr queue))
;      #t
;      #f)))
;
;(define make-queue
;  (lambda ()
;    (cons '() '())))
;
;(define (front-queue queue)
;  (if (empty-queue? queue)
;    (error "FRONT called with an empty queue" queue)
;    (car (front-ptr queue))))
;
;(define (insert-queue! queue item)
;  (let ((new-pair (cons item '())))
;    (cond ((empty-queue? queue)
;           (set-front-ptr queue new-pair)
;           (set-rear-ptr queue new-pair))
;          (else 
;            (set-cdr! (rear-ptr queue) new-pair)
;            (set-read-ptr queue new-pair)
;            queue))))
;
;(define (delete-queue! queue)
;  (cond ((empty-queue? queue)
;         (error "DELETE! called with an empty queue" queue))
;        (else
;          (set-front-ptr! queue (cdr (front-ptr queue)))
;          queue))) 

(define make-queue
  (lambda ()
    (cons '() '())))

(define empty-queue?
  (lambda (queue)
    (if (null? (car queue))
      #t
      #f)))

(define enqueue
  (lambda (queue item)
    (let ((new-pair (cons item '())))
      (if (empty-queue? queue)
        (begin
          (set-car! queue new-pair)
          (set-cdr! queue new-pair)
          queue)
        (begin
          (set-cdr! (cdr queue) new-pair)
          (set-cdr! queue new-pair)
          queue)))))

(define dequeue
  (lambda (queue)
    (if (empty-queue? queue)
      (error "DELETE called with an empty queue -- DEQUEUE")
      (begin
        (set-car! queue (cdr (car queue)))
        queue))))
