import Control.Monad

sequence_' :: Monad m => [m a] -> m ()
sequence_' ms = foldr (>>) (return ()) ms

sequence' :: Monad m => [m a] -> m [a]
sequence' [] = return []
sequence' (m : ms)
  = do a  <- m
       as <- sequence' ms
       return (a : as)


---------------- getLine'
get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return xs
            _    -> get (xs ++ [x])


mapM' :: Monad m => (a -> m b) -> [a] -> m [b]
mapM' f [] = return []
mapM' f (a : as)
  = f a >>=
      \ b ->
        do bs <- mapM' f as
           return (bs ++ [b])
        