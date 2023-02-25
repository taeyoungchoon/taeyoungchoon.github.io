;; report ydhms from seconds

(defvar val)
(setf val (+ (* 365 24 60 60) 3602))

(multiple-value-bind (l s) (floor val 60)
  (multiple-value-bind (l m) (floor l 60)
    (multiple-value-bind (l h) (floor l 24)
      (multiple-value-bind (y d) (floor l 365)
	(format t "~dy ~dd ~dh ~dm ~ds ~%" y d h m s)))))

