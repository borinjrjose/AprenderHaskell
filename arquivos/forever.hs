import Control.Monad
import Data.Char

main = forever $ do
    putStrLn "Me dê uma entrada:"
    entrada <- getLine
    putStrLn $ map toUpper entrada