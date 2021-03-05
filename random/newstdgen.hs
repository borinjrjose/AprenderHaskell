import System.Random

main = do
    ger <- getStdGen
    putStrLn $ take 20 $ randomRs ('a','z') ger
    ger' <- newStdGen
    putStrLn $ take 20 $ randomRs ('a','z') ger'