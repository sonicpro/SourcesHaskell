------------------------------------------------------------------------------------------------------------------------------
-- ROSE TREES, FUNCTORS, MONOIDS, FOLDABLES
------------------------------------------------------------------------------------------------------------------------------

data Rose a = a :> [Rose a] deriving Show
myTree = 1 :> [11 :> [111 :> [], 112 :> []], 12 :> [121 :> []]]
-- ===================================
-- Ex. 0-2
-- ===================================

root :: Rose a -> a 
root (top :> _) = top
  

children :: Rose a -> [Rose a]
children (_ :> [])         = []
children (top :> (x : xs)) = x : children (top :> xs)

xs = 0 :> [1 :> [2 :> [3 :> [4 :> [], 5 :> []]]], 6 :> [], 7 :> [8 :> [9 :> [10 :> []], 11 :> []], 12 :> [13 :> []]]]

ex2 = root . head . children . head . children . head . drop 2 $ children xs

-- ===================================
-- Ex. 3-7
-- ===================================
sizel :: [Rose a] -> Int
sizel []       = 0
sizel (x : xs) = size x + sizel xs

size :: Rose a -> Int
size (parent :> xs) = 1 + sizel xs

nonleaves :: Rose a -> Int
nonleaves (parent :> ch) = case ch of [] -> 0
                                      (x : xs) -> 1
                           + sum (map nonleaves ch)

leaves :: Rose a -> Int
leaves tree       = size tree - nonleaves tree


ex7 = (*) (leaves . head . children . head . children $ xs) (product . map size . children . head . drop 2 . children $ xs)

-- ===================================
-- Ex. 8-10
-- ===================================

instance Functor Rose where
  fmap f (parent :> []) = f parent :> []
  fmap f (parent :> xs) = f (parent) :> map (fmap f) xs

f :: Rose a -> Rose a
f = \r -> fmap head $ fmap (\x -> [x]) r

ex10 = round . root . head . children . fmap (\x -> if x > 0.5 then x else 0) $ fmap (\x -> sin(fromIntegral x)) xs

-- ===================================
-- Ex. 11-13
-- ===================================

class Monoid m where
  mempty :: m
  mappend :: m -> m -> m

newtype Sum a = Sum a
newtype Product a = Product a

instance Num a => Monoid (Sum a) where
  mempty = Sum 0
  mappend = \x -> \y -> Sum (unSum x + unSum y)
  
instance Num a => Monoid (Product a) where
  mempty = Product 1
  mappend = \x -> \y -> Product (unProduct x * unProduct y)

unSum :: Sum a -> a
unSum (Sum x) = x
unProduct :: Product a -> a
unProduct (Product x) = x

num1 = mappend (mappend (Sum 2) (mappend (mappend mempty (Sum 1)) mempty)) (mappend (Sum 2) (Sum 1))
  
num2 = mappend (Sum 3) (mappend mempty (mappend (mappend (mappend (Sum 2) mempty) (Sum (-1))) (Sum 3)))
  
ex13 = unSum (mappend (Sum 5) (Sum (unProduct (mappend (Product (unSum num2)) (mappend (Product (unSum num1)) (mappend mempty (mappend (Product 2) (Product 3))))))))

-- Ex.12
-- a :: Num string => Sum string
-- a = Sum 3 `mappend` Sum 4
-- ===================================
-- Ex. 14-15
-- ===================================

class Functor f => Foldable f where
  fold :: Monoid m => f m -> m
  foldMap :: Monoid m => (a -> m) -> (f a -> m)
  foldMap toMonoid = fold . fmap toMonoid

-- test = fold ["hello", "world"]
-- No instance for (Monoid [Char]) arising from a use of fold
    -- In the expression: fold ["hello", "world"]
    
-- Our definition of fold requires Monoid, the definition of foldMap requires both Monoid (m) and Foldable (f).
        
instance Foldable Rose where
  fold (parent :> xs) = foldl mappend parent (map fold xs)
  
sumxs = Sum 0 :> [Sum 13 :> [Sum 26 :> [Sum (-31) :> [Sum (-45) :> [], Sum 23 :> []]]], Sum 27 :> [], Sum 9 :> [Sum 15 :> [Sum 3 :> [Sum (-113) :> []], Sum 1 :> []], Sum 71 :> [Sum 55 :> []]]]

ex15 = unSum (mappend (mappend (fold sumxs) (mappend (fold . head . drop 2 . children $ sumxs) (Sum 30))) (fold . head . children $ sumxs))

-- ===================================
-- Ex. 16-18
-- ===================================

ex17 = unSum (mappend (mappend (foldMap (\x -> Sum x) xs) (mappend (foldMap (\x -> Sum x) . head . drop 2 . children $ xs) (Sum 30))) (foldMap (\x -> Sum x) . head . children $ xs))

ex18 = unSum (mappend (mappend (foldMap (\x -> Sum x) xs) (Sum (unProduct (mappend (foldMap (\x -> Product x) . head . drop 2 . children $ xs) (Product 3))))) (foldMap (\x -> Sum x) . head . children $ xs))

-- ===================================
-- Ex. 19-21
-- ===================================

fproduct, fsum :: (Foldable f, Num a) => f a -> a
fsum rose = unSum . fold $ fmap Sum rose
fproduct rose = unProduct . fold $ fmap Product rose

ex21 = ((fsum . head . drop 1 . children $ xs) + (fproduct . head . children . head . children . head . drop 2 . children $ xs)) - (fsum . head . children . head . children $ xs)

