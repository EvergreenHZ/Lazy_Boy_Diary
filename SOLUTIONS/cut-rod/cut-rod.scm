(load "../utils.scm")

(define price
  (list 1 5 8 9 10 17 17 20 24 30))

(define (cut-rod n)
  (define (iter i result)
    (if (> i n)
      result
      (iter (+ i 1)
            (max result
                 (+ (cut-rod (- n i))
                    (pick i price))))))
  (iter 1 0))

(define (cut-rod-memo n)
  (let ((table (make-table)))
    (insert! 0 0 table)
    (insert! 1 (pick 1 price) table)

    (define (iter n)
      (let ((rn (lookup n table)))
        (if rn
          rn
          (let ((result (max-list (cons (pick n price)
                                        (map (lambda (i) (+ (pick i price)
                                                            (cut-rod-memo (- n i))))
                                             (enumerate 1 (- n 1)))))))
            (begin 
              (insert! n result table)
              result)))))
    (iter n)))

(define (cut-rod-memo-v2 n)
  (let ((table (make-table)))

    (define (iter n)
      (let ((rn (lookup n table)))
        (or rn
            (let ((result (max-list (cons (pick n price)
                                          (map (lambda (i) (+ (pick i price)
                                                              (cut-rod-memo-v2 (- n i))))
                                               (enumerate 1 (- n 1)))))))
              (insert! n result table)
              result))))
    (iter n)))

(define (cut-rod-memo-v3 n)
  (let ((table (make-table)))

    ((lambda (n)
      (let ((rn (lookup n table)))
        (or rn
            (let ((result (max-list (cons (pick n price)
                                          (map (lambda (i) (+ (pick i price)
                                                              (cut-rod-memo-v3 (- n i))))
                                               (enumerate 1 (- n 1)))))))
              (insert! n result table)
              result)))) n)))
