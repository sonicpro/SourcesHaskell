{-# OPTIONS -XNPlusKPatterns #-}

import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
         | Succ Nat
         deriving Show
         
integerToNat :: Integer -> Nat

integerToNat 0       = Zero
integerToNat (n + 1) = Succ (integerToNat n)
