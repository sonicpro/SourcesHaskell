import Prelude hiding (filter)

-- This alias for 'even' is just for less typing while testing 'filter' implementations.
p :: Integral a => a -> Bool
p = even

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\x xs -> if p x then x : xs else xs) []
