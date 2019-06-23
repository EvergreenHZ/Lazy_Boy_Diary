(load "sicp.scm")
(load "tree.scm")
;(horner-eval 2
;             (list 1 3 0 5 0 1))
;
;(define l
;  (list
;    (list 1 2 3)
;    (list 4 5 6)
;    (list 7 8 9)
;    (list 10 11 12)))
;
;(accumulate-n + 0 l)
;(define collect-car
;  (lambda (seqs)
;    (letrec ((f (lambda (l)
;                  (if (null? l)
;                    '()
;                    (cons (car (car l))
;                          (f (cdr l)))))))
;      (f seqs))))
;(collect-first l)
;
;(define collect-cdr
;  (lambda (seqs)
;    (letrec ((f (lambda (l)
;                  (if (null? l)
;                    '()
;                    (cons (cdr (car l))
;                          (f (cdr l)))))))
;      (f seqs))))
;(collect-cdr l)

;(fold-left / 1 (list 1 2 3))
;(fold-left list '() (list 1 2 3))

; please pay attention to the difference
;(accumulate cons
;            '()
;            (map (lambda (i)
;                   (map (lambda (j) (list i j))
;                        (enumerate-interval 1 (- i 1))))
;                   (enumerate-interval 1 10)))
;
;(accumulate append
;            '()
;            (map (lambda (i)
;                   (map (lambda (j) (list i j))
;                        (enumerate-interval 1 (- i 1))))
;                   (enumerate-interval 1 10)))

;(define (hello)
;  (define (say-hi)
;    (newline)
;    (display "Hi, Peter"))
;  (define (say-goodbye)
;    (newline)
;    (display "Goodbye, Peter"))
;  'done)

;(define l (list 1 2 3 4 5 6 7))
;
;(define ls
;  (list (cons 'a 'b)
;        (cons 1 2)
;        (cons 'c 'd)
;        (cons 3 4)
;        (cons 'e 'f)))
;
;(inorder-tranversal (list->tree l))
;
