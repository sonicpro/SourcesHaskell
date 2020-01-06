import Data.Char

let2int :: Char -> Int
let2int c = ord c - ord 'A'

int2let :: Int -> Char
int2let n = chr (ord 'A' + n)


shift :: Int -> Char -> Char
shift n c
  | isAlpha c = int2let ((let2int (toUpper c) + n) `mod` 26 + if isUpper c then 0 else 32)
  | otherwise = c
  
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
