{-
  Composición de funciones:
    Matemáticamente podemos aplicar dos funciones generando una nueva funcion.
    g(f(a)): aplicamos g al resultado de aplicar f a "a".
    La única restricción para realizar la composición es que la Img de f este incluida en el Dom de g.
-}

doble :: Float -> Float
doble numero = 2 * numero

cuadruple :: Float -> Float
-- cuadruple numero = (doble . doble) numero
cuadruple = doble.doble

nombrePar :: String -> Bool
nombrePar = even.length -- calcula el largo y luego evalua si ese numero (cantiad de letras) es par

{-
  Aplicación Parcial
    Teniendo una función podemos pasarle la cantidad de parametros que querramos (mientras sean menos de los que indica su firma) y obtendremos una nueva función que espera los parametros restantes.
-}

segundoMayorQuePrimero :: Float -> Float -> Bool
segundoMayorQuePrimero x y = y > x

esMayorQueDos :: Float -> Bool
esMayorQueDos = segundoMayorQuePrimero 2
esMayorQueDos' = (>2)

{- Composición + Aplicación Parcial -}

-- Una palabra empieza con p?
esP :: Char -> Bool
esP = ('p'==)

empiezaConP :: String -> Bool
empiezaConP = esP.head