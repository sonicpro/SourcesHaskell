import Prelude hiding (concat)

concat :: [[a]] -> [a]
concat [[]] = []
concat (xs : xss) = xs ++ concat xss
