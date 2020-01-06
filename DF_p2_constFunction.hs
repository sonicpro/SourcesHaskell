const :: a -> (b -> a)
const x = (\_ -> x)
