import System.Random

randomsFinito::(RandomGen g, Random r, Num n, Eq n) => n -> g -> ([r], g)
randomsFinito 0 ger = ([], ger)
randomsFinito n ger =
    let (valor, novoGer) = random ger
        (outrosValores, gerFinal) = randomsFinito (n-1) novoGer
    in (valor:outrosValores, gerFinal)