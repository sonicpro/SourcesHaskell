import Control.Monad


instance Monad Main.([]) where
        return x = [x]
        xs >>= f = concat (map f xs)
        