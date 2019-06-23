# NOTE
defun

defparameter

defconstant

setf

(setf a b
      c d
      e f) same as:
(setf a b)
(setf c d)
(setf e f)

the esscence of functional programming is to avoid using setf.

(progn s-exp1 s-exp2 ...)  ; same as begin in scheme

(dolist (obj lst)
        (do something here))
