class Monoid a where
        mempty :: a
        (<>)   :: a -> a -> a
        
instance Monoid [a] where
        mempty = []
        (<>)   = (++)
        
c :: Num a => [a]
c = [1, 2, 3]

d :: Num a => [a]
d = [4, 5, 6]

