import Prelude hiding (all)

all :: (a -> Bool) -> [a] -> Bool
all p xs = foldl (&&) True (map p xs)
