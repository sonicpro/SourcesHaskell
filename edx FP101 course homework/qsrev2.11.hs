qsort [] = []
qsort (x : xs) = qsort larger ++ [x] ++ qsort smaller
  where smaller = [a | a <- xs, a <= x]
        larger = [b | b <- xs, b > x]
        
qsrev [] = []
qsrev (x : xs) = qsrev larger ++ [x] ++ qsrev smaller
  where larger = [a | a <- xs, a > x || a == x]
        smaller = [b | b <- xs, b < x]
