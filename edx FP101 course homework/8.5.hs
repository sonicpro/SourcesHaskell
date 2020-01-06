import Control.Monad

---------------- putStrLn'
putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x : xs) = putChar x >> putStr' xs

putStrLn' :: String -> IO ()
putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putStr' "\n"

sequence_' :: Monad m => [m a] -> m ()
sequence_' ms = foldr (>>) (return ()) ms
