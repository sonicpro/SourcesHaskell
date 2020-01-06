data Tree = Leaf Int | Node Tree Tree
          
a :: Tree
a = Node (Leaf 1) (Leaf 2)
