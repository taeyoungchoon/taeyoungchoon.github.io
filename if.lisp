(if (evenp 4)
    (progn 'this-is-even
	   'and-say-to-you))

(defparameter *choose* 3)
(defun check-choose () 
  (if (> *choose* 1)
      'big-dream
      'cute))

(defun alive-p () )
(defun brave-p () )

(if 'alive-p
    'brave-p)

(if (and 'alive-p 'brave-p)
    'brave)

(if t
    (if t 'tt))

(let ((x 1) (y 2))
  (if (> x y)
      'x
      'y))

(if t
    (let ((x 1) (y 2))
      (format t "~a~%" (+ x y))))
