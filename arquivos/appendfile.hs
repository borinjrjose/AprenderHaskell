import System.IO

main = do
    putStrLn "Qual tarefa deseja adicionar?"
    linha <- getLine
    appendFile "lista.txt" (linha ++ "\n")