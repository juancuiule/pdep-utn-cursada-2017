module Boliche where

import Text.Show.Functions
import Data.List

type Nombre = String
type Resistencia = Int

data Cliente = Cliente {
	nombre :: Nombre,
	resistencia :: Resistencia,
	amigos :: [Cliente],
	bebidasTomadas :: [Bebida]
} deriving (Show)

rodri = Cliente "Rodri" 55 [] [tintico]
marcos = Cliente "Marcos" 40 [rodri] [klusener "guinda"]
cristian = Cliente "Cristian" 2 [] [grogXD, jarraLoca]
ana = Cliente "Ana" 120 [rodri, marcos] []
robertoCarlos = Cliente "Roberto Carlos" 165 [] []

cantidadDeAmigos :: Cliente -> Int
cantidadDeAmigos =
	length.amigos

modificarResistencia :: Int -> Cliente -> Cliente
modificarResistencia cantidad cliente =
	cliente { resistencia = resistencia cliente + cantidad }

comoEsta :: Cliente -> String
comoEsta cliente
    | ((>50).resistencia) cliente = "fresco"
	| ((>1).cantidadDeAmigos) cliente = "piola"
	| otherwise = "duro"

yaEsAmigo :: Cliente -> Cliente -> Bool
yaEsAmigo amigo cliente =
	elem (nombre amigo) (map nombre (amigos cliente))

modificarListaDeAmigos :: Cliente -> Cliente -> Cliente
modificarListaDeAmigos amigo cliente = 
	cliente { amigos = amigo : amigos cliente }

agregarAmigo :: Cliente -> Cliente -> Cliente
agregarAmigo nuevoAmigo cliente
	| yaEsAmigo nuevoAmigo cliente = cliente
	| nombre cliente == nombre nuevoAmigo = cliente
	| otherwise = modificarListaDeAmigos nuevoAmigo cliente

type Bebida = Cliente -> Cliente
type Fuerza = Int
type Gusto = String
type Tiempo = Int

grogXD :: Bebida
grogXD cliente = modificarResistencia (- resistencia cliente) cliente

jarraLoca :: Bebida
jarraLoca cliente =
	cliente {
		resistencia = resistencia cliente - 10,
		amigos = (map (modificarResistencia (-10)) (amigos cliente))
	}

klusener :: Gusto -> Bebida
klusener gusto cliente =
	modificarResistencia (- length gusto) cliente

tintico :: Bebida
tintico cliente = 
	modificarResistencia (5 * (cantidadDeAmigos cliente)) cliente

soda :: Fuerza -> Bebida
soda fuerza cliente =
	cliente { nombre = ("e" ++ (replicate fuerza 'r') ++ "p" ++ (nombre cliente)) }

rescatarse :: Tiempo -> Cliente -> Cliente
rescatarse tiempo cliente
	| tiempo < 0 = cliente
	| tiempo > 3 = modificarResistencia 200 cliente
	| otherwise = modificarResistencia 100 cliente

agregarBebida :: Bebida -> Cliente -> Cliente
agregarBebida bebida cliente =
	cliente { bebidasTomadas = bebidasTomadas cliente ++ [bebida] }

tomarBebida :: Bebida -> Cliente -> Cliente
tomarBebida bebida =
	bebida.(agregarBebida bebida)

mezclarBebidas :: [Bebida] -> Bebida
mezclarBebidas bebidas =
	foldl1 (.) (map tomarBebida (reverse bebidas))

tomarTragos :: Cliente -> [Bebida] -> Cliente
tomarTragos cliente bebidas =
	 mezclarBebidas bebidas cliente

dameOtro :: Cliente -> Bebida
dameOtro =
	(last.bebidasTomadas)

noQuiebra :: Cliente -> Bebida -> Bool
noQuiebra cliente bebida =
	((>0).resistencia.bebida) cliente

cualesPuedeTomar :: Cliente -> [Bebida] -> [Bebida]
cualesPuedeTomar cliente bebidas =
	filter (noQuiebra cliente) bebidas

cuantasPuedeTomar :: Cliente -> [Bebida] -> Int
cuantasPuedeTomar cliente bebidas =
	length (cualesPuedeTomar cliente bebidas)


itinerarioDeAna = (klusener "huevo".rescatarse 2.klusener "chocolate".jarraLoca) ana

data Itinerario = Itinerario {
	nombreItinerario :: String,
	duracion :: Float,
	acciones :: [Cliente -> Cliente]
} deriving (Show)

mezclaExplosiva = Itinerario "Mezcla explosiva" 2.5 [tomarBebida grogXD, tomarBebida grogXD, (tomarBebida.klusener) "huevo", (tomarBebida.klusener) "frutilla"]
itinerarioBasico = Itinerario "Itinerario básico" 5 [(tomarBebida.klusener) "huevo", rescatarse 2, (tomarBebida.klusener) "chocolate", tomarBebida jarraLoca]
salidaDeAmigos = Itinerario "Salida de Amigos" 1 [(tomarBebida.soda) 1, tomarBebida tintico, agregarAmigo robertoCarlos, tomarBebida jarraLoca]

hacerItinerario :: Itinerario -> Cliente -> Cliente
hacerItinerario itinerario 	 =
	foldl1 (.) ((reverse.acciones) itinerario)

intensidad :: Itinerario -> Float
intensidad itinerario =
	(genericLength.acciones) itinerario / duracion itinerario

mayorSegun :: (Ord b, Num b) => (a -> b) -> a -> a -> Bool
mayorSegun funcion primerElemento segundoElemento =
	funcion primerElemento > funcion segundoElemento

devolverMayor :: Itinerario -> Itinerario -> Itinerario
devolverMayor primerItinerario segundoItinerario
	| mayorSegun intensidad primerItinerario segundoItinerario = primerItinerario
	| otherwise = segundoItinerario

itinerarioMasIntenso :: [Itinerario] -> Itinerario
itinerarioMasIntenso itinerarios =
	foldl1 devolverMayor itinerarios

chuckNorris = Cliente "Chuck" 1000 [ana] (map soda [1,2..])