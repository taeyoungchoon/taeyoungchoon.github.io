;;; hello.lisp

(defun hello-func ()
  "this is the hello function"
  (format t "~% hello"))

(defmacro hello-macro()
  `(let ((hello "hello, world"))
     (format t "~% ~a" hello)))

(hello-macro)
