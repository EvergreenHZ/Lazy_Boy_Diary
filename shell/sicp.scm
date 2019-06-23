(define test-list
  (list (list 1 2 4) 4 5 0 (list (list 'a 'b) 4 'b)))

(define num-list
  (list (list 2 8 9) 0 4 (list (list 1 2) 7)))

(define set (list 1 2 3))

(define seq (list 2 3 1 9 5 7))

(define abs
  (lambda (x)
    (if (< x 0)
      (- 0 x)
      x)))

(define positive?
  (lambda (x)
    (> x 0)))

(define negative?
  (lambda (x)
    (< x 0)))

(define average
  (lambda (x y)
    (/ (+ x y) 2)))

(define (square x)
  (* x x))

(define tolerance 0.0001)

(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (if (even? n)
    #f
    #t))

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b
         (remainder a b))))

(define (sqrt x)
  (define (good-enough? guess)
    (if (< (abs (- (square guess) x)) tolerance)
      #t
      #f))
  (define (improve guess)
    (average guess (/ x guess)))
  (if (good-enough? guess)
    guess
    (sqrt (improve guess))))

(define (fact n)
  (if (= n 1)
    1
    (* n (fact (- n 1)))))

(define (Fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (+ (Fib (- n 1))
           (Fib (- n 2)))))

(define (fib-iter n)
  (define (iter n a b)
    (if (= n 0)
      b
      (iter (- n 1)
            (+ a b)
            a)))
  (iter n 1 0))

(define (cc amount kinds-of-coins)
  (define (pick-kind k)
    (cond ((= k 1) 1)
          ((= k 2) 5)
          ((= k 3) 10)
          ((= k 4) 25)
          ((= k 5) 50)))
  (+ (cc (- amount (pick-kind kinds-of-coins))
         kinds-of-coins)
     (cc amount
         (- kinds-of-coins 1))))

(define (exp-ord b n)
  (if (= n 0)
    1
    (* b
       (exp-ord b
                (- n 1)))))

(define (exp-iter b n)
  (define (iter b n result)
    (if (= n 0)
      result
      (iter b
            (- n 1)
            (* result b))))
  (iter b n 1))

(define (exp-lgn b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) iter b (/ n 2) (* a b b))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (prime? n)
  (define (divides? n test-divisor)
    (= (remainder n test-divisor) 0))
  (define (find-min-divisor test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? n test-divisor) test-divisor)
          (else (find-min-divisor (+ test-divisor 2)))))
  (= (find-min-divisor 2) n))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term
            (next a)
            next
            b))))

(define (sum-of-integers a b)
  (define (term x)
    x)
  (define (next y)
    (+ y 1))
  (sum term a next b))

(define (pi-sum a b)
  (define (term x)
    (/ 1.0 (* x (+ x 2))))
  (define (next y)
    (+ y 4))
  (sum term a next b))

(define (search f neg-point pos-point)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (let ((mid-point (average neg-point pos-point))
        (test-value (f mid-point)))
    (if (close-enough? neg-point pos-point)
      mid-point  ; guess is good enough
      (cond ((positive? test-value) (search f neg-point mid-point))
            ((negative? test-value) (search f mid-point pos-point))
            (else mid-point)))))  ; exactly equal

(define (half-inteval-method f a b)
  (let ((f-a (f a))
        (f-b (f b)))
    (cond ((and (negative? f-a) (positive? f-b)) (search f a b))
          ((and (negative? f-b) (positive? f-a)) (search f b a))
          (else
            (error "values are not of opposite sign" a b)))))

(define (fixed-point f)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (find-fixed-point first-guess)
    (let ((improved-guess (f first-guess)))
      (if (close-enough? first-guess improved-guess)
        first-guess
        (find-fixed-point improved-guess))))
  (find-fixed-point 1.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define sqrt
  (lambda (x)
    (fixed-point (average-damp
                   (lambda (y) (/ x y))))))

