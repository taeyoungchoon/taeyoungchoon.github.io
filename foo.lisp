(cons t nil)
(setf *lt* (list 1 2 3))

;;(jack raul ((1.1.1.1 mapping) (2.2.2.2 service)) 20151119)
(setf *db* '(:name "jack"
	     :aka "raul"
	     :ip '((cons "1.1" "mapping")
		   (cons "1.2" "service"))
	     :date "20151119"))

(with-open-file (out "foo.out"
		     :direction :output
		     :if-exists :supersede)
  (print *db* out))
;;  (with-standard-io-syntax (print *db* out)))


;;(print "this is print")
;;(princ "this is princ")
;;(prin1 "this is prin1")

;;(format nil "this is fommat")

