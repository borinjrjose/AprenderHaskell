import Data.Char

main = do 
    putStrLn "Qual o seu primeiro nome?"
    nome <- getLine
    putStrLn "Qual o seu sobrenome?"
    sobrenome <- getLine
    let nomeMaiusculo = map toUpper nome
        sobrenomeMaiusculo = map toUpper sobrenome
    putStrLn $ "Olá " ++ nomeMaiusculo ++ " " ++ sobrenomeMaiusculo ++ ", como você está?"