(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-trans g)
  (lambda (x)
    (- x
       (/ (g x)
          ((deriv g) x)))))

(define (newton-method g)
  (fixed-point (newton-trans g)))

;(define (cons x y)
;  (lambda (m)
;    (m x y)))
;
;(define (car z)
;  (z (lambda (p q) p)))
;
;(define (cdr z)
;  (z (lambda (p q) q)))
(define push-back
  (lambda (l x)
    (cond 
      ((null? l) (list x))
      (else (cons (car l)
                  (push-back (cdr l)
                             x))))))
(define reverse
  (lambda (l)
    (cond
      ((null? l) '())
      (else (push-back (reverse (cdr l))
                       (car l))))))

(define list-ref
  (lambda (l n)
    (if (= n 0)
      (car l)
      (list-ref (cdr l)
                (- n 1)))))

(define length
  (lambda (l)
    (if (null? l)
      0
      (+ (length (cdr l))
         1))))

(define length-iter
  (lambda (l)
    (letrec ((iter (lambda (l result)
                     (if (null? l)
                       result
                       (iter (cdr l)
                             (+ result 1))))))
      (iter l 0))))

(define append
  (lambda (l1 l2)
    (if (null? l2)
      l1
      (append (push-back l1 
                         (car l2))
              (cdr l2)))))
;list push-back

(define last-pair
  (lambda (l)
    (cond ((null? l) (error "Null list! Wrong parameter"))
          ((null? (cdr l)) (car l))
          (last-pair (cdr l)))))

(for-each (lambda (x) (newline) (display x))
          (list 1 2 3 4))


; map tree
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((pair? (car tree))
         (+ (count-leaves (car tree)
                          (cdr tree))))
        (+ 1
           (count-leaves (cdr tree)))))

(define COUNT 0)
(define deep-reverse
  (lambda (l)
    (cond ((null? l) '())
          ((not (pair? (car l)))
           (push-back (deep-reverse (cdr l))
                      (car l)))
          (else (push-back (deep-reverse (cdr l))
                           (deep-reverse (car l)))))))

(define (same-parity l)
  (define collect 
    (lambda (judge? l)
      (cond ((null? l) '())
            ((judge? (car l))
             (cons (car l) (collect judge? (cdr l))))
            (else (collect judge? (cdr l))))))
  (define judge-first
    (lambda (l)
      (if (odd? (car l))
        odd?
        even?)))
  (if (null? l)
    '()
    (cons (car l)
          (collect (judge-first l) (cdr l)))))

(define scale-list
  (lambda (l factor)
    (if (null? l)
      '()
      (cons (* factor (car l))
            (scale-list (cdr l) factor)))))

(define map
  (lambda (proc items)
    (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items))))))

(define scale-list-map
  (lambda (l factor)
    (map (lambda (x) (* (car l) factor))
         l)))

(define square-list
  (lambda (l)
    (if (null? l)
      '()
      (cons (square (car l))
            (square-list (cdr l))))))

(define square-list-map
  (lambda (l)
    (map square l)))

(define fringe
  (lambda (l)
    (cond ((null? l) '())
          ((not (pair? (car l)))
           (cons (car l)
                 (fringe (cdr l))))
          (else (append (fringe (car l))
                        (fringe (cdr l)))))))

(define scale-tree
  (lambda (tree factor)
    (cond ((null? tree) '())
          ((let ((first-item (car tree)))
             ((pair? first-item)
              (cons (* factor first-item)
                    (scale-tree (cdr tree) factor)))))
          (else (cons (scale-tree (car tree) factor)
                      (scale-tree (cdr tree) factor))))))

(define scale-tree-map
  (lambda (tree factor)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
             (scale-tree-map sub-tree factor)  ; wonderful
             (* sub-tree factor)))
         tree)))

