;; 19:02  up  1:24, 3 users, load averages: 1.14 1.31 1.41

;;(require "~/quicklisp/setup.lisp")
;;(ql:quickload :cl-ppcre)

(with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
  (let ((uptime (read-line st nil nil)))
    ;;    (multiple-value-bind (time up) (cl-ppcre:split "\\s+" uptime)
    ;;      (format t "~a~&" time))))
    ;;    (format t "~a~&" (car (split "\\s+" uptime)))))
    ;;    (format t "~a~&" (car (cl-ppcre:split "\\s+" uptime)))))
    ;;    (format t "~a~&" (cl-ppcre:split "\\s+" uptime))))
    ;;    (format t "~a~&" (car (cl-ppcre:split "\\s+" uptime)))))
    ;;    (format t "~a~%" (type-of uptime))))
    (format t "~a~%" uptime)))

