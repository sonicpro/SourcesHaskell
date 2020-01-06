-- thrice - applies a function to an argument three times.
thrice :: (a -> a) -> a -> a
thrice f x = f (f (f (x)))


-- Converting the function into CPS style.
-- f_cps :: a -> ((a -> r) -> r)
-- f_cps x = \k -> k x

thrice_cps :: (a -> ((a -> r) -> r)) -> a -> ((a -> r) -> r)
thrice_cps f_cps x = \res ->
                            f_cps x $ \fx ->
                            f_cps fx $ \ffx ->
                            f_cps ffx $ res
