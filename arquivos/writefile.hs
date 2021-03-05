import System.IO
import Data.Char

main = do
    corpo <- readFile "linhaspequenas.txt"
    writeFile "linhaspequenascaps.txt" (map toUpper corpo)