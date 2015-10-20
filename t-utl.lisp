(defun sep ()
  (format t "~%"))

(defun stamp()
  (multiple-value-bind (second minute hour day month year) (get-decoded-time) 
    (format nil "~d/~d/~d ~d:~d:~d" year month day hour minute second)))

(defun start ()
  (sep)
  (format t "[start at ~a]~%" (stamp))
  (sep))

(defun end ()
  (sep)
  (format t "[end at ~a]~%" (stamp))
  (sep))

(defun message (msg)
  (format t "[~a]~%" msg))
