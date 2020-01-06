import PrimeCheck
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]
