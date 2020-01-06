data Action 
    = Atom (IO Action)
    | Fork Action Action
    | Stop

instance Show Action where
    show (Atom x) = "atom"
    show (Fork x y) = "fork " ++ show x ++ " " ++ show y
    show Stop = "stop"

-- ===================================
-- Ex. 0
-- ===================================
cont :: a -> Action
cont _ = Stop

f :: (a -> Action) -> Action
f _ = Stop

action :: ((a -> Action) -> Action) -> Action
action x =
         | 
