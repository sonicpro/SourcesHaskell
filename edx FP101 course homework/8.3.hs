import System.IO

getLine' :: IO String
getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
            '\n' -> return (x : xs)
            _    -> get (xs ++ [x])
            