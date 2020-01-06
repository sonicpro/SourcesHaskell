order :: Integer -> Integer
order n = truncate (logBase 10 (fromIntegral n))

posWeights :: [Integer]
posWeights = [10 ^ x | x <- [0..20]]
