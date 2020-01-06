module primeCheck ( prime ) where 
factor :: Int -> [Int]
factor x = 
    [n | n <- [1..x], x `mod` n == 0]

prime :: Int -> Bool
prime a = factor a == [1, a]
