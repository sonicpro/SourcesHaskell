import Prelude hiding (takeWhile)

takeWhile :: (a -> Bool) -> [a] -> [a]
-- Interesting, but wrong:
-- takeWhile p = foldl (\ acc x -> if p x then x : acc else acc) []

takeWhile _ [] = []
takeWhile p (x : xs)
  | p x = x : takeWhile p xs
  | otherwise = []