f :: [a] -> [b] -> [(a, b)]
f xs ys = [(x, y) | x <- xs, y <- ys]
