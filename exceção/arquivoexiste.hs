import System.Environment
import System.IO
import System.Directory

main = do
    (nome:_) <- getArgs
    existe <- doesFileExist nome
    if existe
    then do
        conteudo <- readFile nome
        putStrLn $ "O arquivo tem " ++ show (length $ lines conteudo) ++ " linhas!"
    else putStrLn "O arquivo não existe!!!!"
