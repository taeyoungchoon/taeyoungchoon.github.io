(defun build-dbname (mon day)
  (format nil "M6_LOG_2013~2,'0d~2,'0d_000000" mon day))

(defun main ()
  (loop for mon from 1 to 2 do
       (loop for day from 3 to 4 do
	    (format t "sp_detach_db ~a~&" (build-dbname mon day)))))
