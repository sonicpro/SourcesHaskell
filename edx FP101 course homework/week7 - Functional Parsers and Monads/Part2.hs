import Part1
import Prelude hiding (return)

p :: Parser (Char,Char)
p  = \inp -> do { x <- item inp;
                  z <- item (snd x);
                  y <- item (snd z);
                  return (fst x, fst y) (snd y) }
        
