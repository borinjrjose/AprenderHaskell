npi::String -> Float
npi expressao = 
    let itens = words expressao
        pilhaFinal = foldl calcular [] itens
    in head pilhaFinal
    where calcular (x:y:ys) "+" = (x+y):ys
          calcular (x:y:ys) "*" = (x*y):ys
          calcular (x:y:ys) "-" = (y-x):ys
          calcular (x:y:ys) "/" = (y/x):ys
          calcular (x:xs) "ln" = log x:xs
          calcular (x:y:ys) "^" = (y**x):ys
          calcular xs "sum" = [sum xs]
          calcular xs item = read item:xs