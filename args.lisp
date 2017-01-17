(let ((name (first ext:*args*))
      (count (second ext:*args*)))
  (format t "~&the first name is ~A" name)
  (format t "~&the count is ~A" count))
