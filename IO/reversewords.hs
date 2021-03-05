revertePalavras::String -> String 
revertePalavras = unwords . map reverse . words

main = do
    linha <- getLine 
    if null linha then
        return ()
    else do
        putStrLn $ revertePalavras linha
        main