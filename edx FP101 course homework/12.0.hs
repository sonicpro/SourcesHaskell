import Prelude hiding (foldl)

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f v (x : xs) = foldl f (f v x) xs
foldl _ v [] = v
