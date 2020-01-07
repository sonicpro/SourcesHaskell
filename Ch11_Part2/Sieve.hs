module Sieve ( sieve ) where

-- Applies Eratosthenes algorithm to a list of numbers
sieve :: [Int] -> [Int]
sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
