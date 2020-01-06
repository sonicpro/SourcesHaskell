pdc [] = 1
pdc (x : xs) = x * pdc xs
