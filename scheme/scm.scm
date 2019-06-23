;; square root of x: iterative
(define (sqrt x)
  "Return square root of x"
  (define epsilon 0.00001)
  (define (squre x)
    (* x x))
  (define (abs x)
    (if (< x 0)
        (- x)
        x))
  (define (good-enough? guess)
    (< (abs (- (squre guess) x)) epsilon))
  (define (average a b)
    (/ (+ a b) 2))
  (define (improve guess)
    (average (/ x guess) guess))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0)
  )

;; sum: this is an abstraction concept
(define (sum f a next b)
  (if (> a b)
      0
      (+ (f a)
         (sum f (next a) next b))))

(define (sum-a-to-b a b)
  (define (identity x) x)
  (define (next x) (+ x 1))
  (sum identity a next b))

(define (pi-sum a b)
  (define (pi-item x) (/ 1.0 (* x (+ x 2))))
  (define (next a) (+ a 4))
  (sum pi-item a next b))
