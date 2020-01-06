-- Insert this parser definition to parsing.lhs.
p :: Parser [Int]
p = do symbol "["
       n  <- natural
       ns <- many(do symbol ","
                     natural)
       symbol "]"
       return (n : ns)
       