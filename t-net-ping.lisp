#|

* todo
- support windows
- if there is not ping program
- ping to service chk

|#

(defparameter *ping-locations* '("/sbin/ping" "/usr/bin/ping" "/bin/ping"))
(defparameter *google-dns* "8.8.8.8")
(defparameter *ping-options* "-c 3")

(defun file-exist (location)
  (probe-file location))

(defun service-ping (locations)
  (if locations
      (progn
	(if (file-exist (car locations))
	    (run-program (car locations) :arguments (list *ping-options* *google-dns*)))
   	(service-ping (cdr locations)))
      nil))

(service-ping *ping-locations*)


