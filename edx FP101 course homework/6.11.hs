unfold :: (b -> Bool) -> (b -> a) -> (b -> b) -> b -> [a]
unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)
  
type Bit = Int

-- The following function outputs binaries so-speak, low-endian, i.e. least significant bit first.
int2bin :: Int -> [Bit]
-- int2bin 0 = []
-- int2bin n = n `mod` 2 : int2bin (n `div` 2)
-- Here is a nice example of function partial application for infix functions (`mod` and `div`). 
-- They take it's right argument and return a function that takes Integral (originally left argument) and returns Integral.
int2bin = unfold (== 0) (`mod` 2) (`div` 2)

chop8 :: [Bit] -> [[Bit]]
-- chop8 [] = []
-- chop8 bits = take 8 bits : chop8 (drop 8 bits)
chop8 = unfold null (take 8) (drop 8) 
