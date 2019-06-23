(define X
  (list 'A 'B 'C 'B 'D 'A 'B))
(define Y
  (list 'B 'D 'C 'A 'B 'A))

(define (pick ith s)
  (if (= ith 1)
    (car s)
    (pick (- ith 1)
          (cdr s))))

(define (LCS i j)
  (cond ((or (= i 0)
             (= j 0))
         0)
        ((eq? (pick i x)
              (pick j y))
         (+ 1
            (LCS (- i 1)
                 (- j 1))))
        (else
          (max (LCS (- i 1) j)
               (LCS i (- j 1))))))

(define (test)
  (LCS (length x)
       (length y)))
