(loop for i from 1 to 3 sum i)

(loop for i from 1 to 3
   when (evenp i)
   do (print i))

(loop for i in '(1 2 3) do (print i))

(loop for x from 1 to 3
      for y from 1 to 3
   collect (+ x y))


