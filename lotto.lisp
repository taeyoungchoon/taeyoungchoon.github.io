(setf *random-state* (make-random-state t))

(setf lotto nil)
(setf pick nil)
(setf lt (loop for num from 1 to 10 collect num))

(setf pick (nth (random (length lt)) lt))
(setf lt (remove pick lt))
(push pick lotto)

(setf pick (nth (random (length lt)) lt))
(setf lt (remove pick lt))
(push pick lotto)

(setf pick (nth (random (length lt)) lt))
(setf lt (remove pick lt))
(push pick lotto)

(format t "~A~%" (sort lotto #'<))
