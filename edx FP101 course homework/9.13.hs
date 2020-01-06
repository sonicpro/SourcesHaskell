-- Monoid (from 9.11.hs).
class Monoid a where
        mempty :: a
        (<>)   :: a -> a -> a
        
instance Monoid [a] where
        mempty = []
        (<>)   = (++)

-- Foldable.
class (Functor t) => Foldable t where
         fold :: (Monoid m) => t m -> m
                 
instance Foldable [] where
        fold = foldr (<>) mempty
                