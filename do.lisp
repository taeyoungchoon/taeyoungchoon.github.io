(do ((x 0 (+ x 1)))
    ((>= x 3))
  (print x))

(do ((x 0 (+ x 1)))
    ((= x 3))
  (print x))

(do ((x 0 (+ x 1))
     (y 0 (+ y 1)))
    ((= (+ x y) 10))
  (progn 
    (princ x)
    (princ y)))
