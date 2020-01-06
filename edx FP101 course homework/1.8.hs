qsort [] = []
qsort (x : xs)
  = reverse
      (reverse (qsort larger) ++ [x] ++ reverse (qsort smaller))
  where smaller = [a | a <- xs, a < x]
        larger = [b | b <- xs, b > x]
