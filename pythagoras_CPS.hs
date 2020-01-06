-- We assume CPS versions of the add and square primitives,
-- (note: the actual definitions of add_cps and square_cps are not
-- in CPS form, they just have the correct type)
-- V.T.: That is, add_cps and square_cps pass the computed value 
-- applied to any suitable function they are applied to.


add_cps :: Int -> Int -> ((Int -> r) -> r)
add_cps x y = \k -> k (x + y)

square_cps :: Int -> ((Int -> r) -> r)
square_cps x = \k -> k (x * x)

pythagoras_cps :: Int -> Int -> ((Int -> r) -> r)
pythagoras_cps x y = \k -> (square_cps x $
                                \x_squared -> square_cps y $
                                    \y_squared -> add_cps x_squared y_squared
                           ) $ k
