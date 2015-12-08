;;;
;;; hello-world as always
;;;

(defmacro hello()
  `(let ((hello "hello, world"))
     (format t "~% ~a" hello)))

(hello)
