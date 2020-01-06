f = foldl (\acc x -> concat ["(", acc, "+", x, ")"]) "0" (map show [1..5])

