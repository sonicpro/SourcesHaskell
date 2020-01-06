import Prelude hiding (map)

-- This definitions is just for less typing in testing.
p :: Num a => a -> a
p = signum

map :: (a -> b) -> [a] -> [b]
map f = foldl (\xs x -> xs ++ [f x]) []

