safetail
  = \ xs ->
      case xs of
           [] -> []
           (_ : xs) -> xs
