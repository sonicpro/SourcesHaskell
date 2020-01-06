remove :: Int -> ([a] -> [a])

remove n xs = take (n + 1) xs ++ drop n xs
