((lambda (f n)
   (cond ((= n 1) 1)
         (else
          (* n (f f (- n 1))))))
 (lambda (f n)
   (cond ((= n 1) 1)
         (else
          (* n (f f (- n 1))))))
 5)

;; fast-exp: iterative
(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((even? n)
         (let ((x (* b b)))
           (fast-exp-iter x (/ n 2) a)))
        (else
         (fast-exp-iter b (- n 1) (* a b)))))

(define (exp b n)
  (fast-exp-iter b n 1))

;; new *: recursion
(define (double x)
  (* 2 x))
(define (halve x)
  (/ x 2))
(define (new-* a b)
  (cond ((= b 1) a)
        ((even? b)
         (new-* (double a)
                (halve b)))
        (else
         (+ a
            (new-* a (- b 1))))))

(define (new-*-iter a b c)
  (cond ((= b 0) c)
        ((even? b)
         (new-*-iter (double a)
                     (halve b)
                     c))
        (else
         (new-*-iter a (- b 1) (+ a c)))))

(define (new-*-v2 a b)
  (new-*-iter a b 0))

;;(define Y
;;  (lambda (F)
;;    ((lambda (f_gen) (f_gen f_gen))
;;     (lambda (f) (F (f f))))))
;;
;;(define F
;;  (lambda (f n)
;;    (cond ((= n 1) 1)
;;          (* n (f (- n 1))))))

(define square
  (lambda (x)
    (* x x)))

(define (smallest-divisor n)
  "To find the smallest divisor, n should be bigger than 1"
  (define (next-item x)
    (if (= x 2)
        3
        (+ x 2)))
  (define (find-divisor n start)
    (cond ((> (square start) n) n)
          ((= (remainder n start) 0) start)
          (else
           (find-divisor n (next-item start)))))
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (expmod b n m)
  (cond ((= n 0) 1)
        ((even? n)
         (remainder
          (square (expmod b (/ n 2) m))
          m))
        (else
         (remainder (* b (expmod b (- n 1) m))
                    m))))

;;(define (fermat-test n)
;;  (define (try-it a)
;;    (= (expmod a n n) a))
;;  (try-it (+ 1 (random (- n 1)))))

(define (fermat-test n)
  (let ((a (+ 1 (random (- n 1)))))
    (= (expmod a n n) a)))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (timed-prime-test n)
  (define (report-time elapsed-time)
    (display "***")
    (display elapsed-time))
  (define (start-prime-test n start-time)
    (if (prime? n)
        (report-time (- (real-time-clock) start-time))))
  (newline)
  (display n)
  (start-prime-test n (real-time-clock)))

(define (search-for-primes start end)
  (if (< start end)
      (begin
        (timed-prime-test start)
        (search-for-primes (+ 2 start) end))))
