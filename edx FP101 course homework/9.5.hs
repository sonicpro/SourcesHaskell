data Tree = Leaf Integer
          | Node Tree Tree
          
-- Balanced tree.
a :: Tree
a = Node (Leaf 1) (Node (Leaf 2) (Leaf 3))

-- Not balanced tree.
b :: Tree
b = Node (Leaf 1) (Node (Leaf 2) (Node (Leaf 3) (Leaf 4)))

-- It's incorr.
balanced :: Tree -> Bool
leaves (Leaf _) = True
leaves (Node l r) = leaves l + leaves r
balanced (Leaf _) = True
balanced (Node l r)
  = abs(leaves l - leaves r) <= 1