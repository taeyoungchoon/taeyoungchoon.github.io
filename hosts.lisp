(with-open-file (file "/etc/hosts" :direction :input)
  (loop
     (let ((line (read-line file nil)))
       (if line
	   (format t "~a~%" line)
	   (return)))))

