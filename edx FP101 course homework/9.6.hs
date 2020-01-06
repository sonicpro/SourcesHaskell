data Tree = Leaf Integer
          | Node Tree Tree
          

balance :: [Integer] -> Tree
halve xs = splitAt (length xs `div` 2) xs
balance [x] = Leaf x
balance xs = Node (balance ys) (balance zs)
  where (ys, zs) = halve xs
  
  
a :: Tree
a = balance [2]

b :: Tree
b = balance [1, 2, 3]
