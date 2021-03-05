import Data.Char

main = do
    entrada <- getContents 
    putStr $ map toUpper entrada