(with-open-stream (st (run-program "df" :arguments (list "-h") :output :stream))
  (loop
     (let ((line (read-line st nil)))
       (if line
	   (format t "~a~&" line)
	   (return)))))
;;  (do ((line (read-line st nil) (read-line st nil)))
;;      ((null line))
;;    (format t "~a~%" line)))



