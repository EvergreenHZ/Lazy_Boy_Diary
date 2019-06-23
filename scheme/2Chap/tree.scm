; Binary Tree
; (root left-tree right-tree)
; BST

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((else
           (element-of-set? x (right-branch set))))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        (else
          (make-tree (entry set)
                     (left-branch set)
                     (adjoin-set x (right-branch set))))))

; Middle Tranversal
; Have you seen the power of RECURSION !
(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

; car: required tree
; cdr: remaining part of elts
(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))       ; 1 represents for root
          (let ((this-entry (car non-left-elts))        ; root
                (right-result (partial-tree (cdr non-left-elts) 
                                            right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts (cdr right-result)))
              (cons (make-tree this-entry left-tree right-tree)
                    remaining-elts))))))))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define print-tree
  (lambda (tree)
    (cond ((null? tree) (newline))
          (else
            (begin (display (car tree))
                   (display "\t")
                   (print-tree (cadr tree))
                   (print-tree (caddr tree)))))))

(define inorder-tranversal
  (lambda (tree)
    (cond ((null? tree) (newline))
          (else
            (begin (inorder-tranversal (cadr tree))
                   (display (car tree))
                   (display "\t")
                   (inorder-tranversal (caddr tree)))))))

(define preorder-tranversal
  (lambda (tree)
    (cond ((null? tree) (newline))
          (else
            (begin (display (car tree))
                   (display "\t")
                   (preorder-tranversal (cadr tree))
                   (preorder-tranversal (caddr tree)))))))
