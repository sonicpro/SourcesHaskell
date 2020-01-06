divides :: Int -> Int -> Bool
divides x y = mod x y == 0

divisors :: Int -> [Int]
divisors n = [x | x <- [1 .. n], n `divides` x]
