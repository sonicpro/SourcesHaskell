import Prelude hiding ((||))

False || False = False
False || True = True
True || False = True
True || True = True
