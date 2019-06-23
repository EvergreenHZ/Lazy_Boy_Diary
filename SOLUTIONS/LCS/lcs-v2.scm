(define M
  (list 'A 'B 'C 'B 'D 'A 'B))
(define N
  (list 'B 'D 'C 'A 'B 'A))

(define prefix
  (lambda (i s)
    (if (= i 0)
      '()
      (cons (car s)
            (prefix (- i 1)
                    (cdr s))))))

(define (pick ith s)
  (if (= ith 1)
    (car s)
    (pick (- ith 1)
          (cdr s))))

(define (LCS x y)
  (define (optimal i j)
    (cond ((or (= i 0)
               (= j 0))
           0)
          ((eq? (pick i x)
                (pick j y))
           (+ 1
              (optimal (- i 1)
                       (- j 1))))
          (else
            (let* ((prefix_i-1_of_x (prefix (- i 1) x))
                   (prefix_j-1_of_y (prefix (- j 1) y))
                   (prefix_i_of_x (prefix i x))
                   (prefix_j_of_y (prefix j y))
                   (lcs1 (LCS prefix_i-1_of_x prefix_j_of_y))
                   (lcs2 (LCS prefix_i_of_x prefix_j-1_of_y)))
              (max lcs1 lcs2)))))

  (optimal (length x)
           (length 

(define (LCS-v2 x y)
  (define (optimal i j)
    (cond ((or (= i 0)
               (= j 0))
           0)
          ((eq? (pick i x)
                (pick j y))
           (+ 1
              (optimal (- i 1)
                       (- j 1))))
          (else
            (max (optimal (- i 1) j)
                 (optimal i (- j 1))))))

  (optimal (length x)
           (length y)))
