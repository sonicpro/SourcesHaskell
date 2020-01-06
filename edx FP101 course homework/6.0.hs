f' :: (a -> b) -> (a -> Bool) -> [a] -> [b]

-- f :: (Num a) => a -> a
-- f x = signum x

-- p :: (Integral a) => a -> Bool
-- p x = even x

-- xs :: [Integer]

f' f p xs = [f x | x <- xs, p x]