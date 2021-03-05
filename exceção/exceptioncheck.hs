import System.Environment
import System.IO
import Control.Exception
import System.IO.Error

main = toTry `catch` handler

toTry::IO ()
toTry = do
    (nomeArquivo:_) <-getArgs
    conteudo <- readFile nomeArquivo
    putStrLn $ "O arquivo tem " ++ show (length $ lines conteudo) ++ " linhas!"

handler:: IOError -> IO ()
handler e
    | isDoesNotExistError e = putStrLn "O arquivo não existe!!!"
    | otherwise = ioError e