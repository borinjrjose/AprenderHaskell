import System.Random
import Data.List

main = do
    ger <- getStdGen 
    let (primeiros20, resto) = splitAt 20 $ randomRs ('a','z') ger
        (ultimos20, _) = splitAt 20 resto
    putStrLn primeiros20
    putStrLn ultimos20