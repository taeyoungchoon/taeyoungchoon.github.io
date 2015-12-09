;;; hello.lisp

(defun hello-func ()
  (format t "~% hello"))

(defmacro hello-macro()
  `(let ((hello "hello, world"))
     (format t "~% ~a" hello)))

;;(hello-macro)
(hello-func)
