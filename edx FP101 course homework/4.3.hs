factors :: Int -> [Int]
factors x = [n | n <- [1 .. x], x `mod` n == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1 .. n], isPerfect x]
  where isPerfect num = sum (init (factors num)) == num
  