(define square-tree
  (lambda (tree)
    (cond ((null? tree) '())
          ((not (pair? (car tree)))
           (cons (square (car tree))
                 (square-tree (cdr tree))))
          (else
            (cons (square-tree (car tree))
                  (square-tree (cdr tree)))))))

(define square-tree-map
  (lambda (tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
         tree)))

(define subsets
  (lambda (s)
    (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (set)              ; wonderful
                       (cons (car s) set))
                     rest))))))

;enumerate filter map accumulate
(define filter
  (lambda (predicate sequence)
    (cond ((null? sequence) '())
          ((predicate (car sequence))
           (cons (car sequence)
                 (filter predicate (cdr sequence))))
          (else
            (filter predicate (cdr sequence))))))

(define accumulate
  (lambda (op initial sequence)
    (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))))))

; OK, let's see some examples
(define enumerate-tree
  (lambda (tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (list tree))      ; take care, fringe is better
          (append (enumerate-tree (car tree))
                  (enumerate-tree (cdr tree))))))

(define sum-odd-squares
  (lambda (tree)
    (cond ((null? tree) 0)
          ((not (pair? (car tree)))  ; atom
           (if (odd? (car tree))
             (+ (square (car tree))
                (sum-odd-squares (cdr tree)))
             (sum-odd-squares (cdr tree))))
          (else
            (+ (sum-odd-squares (car tree))
               (sum-odd-squares (cdr tree)))))))

(define sum-odd-squares-std
  (lambda (tree)
    (accumulate +
                0
                (map square
                     (filter odd?
                             (fringe tree))))))

(define (even-fibs? n)
  (define (next k)
    (if (> k n)
      '()
      (let ((f (fib-iter k)))
        (if (even? f)
          (cons f (next (+ k 1)))
          (next (+ k 1))))))
  (next 0))

(define enumerate-interval
  (lambda (beg end)
    (if (> beg end)
      '()
      (cons beg
            (enumerate-interval (+ beg 1)
                                end)))))
(define even-fibs-std
  (lambda (n)
    (accumulate cons
                '()
                (filter even?
                        (map fib-iter
                             (enumerate-interval 0 n))))))

(define list-fib-squares 
  (lambda (n)
    (accumulate cons 
                '()
                (map square 
                     (map fib-iter
                          (enumerate-interval 0 n))))))

(define prod-of-seq-of-odd-elem
  (lambda (seq)
    (accumulate *
                1
                (map *
                     (filter odd?
                             seq)))))

(define (map-v2 p seq)
  (accumulate (lambda (x y) (cons (p x) y)) '() seq))

(define (append-v2 seq1 seq2)
  (accumulate cons 
              seq2
              seq1))  ;

(define (length-v2 seq)
  (accumulate (lambda (x y) (+ 1 y))
              0
              seq))

; this piece of code is very pretty
(define (horner-eval x coef-seq)
  (accumulate (lambda (this-coef higher-terms) 
                (+ this-coef
                   (* x
                      higher-terms)))
              0
              coef-seq))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op 
                      init 
                      (letrec ((f (lambda (l)
                                    (if (null? l)
                                      '()
                                      (cons (car (car l))
                                            (f (cdr l)))))))
                        (f seqs)))
          (accumulate-n op
                        init
                        (letrec ((g (lambda (l)
                                      (if (null? l)
                                        '()
                                        (cons (cdr (car l))
                                              (g (cdr l)))))))
                          (g seqs))))))

(define collect-car
  (lambda (seqs)
    (letrec ((f (lambda (l)
                  (if (null? l)
                    '()
                    (cons (car (car l))
                          (f (cdr l)))))))
      (f seqs))))

(define collect-cdr
  (lambda (seqs)
    (letrec ((f (lambda (l)
                  (if (null? l)
                    '()
                    (cons (cdr (car l))
                          (f (cdr l)))))))
      (f seqs))))

;fold-left fold-right
(define (fold-left-v2 op init seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest)))))
