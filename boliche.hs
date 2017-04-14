-- Punto 1
data Cliente = UnCliente {
	nombre :: String,
	resistencia :: Int,
	amigos :: [Cliente]
}

-- Punto 2
rodri = UnCliente "Rodri" 55 []
marcos = UnCliente "Marcos" 40 [rodri]
cristian = UnCliente "Cristian" 2 []
ana = UnCliente "Ana" 120 [rodri, marcos]

listaNombres :: [Cliente] -> [String]
listaNombres listaDeAmigos =
	map nombre listaDeAmigos

instance Show Cliente where
  show (UnCliente nombre resistencia amigos) =
  	"Nombre: " ++ show nombre ++ "\nResistencia: " ++ show resistencia ++ "\nAmigos: " ++ show (listaNombres amigos)

{-
type Nombre = String
type Resistencia = Int
type Cliente = (Nombre, Resistencia, [Cliente])

unRodri :: Cliente
unRodri = ("Rodri", 55, [])

unMarcos :: Cliente
unMarcos = ("Marcos", 40, [nombre unRodri])

unCristian :: Cliente
unCristian = ("Cristian", 2, [])

unaAna :: Cliente
unaAna = ("Ana", 120, [nombre unRodri, nombre unMarcos])

nombre :: Cliente -> Nombre
nombre (elNombre, _, _) = elNombre

resistencia :: Cliente -> Resistencia
resistencia (_, laResistencia, _) = laResistencia

amigos :: Cliente -> [Cliente]
amigos (_, _, losAmigos) = losAmigos
-}
-- Punto 3
comoEsta :: Cliente -> String
comoEsta cliente
    | ((>50).resistencia) cliente = "fresco"
	| ((>1).length.amigos) cliente = "piola"
	| otherwise = "duro"

-- Punto 4
yaEsAmigo :: Cliente -> Cliente -> Bool
yaEsAmigo cliente amigo =
	elem (nombre amigo) (map nombre (amigos cliente))

agregarAmigo :: Cliente -> Cliente -> Cliente
agregarAmigo cliente nuevoAmigo
	| not (yaEsAmigo cliente nuevoAmigo) =
		UnCliente (nombre cliente) (resistencia cliente) ( nuevoAmigo : (amigos cliente))
	| otherwise = cliente

-- Punto 5 - Bebidas
type Bebida = Cliente -> Cliente

type Gusto = Int

huevo :: Gusto
huevo = length "Huevo"

chocolate :: Gusto
chocolate = length "Chocolate"

frutilla :: Gusto
frutilla = length "Frutilla"

{-grogXD :: Bebida
grogXD cliente =
	((nombre cliente), 0, (amigos cliente))

jarraLoca :: Cliente -> [Cliente]
jarraLoca cliente =
	((nombre cliente), (resistencia cliente - 10), (amigos cliente)) : (map ((nombre cliente), (resistencia cliente - 10), (amigos cliente)) (amigos cliente) )
-}