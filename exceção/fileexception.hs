import System.IO
import System.Environment
import Control.Exception

main = toTry `catch` handler

toTry::IO ()
toTry = do
    (nomearquivo:_) <- getArgs
    conteudo <- readFile nomearquivo
    putStrLn $ "O arquivo tem " ++ show (length $ lines conteudo) ++ " linhas!"

handler::IOError -> IO ()
handler e = putStrLn "Ocorreu algum erro!"