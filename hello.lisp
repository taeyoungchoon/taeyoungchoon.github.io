;;;
;;; hello-world as always
;;;

(defparameter type-of-nubmers '((one two tree)
				(uno duo tre)
				(1 2 3)))

(defun say-number ()
  (let ((english '(one two tree))
	(italian '(uno duo tre)))
    (format t "~% ~a" english)
    (format t "~% ~a" italian)))

(loop for i in type-of-nubmers
   do (princ i))

