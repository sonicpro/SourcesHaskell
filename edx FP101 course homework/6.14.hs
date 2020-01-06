f :: Integral a => a -> Bool
f = even

-- f' :: Integral a => Bool -> a
f'' :: Integral a => a -> Bool 
-- f' = f . not
f'' = not . f

-- The following aliases will match f, g, h functions in the excerise respectively.
ff :: (RealFrac a, Integral b) => a -> b
ff = truncate
g :: Fractional a => a -> a
g = recip
h :: a -> a
h = id

f''' = ff . (g . h)
f'''' = (ff . g) . h
