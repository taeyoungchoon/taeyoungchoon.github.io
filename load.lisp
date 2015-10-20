(require "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

(with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
  (let ((s (read-line st nil nil)))
    (let ((lst (cl-ppcre:split "\\s+" s)))
      (print (nth (- (length lst) 3) lst)))))
