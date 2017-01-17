(labels ((h (x)
	   (+ x x)))
  (princ (h 1)))

(labels ((h (x)
	   (+ x x))
	 (more (x)
	   (* x x)))
  (princ (+ (h 2) (more 3))))

