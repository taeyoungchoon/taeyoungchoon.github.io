(require "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)
(use-package :cl-ppcre)

;;(defpackage :net.t0spring.t-shell (:use :common-lisp :cl-ppcre))
;;(in-package :net.t0spring.t-shell)
;;(use-package :net.t0spring.t-shell)

;; (in-package :cl-ppcre :cl-lib)
;; (with-open-stream (st (run-program "uptime" :arguments nil :output :stream))
;; (with-open-stream (st (run-shell-command "uptime | awk '{ print $1 }'" :output :stream))
(with-open-stream (st (run-shell-command "uptime" :output :stream))
  (let ((s (read-line st nil nil)))
    ;; (let ((lst (cl-ppcre:split "\\s+" s)))
    (let ((lst (split "\\s+" s)))
      (print (nth (- (length lst) 3) lst)))))

