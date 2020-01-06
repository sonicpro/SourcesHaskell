data Expr = Add Expr Expr | Val Int
          
a :: Expr
a = Add (Val 1) (Val 2)