;;
;; number list
;; random
;; pop push
;; setf 
;; sort
;;

(defun t-random (max)
  (+ (random (- max 1)) 1))

#|
(defun t-random-test (max)
  (loop for i from 1 to 5
    do (print (t-random (max)))))
|#

(let ((lt (loop for num from 1 to 60 collect num)))
  (nth 10 lt))
