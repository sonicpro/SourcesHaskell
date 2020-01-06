import Prelude hiding (foldl)
import Control.Monad

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f a []       = a
foldl f a (x : xs) = foldl f (f a x) xs

foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM f a []       = return a
foldLeftM f a (x : xs) = f a x >>= (\r -> foldLeftM f r xs)

