;(load "../utils.scm")

(define INFINITY 10000000)

; six matrices
(define pick
  (lambda (ith l)
    (if (= ith 0)
      (car l)
      (pick (- ith 1)
            (cdr l)))))

(define scale
  (list 30 35 15 5 10 20 25))

(define (matrix-chain-multiplication i j)
  (define (iter k result)
    (if (= k j)
      result
      (iter (+ k 1)
            (min result
                 (+ (matrix-chain-multiplication i k)
                    (matrix-chain-multiplication (+ k 1) j)
                    (* (pick (- i 1) scale)
                       (pick k scale)
                       (pick j scale)))))))
  (if (= i j)
    0
    (iter i INFINITY)))
