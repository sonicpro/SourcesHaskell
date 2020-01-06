import Control.Monad

---------------- getLine'
getLine' :: IO String
getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return xs
            _    -> get (xs ++ [x])


sequence' :: Monad m => [m a] -> m [a]
sequence' [] = return []
sequence' (m : ms)
  = do a  <- m
       as <- sequence' ms
       return (a : as)
                                 