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
modificarListaDeAmigos cliente amigo = 
	cliente { amigos = amigo : amigos cliente }

agregarAmigo :: Cliente -> Cliente -> Cliente
agregarAmigo cliente nuevoAmigo
	| yaEsAmigo nuevoAmigo cliente = cliente
	| nombre cliente == nombre nuevoAmigo = cliente
	| otherwise = modificarListaDeAmigos cliente nuevoAmigo

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

--agregarBebida :: Cliente -> Bebida -> Cliente
--agregarBebida cliente bebida =
--	Cliente 

agregarBebida :: Bebida -> Cliente -> Cliente
agregarBebida bebida cliente =
	cliente { bebidasTomadas = bebidasTomadas cliente ++ [bebida] }

tomarBebida :: Bebida -> Cliente -> Cliente
tomarBebida bebida =
	bebida.(agregarBebida bebida)

tomarTragos :: Cliente -> [Bebida] -> Cliente
tomarTragos cliente bebidas =
	foldl1 (.) bebidas cliente

dameOtro :: Cliente -> Cliente
dameOtro cliente =
	((last.bebidasTomadas) cliente) cliente

noQuiebra :: Cliente -> Bebida -> Bool
noQuiebra cliente bebida =
	((>0).resistencia.bebida) cliente

cualesPuedeTomar :: Cliente -> [Bebida] -> [Bebida]
cualesPuedeTomar cliente bebidas =
	filter (noQuiebra cliente) bebidas


cuantasPuedeTomar :: Cliente -> [Bebida] -> Int
cuantasPuedeTomar cliente bebidas =
	length (cualesPuedeTomar cliente bebidas)


data Itinerario = Itinerario {
	nombreItinerario :: String,
	duracion :: Float,
	acciones :: [Cliente -> Cliente]
}

mezclaExplosiva = Itinerario "Mezcla explosiva" 2.5 [grogXD, grogXD, klusener "huevo", klusener "frutilla"]
itinerarioBasico = Itinerario "Itinerario básico" 5 [klusener "huevo", rescatarse 2, klusener "chocolate", jarraLoca]
salidaDeAmigos = Itinerario "Salida de Amigos" 1 [soda 1, tintico, agregarAmigo robertoCarlos, jarraLoca]

hacerItinerario :: Itinerario -> Cliente -> Cliente
hacerItinerario itinerario cliente =
	foldl1 (.) (acciones itinerario) cliente

intensidad :: Itinerario -> Float
intensidad itinerario =
	(genericLength.acciones) itinerario / duracion itinerario

itinerarioMasIntenso :: [Itinerario] -> Float
itinerarioMasIntenso itinerarios =
	maximum (map intensidad itinerarios)

--chuckNorris = Cliente "Chuck" 1000 [ana] [(soda 1), (soda 2)..]