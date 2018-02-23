type Distancia = Int
type FactorDificultad = Int

data Carrera = Carrera {
  nombre :: String,
  tramos :: [(Distancia, FactorDificultad)]
} deriving Show

carreras :: [Carrera]
carreras = [Carrera "Ironman" [(3860, 7), (180000, 1), (42200,3)],Carrera "Maratón" [(42200, 3)],Carrera "Embolsados" [(20, 4)]]

-- calculoDeResistencia :: (Distancia, FactorDificultad) -> Int
-- calculoDeResistencia (d, f) = d * f

-- resistenciaRequerida :: Carrera -> Int 
-- resistenciaRequerida = sum . map calculoDeResistencia . tramos

-- estaPorDebajoDelLimite :: Int -> Carrera -> Bool
-- estaPorDebajoDelLimite limite =
--   (<limite).resistenciaRequerida  

-- puedenCompletarse :: Int -> [Carrera] -> [String]
-- puedenCompletarse resitenciaLimite carreras =
--   map nombre $ filter (estaPorDebajoDelLimite resitenciaLimite) $ carreras

-- 1) Falso
-- 2) Falso
-- 3) Verdadero
-- 4) Falso, el fin o no de la evaluación depende de la existencia de un elemento que "puedenCompletarse"