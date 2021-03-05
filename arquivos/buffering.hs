import System.IO

main = withFile "linhaspequenas.txt" ReadMode (\handle -> do
    hSetBuffering handle $ BlockBuffering (Just 2048)
    resultado <- hGetContents handle
    putStr resultado)