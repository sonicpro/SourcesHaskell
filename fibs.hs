module Main where

fibs :: (Num a) => [a]
fibs = 0 : 1 : [fst x + snd x | x <- zip fibs (tail fibs)]


main :: IO ()
main = do putStr
          xs <- getLine
          putStrLn (show (length xs))
          
