import System.IO

withFile':: FilePath -> IOMode -> (Handle -> IO a) -> IO a
withFile' caminho modo f = do
    handle <- openFile caminho modo
    resultado <- f handle
    return resultado

main = do
    withFile "haicai.txt" ReadMode  (\handle -> do
        resultado <- hGetContents handle
        putStr resultado)