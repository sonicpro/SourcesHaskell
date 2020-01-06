import Prelude hiding (product)
product        :: [Int] -> Int
product []     = 1
product (n:ns) = n * product ns
