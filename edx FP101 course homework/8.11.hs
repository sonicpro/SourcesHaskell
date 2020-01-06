import Data.Char

liftM :: Monad m => (a -> b) -> m a -> m b
liftM f m = do x <- m
            return (f x)
