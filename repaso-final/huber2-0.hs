import Text.Show.Functions -- para poder hacer show de fns <funtion>

type Nombre = String
type Direccion = String

data Chofer = Chofer {
  nombreChofer :: Nombre,
  kilometraje :: Float,
  viajes :: [Viaje],
  condicion :: Condicion
} deriving Show

type Dia = Int
type Mes = Int
type Año = Int
type Fecha = (Dia, Mes, Año)

type Cliente = (Nombre, Direccion)
nombre (n, _) = n
direccion (_, d) = d

data Viaje = Viaje Fecha Cliente Int deriving Show

fecha :: Viaje -> Fecha 
fecha (Viaje fecha _ _) = fecha

cliente :: Viaje -> Cliente 
cliente (Viaje _ cliente _) = cliente

costo :: Viaje -> Int 
costo (Viaje _ _ costo) = costo

type Condicion = Viaje -> Bool

tomaCualquierViaje :: Condicion
tomaCualquierViaje _ = True

tomaViajesCaros :: Condicion
tomaViajesCaros = (>200).costo

tieneMasDeNLetras :: Int -> Cliente -> Bool
tieneMasDeNLetras n = (>n).length.nombre

tomaVajesConClienteConMasDeNLetras :: Int -> Condicion
tomaVajesConClienteConMasDeNLetras n = (tieneMasDeNLetras n).cliente

tomaViajeSiNoViveEn :: String -> Condicion
tomaViajeSiNoViveEn zona =  (/=zona).direccion.cliente

lucas :: Cliente
lucas = ("Lucas", "Victoria")

daniel :: Chofer
daniel = Chofer {
  nombreChofer = "Daniel",
  kilometraje = 23500,
  viajes = [Viaje (20,04,2017) lucas 150],
  condicion = tomaViajeSiNoViveEn "Olivos"
}

alejandra :: Chofer
alejandra = Chofer {
  nombreChofer = "Alejandra",
  kilometraje = 180000,
  viajes = [],
  condicion = tomaCualquierViaje
}

choferPuedeTomarViaje :: Chofer -> Viaje -> Bool
choferPuedeTomarViaje = condicion

liquidacionChofer :: Chofer -> Int
liquidacionChofer = sum . map costo . viajes

choferesInteresados :: Viaje -> [Chofer] -> [Chofer]
choferesInteresados viaje choferes = filter (flip choferPuedeTomarViaje viaje) choferes

minSegun :: (Ord b) => (a -> b) -> a -> a -> a
minSegun trans a b
  | (trans a) < (trans b) = a
  | otherwise = b 

choferConMenosViajes :: [Chofer] -> Chofer
choferConMenosViajes = foldl1 (minSegun $ length.viajes)

agregarViaje :: Viaje -> Chofer -> Chofer
agregarViaje viaje chofer = chofer {
  viajes = viaje : (viajes chofer)
}

realizarViaje :: Viaje -> [Chofer] -> Chofer
realizarViaje viaje choferes = agregarViaje viaje (choferConMenosViajes.choferesInteresados viaje $ choferes)

nitoInfy :: Chofer
nitoInfy = Chofer {
  nombreChofer = nitoInfy,
  kilometraje = 70000,
  viajes = [reapeat (Viaje (11,03,2017) lucas 50)],
  condicion = tomaVajesConClienteConMasDeNLetras 2
}