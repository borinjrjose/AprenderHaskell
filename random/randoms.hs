import System.Random

randoms'::(RandomGen g, Random r) => g -> [r]
randoms' ger = 
    let (valor, novoGer) = random ger
    in valor:randoms' novoGer