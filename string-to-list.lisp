;; 19:02  up  1:24, 3 users, load averages: 1.14 1.31 1.41

(require "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

(with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
  (let ((s (read-line st nil nil)))
    (print (cl-ppcre:split "\\s+" s))))
#|
     (with-input-from-string (s uptime)
	(progn
	  (print (type-of s))
	  (multiple-value-bind (time up) (cl-ppcre:split "\\s+" s)
	    (print time)))))))
|#
  

