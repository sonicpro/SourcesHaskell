import Prelude hiding (replicate)

replicate :: Int -> a -> [a]
replicate 1 _ = []
replicate n x = replicate (n - 1) x ++ [x]
