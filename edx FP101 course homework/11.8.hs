fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x, y) <- zip fibs (tail fibs)]

largeFib :: Integer
largeFib = head (dropWhile (<= 1000000) fibs)
