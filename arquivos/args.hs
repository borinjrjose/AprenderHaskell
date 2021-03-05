import System.Environment

main = do
    args <- getArgs
    nome <- getProgName 
    putStrLn "Estes são os os argumentos:"
    mapM_ putStrLn args
    putStrLn "Este é o nome do programa:"
    putStrLn nome