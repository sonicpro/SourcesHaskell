compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

-- The list of a->a functions can be passed to the above compose functions.
list :: Fractional a => [a -> a]
list = [recip, signum]

sumsqreven = compose [sum, map (^ 2), filter even]
