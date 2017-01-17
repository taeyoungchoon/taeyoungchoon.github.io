(defparameter ddos-ports '((:src 1 :dst 2)
			   (:src 3 :dst 4)))

(defparameter ips-ports '((:src 1 :dst 2)))

(defparameter ports '(ddos-ports ips-ports))
  
;; (dolist (lt '((:s 1 :d 2)(:s 3 :d 4))) (format t "~&~A - ~A" (getf lt :s) (getf lt :d)))
(dolist (lt ddos-ports)
  (format t "~&~A - ~A" (getf lt :src) (getf lt :dst)))

(defun print-ports (ports)
  (dolist (lt ports)
    (format t "~&~A - ~A" (getf lt :src) (getf lt :dst))))
  
(dolist (port ports)
  (print-ports port))

