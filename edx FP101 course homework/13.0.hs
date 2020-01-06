import Prelude hiding (foldl)

-- 13.0 a) in my interpertation where seed is "b" and list is "as".
-- foldl f b as = foldr (\x -> \g -> (\y -> g (f y x))) id as b

-- 13.0 b)
-- foldl f b as = foldr (\a b -> f b a) b as

-- 13.0 c)
foldl f = flip $ foldr (\a b g -> b (f g a)) id


--13.0 d)
-- foldl = foldr . flip
