;; (with-open-stream (st (run-program "lynx" :arguments (list "-dump" "https://www.kernel.org/finger_banner") :output :stream))
(with-open-stream (st (run-program "ps" :arguments (list "-ef") :output :stream))
  (loop
       (let ((line (read-line st nil)))
	 (if line
	     (format t "~a~&" line)
	     (return)))))



