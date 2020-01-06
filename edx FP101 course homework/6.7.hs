dec2int :: [Integer] -> Integer
dec2int = foldl (\x y -> 10 * x + y) 0
