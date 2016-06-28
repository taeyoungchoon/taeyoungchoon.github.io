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

(setq book3 (make-book
(write book1)
(terpri)
(write book2)
(setq book3( copy-book book1))
(setf (book-book-id book3) 100) 
(terpri)
(write book3)

;; so
(defparameter *box-db* nil)
(defstruct box name ip)
(push (make-box :name "svr1" :ip "1.1.1.1") *box-db*)
(push (make-box :name "svr2" :ip "1.1.1.2") *box-db*)
(write *box-db*)

;; list 
;; defstruct
;; hash

(defun hello-again ()
  (let ((name "jack"))
    (format t "hello ~A" name)))(cons t nil)
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

(setq book3 (make-book
(write book1)
(terpri)
(write book2)
(setq book3( copy-book book1))
(setf (book-book-id book3) 100) 
(terpri)
(write book3)

;; so
(defparameter *box-db* nil)
(defstruct box name ip)
(push (make-box :name "svr1" :ip "1.1.1.1") *box-db*)
(push (make-box :name "svr2" :ip "1.1.1.2") *box-db*)
(write *box-db*)

;; list 
;; defstruct
;; hash

(defun hello-again ()
  (let ((name "jack"))
    (format t "hello ~A" name)))

(hello-again)

(+ 3 3)
