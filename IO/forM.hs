import Control.Monad

main = do
    cores <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Qual cor você associa com " ++ show a ++ "?"
        cor <- getLine 
        let minhaCor = "Cor " ++ cor
        return minhaCor)
    putStrLn "As cores que você associou com 1, 2, 3 e 4 foram:"
    mapM_ print cores   