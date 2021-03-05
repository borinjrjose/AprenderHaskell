import System.IO
import System.Environment
import System.Directory
import Data.List

comandos::[(String, [String] -> IO ())]
comandos = [("listar", listar),
            ("adicionar", adicionar),
            ("remover", remover)]

listar::[String] -> IO ()
listar [nomeArquivo] = do
    conteudo <- readFile nomeArquivo
    putStrLn "Estes são os seus afazeres:"
    let lista = zipWith (\n linha -> show n ++ " - " ++ linha) [0..] $ lines conteudo
    mapM_ putStrLn lista

adicionar::[String] -> IO ()
adicionar [nomeArquivo, afazer] = appendFile nomeArquivo $ afazer ++ "\n"

remover::[String] -> IO ()
remover [nomeArquivo, item] = do
    handle <- openFile nomeArquivo ReadMode
    conteudo <- hGetContents handle
    temp <- getTemporaryDirectory
    (tempNome, tempHandle) <- openTempFile temp "temp"
    let linhas = lines conteudo
        afazeres = delete (linhas !! read item) linhas
    hPutStr tempHandle $ unlines afazeres
    hClose handle
    hClose tempHandle
    removeFile nomeArquivo
    renameFile tempNome nomeArquivo

main = do
    (comando:parametros) <- getArgs
    let (Just f) = lookup comando comandos in
        f parametros
