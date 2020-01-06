import Prelude hiding (foldr)
import Control.Monad

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f b []       = b
foldr f b (x : xs) = f x (foldr f b xs)


foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM f b []       = return b
foldRightM f b (x : xs) = foldRightM f b xs >>= (\r -> f x r)
