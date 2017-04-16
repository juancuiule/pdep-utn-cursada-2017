type Nombre = String
type Resistencia = Int

-- Punto 1
data Cliente = UnCliente {
	nombre :: Nombre,
	resistencia :: Resistencia,
	amigos :: [Cliente]
}

-- Punto 2
rodri = UnCliente "Rodri" 55 [marcos]
marcos = UnCliente "Marcos" 40 [rodri]
cristian = UnCliente "Cristian" 2 []
ana = UnCliente "Ana" 120 [rodri, marcos]

-- funciones para usar en show Cliente
amigoATupla :: Cliente -> (Nombre, Resistencia, [String])
amigoATupla cliente =
	(nombre cliente, resistencia cliente, (armarListaDeNombres.amigos) cliente)

armarListaDeNombres :: [Cliente] -> [String]
armarListaDeNombres listaDeAmigos =
	map nombre listaDeAmigos

instance Show Cliente where
  show (UnCliente nombre resistencia amigos) =
  	"Nombre: " ++ show nombre ++ ", Resistencia: " ++ show resistencia ++ ", Amigos: " ++ show (map amigoATupla amigos)

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
	| not (yaEsAmigo cliente nuevoAmigo) && not (nombre cliente == nombre nuevoAmigo) =
		UnCliente (nombre cliente) (resistencia cliente) ( nuevoAmigo : (amigos cliente))
	| otherwise = cliente

-- Punto 5 - Bebidas
type Bebida = Cliente -> Cliente
type Fuerza = Int
type Gusto = String
type Tiempo = Int

grogXD :: Bebida
grogXD cliente =
	UnCliente (nombre cliente) 0 (amigos cliente)

jarraLoca :: Cliente -> Cliente
jarraLoca cliente =
	UnCliente
			(nombre cliente)
			(resistencia cliente - 10)
			(map jarraLoca (amigos cliente))

klusener :: Gusto -> Bebida
klusener gusto cliente =
	UnCliente
		(nombre cliente)
		(resistencia cliente - length gusto)
		(amigos cliente)

tintico :: Bebida
tintico cliente = 
	UnCliente
		(nombre cliente)
		(resistencia cliente + (5 * (length.amigos) cliente))
		(amigos cliente)

soda :: Fuerza -> Bebida
soda fuerza cliente =
	UnCliente
	("e" ++ (replicate fuerza 'r') ++ "p" ++ (nombre cliente))
	(resistencia cliente)
	(amigos cliente)

-- Punto 6
rescatarse :: Tiempo -> Cliente -> Cliente
rescatarse tiempo cliente
	| tiempo < 0 = cliente
	| tiempo > 3 = UnCliente (nombre cliente) (resistencia cliente + 200) (amigos cliente)
	| otherwise = UnCliente (nombre cliente) (resistencia cliente + 100) (amigos cliente)

-- Punto 7
-- Consulta a la consola
-- *Main> ((klusener "huevo").(rescatarse 2).(klusener "chocolate").jarraLoca) ana
-- Nombre: "Ana", Resistencia: 196, Amigos: [("Rodri",45,["Marcos"]),("Marcos",30,["Rodri"])]