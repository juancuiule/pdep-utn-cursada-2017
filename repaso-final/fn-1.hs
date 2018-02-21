{-
  Unicidad de funciones:
    Es el mismo concepto de unicidad que en matemática, a cada x (entrada) le coresponde una única y (salida)

  Transparencia referencial:
    Una solución tiene transparencia referencial cuando podemos replazar una expreción E por su valor sin alterar el resultado del programa.

  Ventajas:
    - Es mucho más sencillo demostrar la correción de un programa (mejor testing)
    - Podemos calcular el resultado de la expresión la primera vez y luego almacenarlo para mejor la performance
    - No nos importa mucho en qué momento resolvemos la expresión, porque no depende de esto
-}

doble x = x * 2

-- doble 2 es 4

valorMasDobleDeDos x = x + doble 2
valorMasDobleDeDos' x = x + 4

{-
  Variables:
    En el paradigma funcional las variables no son una posición de memoria donde almaceno datos, son incognitas que se resuelven cuando quiero conocer el valor de una función en un punto determinado
-}

aproboAlumno :: Int -> Bool -- tipo
aproboAlumno nota = nota >= 6 -- cuerpo, nota es una incognita

pesosADolares :: Float -> Float
pesosADolares pesos = pesos / 20

millasAKilometros :: Float -> Float
millasAKilometros millas = millas * 1.609344