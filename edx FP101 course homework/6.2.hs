import Prelude hiding (any)

any :: (a -> Bool) -> [a] -> Bool
any p xs = length (filter p xs) > 0
