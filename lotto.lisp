(setf *random-state* (make-random-state t))

(setf lotto nil)
(setf pick nil)
(setf lt (loop for num from 1 to 45 collect num))

;;(loop for i from 1 to 3 do
(loop repeat 6 do
     (setf pick (nth (random (length lt)) lt))
     (setf lt (remove pick lt))
     (push pick lotto))

(format t "~A~%" (sort lotto #'<))
