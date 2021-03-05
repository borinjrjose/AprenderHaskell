import System.Random
import Control.Monad

main = do
    ger <- getStdGen
    let (numeroR, novoGer) = randomR (1,10) ger::(Int,StdGen)
    putStrLn "Qual número de 1 a 10 estou pensando?"
    linha <- getLine
    when (not $ null linha) $ do
        let numero = read linha
        if numero == numeroR
        then putStrLn "Acertou!!!"
        else putStrLn $ "Desculpe, o número era " ++ show numeroR
        newStdGen
        main