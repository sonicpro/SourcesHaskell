import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero
         | Succ Nat
         deriving Show

--natToInteger
natToInteger :: Nat -> Integer
natToInteger = \n -> genericLength [c | c <- show n, c == 'S']         

add :: Nat -> Nat -> Nat
add n (Succ m) = Succ (add m n)
add n Zero     = n
