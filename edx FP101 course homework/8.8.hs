import Control.Monad

isEven :: (Monad m, Integral a) => (a -> m Bool)
isEven = return . even

filterM' :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterM' _ [] = return []
filterM' p (x : xs)
  = do flag <- p x
       ys <- filterM' p xs
       if flag then return (x : ys) else return ys

       
       