import System.IO

main = do
    handler <- openFile "girlfriend.txt" ReadMode
    resultado <- hGetContents handler
    putStr resultado