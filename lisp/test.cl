(defun show-squares (start end)
  (do ((i start (+ i 1)))
    ((> i end) 'done)
    (format t "~A ~A ~%" i (* i i))))

(show-squares 1 5)


;(defun our-length (lst)
;  (let ((len 0))
;    (dolist (obj lst)
;      (setf len (+ len 1)))
;    len))

(defun hello (lst)
  (dolist (obj lst)
    (if (listp obj)
      (format t "dolist is ok~%")
      (format t obj))))

(hello '("hello~%" "world~%" (come on)))
