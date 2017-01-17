(defun list-files ()
  (with-open-stream (st (run-program "ls" :arguments (list "-ltr") :output :stream))
    (loop
       (let ((line (read-line st nil)))
	 (if line
	     (format t "~a~&" line)
	     (return))))))

(list-files)
