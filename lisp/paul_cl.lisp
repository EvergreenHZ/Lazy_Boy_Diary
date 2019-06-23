(cons 'a 'b)

(setf x (list 1 2 3 4))

(defun our-listp (x)
  (or (null x) (consp x)))

;; NIL is not noly a list,
;; but also an atom

(defun our-atomp (x)
  (not (consp x)))

;; eql: same list
;; equal: have same elements
(eql (cons 'x 'y) (cons 'x 'y))
(equal (cons 'x 'y) (cons 'x 'y))

(setf x '(a b c)
      y (copy-list x))

(atom '())

(append '(a b) '(c d) 'e)

(nth 0 '(a b c))

(nthcdr 2 '(a b c))

(defun our-nthcdr (n lst)
  (if (zerop n)
      lst
      (our-nthcdr (- n 1) (cdr lst))))

(last '(a b c))
(defun last-elem (lst)
  (car (last lst)))

(mapcar #'(lambda (x) (+ x 10)) '(1 2 3))
(mapcar #'list '(a b c) '(1 2 3 4))
(maplist #'(lambda (x) x) '(a b c))

;; substitute tree
(subst 'y 'x (and x (zerop (x mod 2))))

(member 'b '(a b c))
(member '(a) '((a) b) :test #'equal)
(member 'a '((a b) (c d)) :key #'car)
(member-if #'oddp '(2 3 4))

(adjoin 'a '(a b c))
(adjoin 'z '(a b c))

(union '(a b c) '(c d e))
(intersection '(a b c) '(c d e))
(set-difference '(a b c) '(c d e))

(subseq '(a b c d) 1 2)  ;; [1, 2)
(subseq '(a b c d) 1)    ;; [1, len(lst))

(reverse '(a b c d))

(sort '(1 8 2 9 0 7 4) #'>)

(defun nthmost (n lst)
  (nth (- n 1)
       (sort (copy-list lst) #'>)))

(every #'oddp '(1 3 5))
(some #'evenp '(1 2 5))
(every #'> '(1 2 3) '( 4 5 6))


;; (push obj stack)
;; (pop stack)
(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))

;; pushnew use adjoin instead of cons

(defun porper-list? (lst)
  (or (null lst)
      (and (consp lst)
           (proper-list? (cdr lst)))))

;; use cons to construct dotted list
;; actually, it is a pair
;; Following are same
(a b)
(a . (b))
(a b . nil)
(a . (b . nil))

(setf trans '((+ . "add") (- . "subtract")))
(assoc '+ trans)

;; Array & references
(setf arr (make-array '(2 3) :initial-element nil))
(aref arr 0 0)

;; literal array
;; #na : n dimension array
;; *print-array* is global variable
#2a((b nil nil) (a nil nil))
(setf *print-array* t)

;; Vector
(setf vec (make-array 4 :initial-element nil))
(vector "a" 'b 3)
;; simple vector reference
(svref vec 0)

;; string & character
(sort "elbow" #'char<)
(aref "abc" 1)
(char "abc" 1)
(let ((str (copy-seq "Merlin")))
  (setf (char str 3) #\k)
  str)
(equal "Fred" "fred")  ;; NIL
(string-equal "Fred" "fred")  ;; T
(concatenate 'string "not " "to worry")

;; Sequence
;; length, remove, reverse, sort, every, some ...
;; list: nth
;; array/vector: aref/svref
;; string: char
;; sequence: elt
(position-if #'oddp '(1 2 3 4))

(reduce #'intersection '((a b c d) (b c d) (c d)))

;; define a struct
(defstruct point
  x
  y)
;; once you use defstruct
;; it automatically generate several functions
;; say make-point, point-p, copy-point, point-x, point-y
(setf p (make-point :x 1 :y 2))
(point-x p)
(point-y p)
(setf (point-x p) 0)


(setf ht (make-hash-table))
(gethash 'color ht)
(setf (gethash 'color ht) 'red)
(maphash #'(lambda (k v)
             (format t "~A = ~A%" k v))
         ht)

;; Control Flow
(progn
  (format t "A")
  (format t "B")
  (+ 1 2))

(block head
  (format t "HOW ARE YOU!")
  (return-from head 'IDEA)
  (format t "We will never see this!"))

(block nil
  (return 27))

;; hide in a nil block
(dolist (x '(a b c d))
  (format t "~A" x)
  (if (eql x 'c)
      (return 'done)))

(defun foo()
  (return-from foo 27))

(let ((x 1)
      (y (+ x 2)))
  (+ x y))

(let* ((x 1)
       (y (+ x 2)))
  (+ x y))

;; if, when, unless
;; cond, case(otherwise)


;; iteration: do

;; values: return multiple values
(setf return-list t)
(multiple-value-bind (x y z)
    (values 1 2 3)
  (setf return-list(list x y z)))
(multiple-value-call #'+ (values 1 2 3))
(multiple-value-list (values 'a 'b 'c))
(multiple-value-call #'list (values 1 2 3))

;; fboundp: function bound predicate
(setf (symbol-function 'add2)
      #'(lambda (x) (+ x 2)))

(defun foo()
  "This is the documentation"
  (+ 1 2))
(documentation 'foo 'function)

(labels ((len (lst)
           (if (null lst)
               0
               (+ 1
                  (len (cdr lst))))))
  (len '(a b c)))
;; labels is like let very much
