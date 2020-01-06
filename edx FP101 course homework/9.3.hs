import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
         | Succ Nat
         deriving Show
         
         
-- natToInteger
natToInteger :: Nat -> Integer
natToInteger Zero     = 0
natToInteger (Succ n) = natToInteger n + 1

-- add
add :: Nat -> Nat -> Nat
add Zero n     = n
add (Succ m) n = Succ (add m n)


mult :: Nat -> Nat -> Nat
mult m Zero  = Zero
mult m (Succ n) = add m (mult m n)
