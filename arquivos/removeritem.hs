import System.IO
import Data.List
import System.Directory

main = do
    handle <- openFile "lista.txt" ReadMode
    conteudo <- hGetContents handle
    temp <- getTemporaryDirectory
    (tempNome, tempHandle) <- openTempFile temp "lista"
    let linhas = lines conteudo
        lista = zipWith (\n linha -> show n ++ "-" ++ linha) [0..] linhas
    putStrLn "Essas são suas tarefas:\n"
    mapM_ putStrLn lista
    putStrLn "Qual você deseja deletar?"
    tarefa <- getLine
    let novaLista = delete (linhas !! read tarefa) linhas
    hPutStr tempHandle $ unlines novaLista
    hClose tempHandle
    hClose handle
    renameFile tempNome "lista1.txt"