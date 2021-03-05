import System.Random

tresMoedas::StdGen -> (Bool, Bool, Bool)
tresMoedas ger =
    let (moeda1, novoGer) = random ger
        (moeda2, novoGer') = random novoGer
        (moeda3, novoGer'') = random novoGer' in
            (moeda1, moeda2, moeda3)