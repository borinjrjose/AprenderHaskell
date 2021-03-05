import System.IO

main = do
    resultado <- readFile "linhaspequenas.txt"
    putStr resultado