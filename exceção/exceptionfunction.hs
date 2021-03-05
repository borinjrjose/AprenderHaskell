import System.IO.Error
import System.IO
import System.Environment
import Control.Exception

main = toTry `catch` handler

toTry::IO ()
toTry = do
    (nomeArquivo:_) <- getArgs
    if nomeArquivo == "batata"
    then throw $ userError "Eu odeio batatas!"
    else do
        conteudo <- readFile nomeArquivo
        putStrLn $ "O arquivo tem " ++ show (length $ lines conteudo) ++ " linhas!"

handler::IOError -> IO ()
handler e
    | isDoesNotExistError e = 
        case ioeGetFileName e of Just caminho -> putStrLn $ "O arquivo não existe em: " ++ caminho
                                 Nothing -> putStrLn "O arquivo não existe e o caminho é desconhecido"
    | isUserError e = putStrLn $ ioeGetErrorString e
    | otherwise = ioError e