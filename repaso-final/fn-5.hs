{-
  Orden superior
    Podemos usar funciones como parametros de otras

    filter :: (a -> Bool) -> [a] -> [a]
    filter even [1,2,3,4,5,6,7,8,9,10,11,12]
    \ [2,4,6,8,10,12]

    map :: (a -> b) -> [a] -> [b]
    map (* 2) [1,2,3,4,5]
    \ [2,4,6,8,10]
-}


