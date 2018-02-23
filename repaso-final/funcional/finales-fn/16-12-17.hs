import Text.Show.Functions -- para poder hacer show de fns <funtion>

data Alumno = Alumno {
  nombre :: String,
  dedicacion :: Int,
  conceptos :: [String]
} deriving Show

jonSnow = Alumno {
  nombre = "Jon Snow",
  dedicacion = 800,
  conceptos = ["nothing"]
}

pdep :: [String] -> Alumno -> Alumno
pdep conceptosNuevos (Alumno n d cs) = Alumno n d (cs ++ conceptosNuevos)

compliqueti101 :: Int -> Alumno -> Alumno
compliqueti101 reentregas (Alumno n d cs) = Alumno n (d + reentregas * 100) cs

-- compliqueti101 5 . pdep ["polimorfismo", "inversibilidad"] $ jonSnow
-- Alumno {nombre = "Jon Snow", dedicacion = 1300, conceptos = ["nothing","polimorfismo","inversibilidad"]}

-- dedicacion jonSnow
-- 800
-- porque no hay efecto colateral