import Control.Monad

data Maybe a = Nothing | Just a

instance Monad Main.Maybe where
        return x = Main.Just x
        Main.Nothing >>= _ = Main.Nothing
        (Main.Just x) >>= f = f x
        