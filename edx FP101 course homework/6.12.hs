import Prelude hiding (map)

unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)
  
map :: (a -> b) -> [a] -> [b]
map f = unfold null (f . head) tail
