(defun list-files ()
  (with-open-stream (st (run-program "cmd" :arguments '("/c" "dir") :output :stream))
    (loop
       (let ((line (read-line st nil)))
	 (if line
	     (format t "~a~&" line)
	     (return))))))

(list-files)
