import Data.Char
import Control.Monad

main = forever $ do
    putStrLn "Me dê entada, humano:"
    l <- getLine
    putStrLn $ map toUpper l
