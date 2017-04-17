type Nombre = String
type Resistencia = Int

-- Punto 1
data Cliente = Cliente {
	nombre :: Nombre,
	resistencia :: Resistencia,
	amigos :: [Cliente]
} deriving (Show, Eq)

-- Punto 2
rodri = Cliente "Rodri" 55 []
marcos = Cliente "Marcos" 40 [rodri]
cristian = Cliente "Cristian" 2 []
ana = Cliente "Ana" 120 [rodri, marcos]

cantidadDeAmigos :: Cliente -> Int
cantidadDeAmigos =
	length.amigos

modificarResistencia :: Int -> Cliente -> Cliente
modificarResistencia cantidad (Cliente nombre resistencia amigos) =
	Cliente nombre (resistencia + cantidad) amigos 

-- Punto 3
comoEsta :: Cliente -> String
comoEsta cliente
    | ((>50).resistencia) cliente = "fresco"
	| ((>1).cantidadDeAmigos) cliente = "piola"
	| otherwise = "duro"

-- Punto 4
yaEsAmigo :: Cliente -> Cliente -> Bool
yaEsAmigo amigo cliente =
	elem amigo (amigos cliente) 


modificarListaDeAmigos :: Cliente -> Cliente -> Cliente
modificarListaDeAmigos (Cliente nombre resistencia amigos) amigo = 
	Cliente nombre resistencia (amigo : amigos)

agregarAmigo :: Cliente -> Cliente -> Cliente
agregarAmigo cliente nuevoAmigo
	| yaEsAmigo nuevoAmigo cliente = cliente
	| cliente == nuevoAmigo = cliente
	| otherwise = modificarListaDeAmigos cliente nuevoAmigo

-- Punto 5 - Bebidas
type Bebida = Cliente -> Cliente
type Fuerza = Int
type Gusto = String
type Tiempo = Int

grogXD :: Bebida
grogXD cliente = modificarResistencia (- resistencia cliente) cliente

compartirJarraLoca :: Cliente -> Cliente
compartirJarraLoca (Cliente nombre resistencia amigos) =
	Cliente nombre resistencia (map (modificarResistencia (-10)) amigos)

jarraLoca :: Bebida
jarraLoca =
	compartirJarraLoca.(modificarResistencia (-10))

klusener :: Gusto -> Bebida
klusener gusto cliente =
	modificarResistencia (- length gusto) cliente

tintico :: Bebida
tintico cliente = 
	modificarResistencia (5 * (cantidadDeAmigos cliente)) cliente

soda :: Fuerza -> Bebida
soda fuerza (Cliente nombre resistencia amigos) =
	Cliente ("e" ++ (replicate fuerza 'r') ++ "p" ++ nombre) resistencia amigos

-- Punto 6
rescatarse :: Tiempo -> Cliente -> Cliente
rescatarse tiempo cliente
	| tiempo < 0 = cliente
	| tiempo > 3 = modificarResistencia 200 cliente
	| otherwise = modificarResistencia 100 cliente

-- Punto 7
-- Consulta a la consola
-- *Main> ((klusener "huevo").(rescatarse 2).(klusener "chocolate").jarraLoca) ana
-- Nombre: "Ana", Resistencia: 196, Amigos: [("Rodri",45,["Marcos"]),("Marcos",30,["Rodri"])]