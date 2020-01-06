import Data.Maybe
import Prelude hiding (Functor, fmap)

class Functor t where
        fmap :: (a -> b) -> t a -> t b
                 
instance Functor Maybe where
        fmap _ Nothing  = Nothing
        fmap f (Just a) = Just (f a)

-- Another Functor instance example.
instance Functor [] where
        fmap _ []       = []
        fmap f (x : xs) = f x : fmap f xs