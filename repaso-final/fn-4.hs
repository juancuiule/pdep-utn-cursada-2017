{-
  Recursividad:
    Una función se puede llamar a si misma
-}

factorial :: Int -> Int
factorial' :: Int -> Int

factorial n
  | n == 0  = 1 -- caso base
  | n > 0   = n * factorial (n - 1) -- caso recursivo

factorial' 0 = 1 -- caso base
factorial' n = n * factorial' (n - 1) -- caso recursivo

fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci(n - 1) + fibonacci(n - 2)

{-
  Evaluación Diferida (Lazy evaluation)
    - Solo se evalua lo necesario
-}

muchosDe :: Int -> [Int]
muchosDe n = n : (muchosDe n) -- no tiene fin...

-- pero...
-- (head . muchosDe) 5 == 5
-- (sum . take 10 . muchosDe) 5 == 50