main = do
    entrada <- getContents
    let linhas = lines entrada
        linhasPequenas = filter ((< 15) . length) linhas
    putStr $ unlines linhasPequenas