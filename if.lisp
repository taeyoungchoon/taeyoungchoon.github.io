(if (evenp 4)
    (progn 'this-is-even
	   'and-say-to-you))

(defparameter *choose* 3)
(defun check-choose () 
  (if (> *choose* 1)
      'big-dream
      'cute))
