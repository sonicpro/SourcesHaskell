data Tree = Leaf Integer
         | Node Tree Integer Tree
         
a :: Tree
a = Node (Leaf 3) 5 (Node (Leaf 6) 7 (Leaf 8))

occurs :: Integer -> Tree -> Bool
occurs m n = m == n
occurs m (Node l n r)
  | m == n = True
  | m < n = occurs m l
  | otherwise = occurs m r
