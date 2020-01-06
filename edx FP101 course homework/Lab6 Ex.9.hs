f :: Rose a -> Rose a

f = \r -> fmap head $ fmap (\x -> [x]) r