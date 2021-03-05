data Talvez a = Apenas a | Nada deriving (Show)

class Aplicar f where
    mapa::(a -> b) -> f a -> f b

instance Aplicar Talvez where
    mapa _ Nada = Nada
    mapa f (Apenas x) = Apenas (f x)