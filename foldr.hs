f = foldr (\x y -> concat ["(",x,"+",y,")"]) "0" (map show [1..4])
