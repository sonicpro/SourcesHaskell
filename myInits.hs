myInits :: [a] -> [[a]]
-- myInits xs = map reverse . scanl (flip (:)) [] $ xs
myInits xs = (map reverse) (scanl (flip (:)) [] xs)