import Text.Show.Functions -- para poder hacer show de fns <funtion>

{-
  Modelado y nuevos tipos de datos:
    - Listas
    - Tuplas
    - Tipos de dato definidos por el usuario
-}

{-
  Listas:
    Serie de elementos del mismo tipo.
    Puede ser vacia.

  Ejemplos:
    "Hola" => es una lista de caracteres
    [1, 2, 3]
    ["Hola", "Mundo"]
    [1..10] == [1,2,3,4,5,6,7,8,9,10]
    [1, 3..6] == [1,3,4,5,6]
    [1..] =0 [1,2,3,4,5,6,7..

  Pattern Matching:
    [] => lista vacia
    (x:xs) => separa cabeza (x) de cola (xs)
    (x:y:xs) => separa cabeza (x), segundo elemento (y) y cola (xs)
  
  Añadir un elemento:
    (1:[2,3]) == (1:(2:[3])) == (1:(2:(3:[])))

  Concatenar listas:
    [1,2] ++ [3,4] == [1,2,3,4]
-}

head' :: [a] -> a
head' (x:_) = x -- _ es una variable anonima

tail' :: [a] -> [a]
tail' (_:xs) = xs

{-
  Tuplas:
    Es un tipo de dato compuesto por una cantidad determinada de elementos
-}

type Nombre = String
type Direccion = String
type Edad = Int
type Persona = (Nombre, Edad, Direccion)

nombre :: Persona -> Nombre
nombre (n, _, _) = n

edad :: Persona -> Edad
edad (_, e, _) = e

direccion :: Persona -> Direccion
direccion (_, _, d) = d

{-
  Datas - Tipos de datos propios
-}

--   Tipo       Constructor
data Persona' = Persona' Nombre Edad deriving Show

juan = (Persona' "Juan" 19)

nombre' :: Persona' -> Nombre
nombre' (Persona' n e) = n

edad' :: Persona' -> Edad
edad' (Persona' n e) = e

-- Record Syntax para Datas

data Animal = Animal {
  nombreAnimal ::  String,
  edadAnimal :: Int,
  dueño :: String,
  tipo :: String,
  especiaEnPeligro :: Bool
} deriving Show

pietra = Animal {
  nombreAnimal = "Pietra",
  edadAnimal = 10,
  tipo = "Perra",
  dueño = "Juan",
  especiaEnPeligro = False
}

------ Ejercicio ------
type Dia = Int
type Mes = Int
type Año = Int
type Fecha = (Dia, Mes, Año)

data Alumno = Alumno {
  nombreAlumno :: String,
  fechaDeNacimiento :: Fecha,
  legajo :: Int,
  materias :: [String],
  criterio :: CriterioDeEstudio
} deriving Show

data Parcial = Parcial String Int deriving Show

materia :: Parcial -> String
materia (Parcial materia _) = materia

cantidadPreguntas :: Parcial -> Int
cantidadPreguntas (Parcial _ cantidad) = cantidad

type CriterioDeEstudio = Parcial -> Bool

estudioso :: CriterioDeEstudio
estudioso _ = True

hijoDelRigor :: Int -> CriterioDeEstudio
hijoDelRigor n (Parcial _ preguntas) = preguntas > n

cabulero :: CriterioDeEstudio
cabulero (Parcial materia _) = (odd.length) materia