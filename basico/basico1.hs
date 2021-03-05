doubleMe::Int -> Int
doubleMe x = x + x

doubleUs x y = x*2 + y*2

doubleSmallNumber x = if x < 100
                        then doubleMe x
                        else x
fatorial 0 = 1
fatorial x = x*fatorial (x-1)

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)

fibonacci'::(Num a) => Int -> a
fibonacci' x = fibs !! x
    where fibs = 0:1:zipWith (+) fibs (tail fibs)

powerOf2::Int -> [Int]
powerOf2 i = [2^x|x <- [0..i]]

boomBangs::(Integral a) => [a] -> [[Char]]
boomBangs xs = [if x < 10 then "Boom!" else "Bang!"|x<-xs, odd x]

soma::[Int] -> Int
soma [] = 0
soma (x:xs) = x + soma xs

tamanho::(Num p) => [a] -> p
tamanho [] = 0
tamanho (_:xs) = 1 + tamanho xs

removeMinusculo::[Char] -> [Char]
removeMinusculo xs = [x|x<-xs, pertence x ['A'..'Z']]

pertence::(Eq a) => a -> [a] -> Bool
pertence _ [] = False
pertence x (y:ys) = if x == y then True else pertence x ys

naturais::(Num a, Enum a) => Int -> [a]
naturais x = take x t
    where t = 0:1:zipWith (+) [1,1..] (tail t)

aplicaNaLista::(a -> a) -> [a] -> [a]
aplicaNaLista _ [] = []
aplicaNaLista (fun) (x:xs) = (fun x):(aplicaNaLista (fun) xs)

opEmLista::(Num a) => (a -> a -> a) -> [a] -> [a] -> [a]
opEmLista _ [] _ = []
opEmLista _ _ [] = []
opEmLista (fun) (x:xs) (y:ys) = (fun x y):(opEmLista (fun) xs ys)

primeiro:: (a, b, c) -> a
primeiro (a, _, _) = a

segundo:: (a, b, c) -> b
segundo (_, b, _) = b

terceiro:: (a, b, c) -> c
terceiro (_, _, c) = c

addVector:: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x1, y1) (x2, y2) = (x1 + y1, x2 + y2)

cabeca:: [a] -> a
cabeca [] = error "Cabeça de Lista Vazia Não Existe"
cabeca (x:_) = x

diga:: (Show a) => [a] -> String
diga [] = "A Lista Esta Vazia"
diga [x] = "A Lista So Possui 1 Elemento: " ++ show x
diga [x, y] = "A Lista Possui 2 Elementos: " ++ show x ++ " " ++ show y
diga (x:y:_) = "Lista Grande com os 2 Primeiros Elementos Sendo " ++ show x ++ " " ++ show y

capital:: String -> String
capital [] = ""
capital tudo@(x:xs) = "A primeira letra de " ++ tudo ++ " e " ++ [x]

digaImc:: (RealFloat a) => a -> a -> String
digaImc peso altura
    | imc <= 18.5 = "Abaixo do peso, seu emo!"
    | imc <= 25.0 = "Peso normal. Pfff, aposto que voce e feio!"
    | imc <= 30.0 = "Voce e gordo. Perca peso, seu gordo!"
    | otherwise   = "Parabens! Voce e uma baleia!"
    where imc = peso / altura ^ 2

maximo:: (Ord a) => a -> a -> a
maximo a b
    | a > b = a
    | otherwise = b

compara:: (Ord a) => a -> a -> Ordering
compara a b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

iniciais:: String -> String -> String
iniciais [] _ = error "Primeiro nome vazio"
iniciais _ [] = error "Segundo nome vazio"
iniciais primeiroNome segundoNome = [p] ++ ". " ++ [s] ++ "."
    where (p:_) = primeiroNome
          (s:_) = segundoNome

calcImc:: (RealFloat a) => [(a, a)] -> [a]
calcImc xs = [imc p a | (p, a) <- xs]
    where imc peso altura = peso / altura^2

scanl':: (a -> b -> a) -> a -> [b] -> [a]
scanl' _ acc [] = [acc]
scanl' f acc (x:xs) = acc:(scanl' f (f acc x) xs)
