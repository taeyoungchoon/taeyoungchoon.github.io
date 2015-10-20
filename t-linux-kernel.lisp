;; (with-open-stream (st (run-program "lynx" :arguments (list "-dump" "https://www.kernel.org/finger_banner") :output :stream))
(with-open-stream (st (run-program "curl" :arguments (list "-s" "https://www.kernel.org/finger_banner") :output :stream))
  (loop
     (let ((line (read-line st nil)))
       (if line
	   (format t "~a~&" line)
	   (return)))))



