import Prelude hiding (dropWhile)

dropWhile p = foldl add []
  where add [] x = if p x then [] else [x]
        add acc x = x : acc
        