module Lab5 where

import Control.Monad

data Concurrent a = Concurrent ((a -> Action) -> Action)

data Action 
    = Atom (IO Action)
    | Fork Action Action
    | Stop

instance Show Action where
    show (Atom x) = "atom"
    show (Fork x y) = "fork " ++ show x ++ " " ++ show y
    show Stop = "stop"

-- Ex. 0
action :: Concurrent a -> Action
action (Concurrent f) = f (\c -> Stop)

-- Ex. 1
stop :: Concurrent a
stop = Concurrent (\c -> Stop)

-- Ex. 2
atom' :: IO a -> ((a -> Action) -> Action)
atom' x = \c -> Atom (do {a <- x;
                        return (c a);
                        })
                   
atom :: IO a -> Concurrent a
atom x = Concurrent (atom' x)

-- Ex. 3
fork :: Concurrent a -> Concurrent ()
fork (Concurrent f) = Concurrent(\c -> Fork (action (Concurrent f)) (c ()))

par :: Concurrent a -> Concurrent a -> Concurrent a
par (Concurrent f1) (Concurrent f2) = Concurrent (\c -> Fork (f1 c) (f2 c))

-- Ex. 4
unwrap (Concurrent b) = b

instance Monad Concurrent where
    (Concurrent ma) >>= g =
      let bu = unwrap ((Concurrent ma) >>= g)
      in Concurrent (\c -> ma (flip (\a -> bu) c))
    return x              = Concurrent (\c -> c x)

bind :: ((a -> Action) -> Action) -> (a -> ((b -> Action) -> Action)) -> ((b -> Action) -> Action)
bind ma = \f -> \c -> ma (flip f c)
        
-- Ex. 5
roundRobin :: [Action] -> IO ()
roundRobin []       = return ()
roundRobin (x : xs) = case x of
  Atom a     -> do x <- a
                   roundRobin (xs ++ [x])
  Fork a1 a2 -> roundRobin (xs ++ [a1, a2])
  Stop       -> roundRobin xs
  
-- ===================================
-- Tests
-- ===================================

ex0 :: Concurrent ()
ex0 = par (loop (genRandom 1337)) (loop (genRandom 2600) >> atom (putStrLn ""))

ex1 :: Concurrent ()
ex1 = do atom (putStr "Haskell")
         fork (loop $ genRandom 7331) 
         loop $ genRandom 42
         atom (putStrLn "")


-- ===================================
-- Helper Functions
-- ===================================

run :: Concurrent a -> IO ()
run x = roundRobin [action x]

genRandom :: Int -> [Int]
genRandom 1337 = [1, 96, 36, 11, 42, 47, 9, 1, 62, 73]
genRandom 7331 = [17, 73, 92, 36, 22, 72, 19, 35, 6, 74]
genRandom 2600 = [83, 98, 35, 84, 44, 61, 54, 35, 83, 9]
genRandom 42   = [71, 71, 17, 14, 16, 91, 18, 71, 58, 75]

loop :: [Int] -> Concurrent ()
loop xs = mapM_ (atom . putStr . show) xs

