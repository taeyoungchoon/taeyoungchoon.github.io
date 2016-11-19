(defun do-sth ()
  (let ((x 1) (y 2))
    (format t "~&~A" (+ x y)))
  
  (flet ((hello ()
	   (format t "~&hello")))
    (hello)))

(do-sth)
