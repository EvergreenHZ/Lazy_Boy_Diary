(define accumulate
  (lambda (op init seq)
    (if (null? seq)
      init
      (op (car seq)
          (accumulate op 
                      init
                      (cdr seq))))))

(define flatmap
  (lambda (proc seq)
    (accumulate append
                '()
                (map proc seq))))

(define (enumerate low high)
  (if (> low high)
    '()
    (cons low
          (enumerate (+ low 1) high))))

(define merge
  (lambda (s1 s2)
    (cond ((not (= (length s1)
                   (length s2)))
           (error "diff length -- MERGE" ))
          (else 
            (cons (cons (car s1) (car s2))
                  (merge (cdr s1) (cdr s2)))))))

(define pick
  (lambda (ith l)
    (if (= ith 1)
      (car l)
      (pick (- ith 1)
            (cdr l)))))
;;; Queue
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


;;; One Dimension Array
(define (lookup key table)
  (let ((record (assoc key (cdr table))))  ; records: (cdr table)
    (if record
      (cdr record)
      #f)))

(define (assoc key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else 
          (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
      (set-cdr! record value)
      (set-cdr! table
                (cons (cons key value)
                      (cdr table))))))

(define (make-table)
  (list '*table*))      ; Dummy Head



;;; Two Dimension Array
;(define (make-table-2d)
;  (let ((local-table (list '*table*)))
;    (define (lookup key-1 key-2)
;      (let ((subtable (assoc key-1 (cdr local-table))))
;        (if subtable
;          (let ((record (assoc key-2 (cdr subtable))))
;            (if record
;              (cdr record)
;              #f))
;          #f)))
;    (define (insert! key-1 key-2 value)
;      (let ((subtable (assoc key-1 (cdr local-table))))
;        (if subtable
;          (let ((record (assoc key-2 (cdr subtable))))
;            (if record
;              (set-cdr! record value)
;              (set-cdr! subtable
;                        (cons (cons key-2 value)
;                              (cdr subtable)))))
;          (set-cdr! local-table
;                    (cons (list key-1
;                                (cons key-2 value))
;                          (cdr local-table)))))
;      'ok)
;    (define (dispatch m)
;      (cond ((eq? m 'lookup) lookup)
;            ((eq? m 'insert) insert!)
;            (else (error "Unknow operation -- TABLE" m))))
;    dispatch))
;
;(define operation-table (make-table))
;(define put (operation-table 'insert-proc))
;(define get (operation-table 'lookup-proc))

(define (max-list l)
  (cond ((null? l)
         (error "MAX-LIST called with null list -- MAX-LIST"))
        (else
          (if (null? (cdr l))
            (car l)
            (max (car l)
                 (max-list (cdr l)))))))

(define INFINITY 10000000000)

(define memoize
  (lambda (f)
    (let ((table (make-table)))
      (lambda (x)
        (let ((previously-computed-value (lookup x table)))
          (or previously-computed-value
              (let ((result (f x)))
                (insert! x result table)
                result)))))))


;(define memoize
;  (lambda (f)
;    (let ((table (make-table)))
;      (lambda (x)
;        (let ((previously-computed-value (lookup x table)))
;          (or previously-computed-value
;              (let ((result (f x)))
;                (insert! x result table)
;                result)))))))
