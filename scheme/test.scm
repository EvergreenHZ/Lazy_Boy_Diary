(define reciprocal
  (lambda (n)
    (if (= n 0)
      "oops!"
      (/ 1 n))))
(define lengt
  (lambda (ls)
    (if (null? ls)
      0
      (+ 1 (lengt (cdr ls))))))

(define tree-copy
  (lambda (ls)
    (if (not (pair? ls))
      #f
      (cons (tree-copy (car ls))
            (tree-copy (cdr ls))))))
(define next 0)
(define count
  (lambda ()
    (let ((v next))
      (set! next (+ next 1))
      v)))

(define count 
  (let ((next 0))
    (lambda ()
      (let ((v next))
        (set! next (+ next 1))
        v))))

(define make-counter
  (lambda ()
    (let ((next 0))
      (lambda ()
        (let ((v next))
          (set! next (+ next 1))
          v)))))

(define lazy
  (lambda (t)
    (let ((val #f)
          (flag #f))
      (lambda ()
        (if (not flag)
          (begin (set! val (t))
                 (set! flag #t))
          val)))))

(define p
  (lazy (lambda ()
          (display "Ouch!")
          (newline)
          "got me")))
(define make-queue
  (lambda ()
    (let ((end (cons 'ignored '())))
      (cons end end))))

(define putq!
  (lambda (q v)
    (let ((end (cons 'ignored '())))
      (set-car! (cdr q) v)
      (set-cdr! (cdr q) end)
      (set-cdr! q end))))

(define getq
  (lambda (q)
    (car (car q))))

(define delq!
  (lambda (q)
    (set-car! q (cdr (car q)))))
(define q (make-quweue))
(putq! q 'v)

(define two-in-a-row-b?
  (lambda (preceding lat)
    (cond 
      ((null? lat) #f)
      (else (or (eq? (car lat) preceding)
                (two-in-a-row-b?
                  (car lat)
                  (cdr lat)))))))

(define two-in-a-row?
  (lambda (lat)
    (cond 
      ((null? lat) #f)
      (else (two-in-a-row-b?
              (car lat)
              (cdr lat))))))
(define multirember
  (lambda (a lat)
    ((letrec 
       ((mr (lambda (lat)
              (cond 
                ((null? lat) '())
                ((eq? (car lat) a)
                 (mr (cdr lat)))
                (else
                  (cons (car lat)
                        (mr (cdr lat))))))))
       mr) lat)))

(define multirember
  (lambda (a lat)
    (letrec 
      ((mr (lambda (lat)
             (cond 
               ((null? lat) '())
               ((eq? (car lat) a)
                (mr (cdr lat)))
               (else
                 (cons (car lat)
                       (mr (cdr lat))))))))
      (mr lat))))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? (car l) a) (cdr l))
        (else (cons (car l) 
                    ((rember-f test?) a (cdr l))))))))

(define rember-eq? (rember-f eq?))

; this one is better
(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (letrec
        ((mr (lambda(lat)
               (cond
                 ((null? lat) '())
                 ((test? a (car lat)) (mr (cdr lat)))
                 (else 
                   (cons (car lat)
                         (mr (cdr lat))))))))
        (mr lat)))))

; this one is another definition of the last one
(define multirember-f
  (lambda (test?)
    (letrec
      ((m-f (lambda (a lat)
              (cond
                ((null? lat) '())
                ((test? a (car lat)) (m-f a (cdr lat)))
                (else 
                  (cons (car lat)
                        (m-f a (cdr lat))))))))
      m-f)))

(define union
  (lambda (set1 set2)
    (cond 
      ((null? set1) set)
      ((member? (car set1) set2)
       (union (cdr set1) set))
      (else 
        (cons (car set1)
              (union (cdr set1)
                     set2))))))

(define union
  (lambda (set1 set2)
    (letrec
      ((U (lambda (set)
            (cond
              ((null? set) set2)
              ((member? (car set) set2)
               (U (cdr set)))
              (else 
                (cons (car set)
                      (U (cdr set))))))))
      (U set1))))

(define union
  (lambda (set1 set2)
    (letrec
      ((U (lambda (set)
            (cond
              ((null? set) set2)
              ((M? (car set) set2)
               (U (cdr set)))
              (else 
                (cons (car set)
                      (U (cdr set)))))))
       (M? (lambda (a lat)
             (cond 
               ((null? lat) #f)
               ((eq? (car lat) a) #t)
               (else (M? a (cdr lat)))))))
      (U set1))))

(define union
  (lambda (set1 set2)
    (letrec
      ((U (lambda (set)
            (cond
              ((null? set) set2)
              ((M? (car set) set2)
               (U (cdr set)))
              (else 
                (cons (car set)
                      (U (cdr set)))))))
       (M? (lambda (a lat)
             (letrec
               ((N? (lambda l)
                    (cond 
                      ((null? l) #f)
                      ((eq? (car l) a) #t)
                      (else 
                        (N? (cdr l))))))
               (N? lat)))))
      (U set1))))
(define intersect
  (lambda (set1 set2)
    (letrec 
      ((I (lambda (set)
            (cond 
              ((null? set) '())
              ((member? (car set) set2)
               (cons (car set)
                     (I (cdr set))))
              (else (I (cdr set))))))
       (member? (lambda (a lat)
                  (cond 
                    ((null? lat) #f)
                    ((eq? a (car lat)) #t)
                    (else (member? a (cdr lat)))))))
      (I set1))))

(define intersectall
  (lambda (lset)
    (letrec
      ((A (lambda (lset)
            (cond
              ((null? (cdr lset)) (car lset))
              (else (intersect (car lset)
                               (A (cdr lset))))))))
      (cond 
        ((null? lset) '())
        (else (A lset))))))
(define deep
  (lambda (m)
    (cond 
      ((zero? m) 'pizza)
      (else (cons (deep (- m 1))
                  '())))))
(define findx
  (lambda (n Ns Rs)
    (letrec ((A (lambda (ns rs)
                  (cond 
                    ((null? ns) #f)
                    ((= (car ns) n) (car rs))
                    (else 
                      (A (cdr ns) (cdr rs)))))))
      (A Ns Rs))))

(define deepM
  (let ((Rs '())
        (Ns '()))
    (lambda (n)
      (let ((found (findx n Ns Rs)))
        (if (eq? found #f)
          (let ((result (deep n)))
            (set! Rs (cons result Rs))
            (set! Ns (cons n Ns))
            (display Rs)
            (newline)
            (display Ns)
            (newline)
            result)
          (display "hello"))))))
(define lengthx
  (let ((h (lambda (l) 0)))
    (set! h (lambda (l)
              (cond 
                ((null? l) 0)
                (else (+ 1
                         (h (cdr l)))))))
    h))

(define nibbler
  (lambda (food)
    (let ((x 'donut))
      (set! x food)
      (cons food
            (cons x '())))))

(define L
  (lambda (h)
    (lambda (l)
      (cond
        ((null? l) 0)
        (else (+ 1
                 (h (cdr l))))))))

(define length_new  ; h is length_new
  (let ((h (lambda (l) 0)))
    (set! h
      (L (lambda (arg) (h arg)))  ; h is length, the anonymous func (lambda (arg) (h arg)) is length, h is length
      h)))  ; check L, take lenght as arg, and return length
