halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

merge :: Ord a => [a] -> [a] -> [a]

merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  = if x <= y then x : merge xs (y : ys) else y : merge (x : xs) ys

msort [] = []
msort xs = merge (msort zs) (msort ys)
  where (ys, zs) = halve xs
  