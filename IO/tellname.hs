main = do
    putStrLn "Qual o seu nome?"
    nome <- getLine
    putStrLn ("Olá " ++ nome ++ ", prazer em conhecê-lo")