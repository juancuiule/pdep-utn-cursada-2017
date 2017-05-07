type NombreDeVigilante = String
type Habilidad = String

type Vigilante = (NombreDeVigilante, [Habilidad], Int)

nombre :: Vigilante -> NombreDeVigilante
nombre (elNombre, _, _) = elNombre

habilidades :: Vigilante -> [Habilidad]
habilidades (_, laHabilidad, _) = laHabilidad

añoAparicion :: Vigilante -> Int
añoAparicion (_, _, elAño) = elAño

type NombreDeAgente = String
type Agente = (NombreDeAgente, String)

nombreAgente :: Agente -> NombreDeAgente
nombreAgente (elNombre, _) = elNombre

algunosVigilantes :: [Vigilante]
algunosVigilantes = [("El Comediante", ["Fuerza"], 1942),
					("Buho Nocturno", ["Lucha", "Ingenierismo"], 1963),
					("Rorschach", ["Perseverancia", "Deduccion", "Sigilo"], 1964),
					("Espectro de Seda", ["Lucha", "Sigilo", "Fuerza"], 1962),
					("Ozimandias", ["Inteligencia", "Más Inteligencia Aún"], 1968),
					("Buho Nocturno", ["Lucha", "Inteligencia", "Fuerza"], 1939),
					("Espectro de Seda", ["Lucha", "Sigilo"], 1940)
					]

agentesDelGobierno :: [Agente]
agentesDelGobierno = [("Jack Bauer", "24"),("El Comediante", "Watchmen"), ("Dr. Manhattan", "Watchmen"), ("Liam Neeson", "Taken")]

type Evento = [Vigilante] -> [Vigilante]

agregarHabilidad :: Habilidad -> Vigilante -> Vigilante
agregarHabilidad habilidad (nombre, habilidades, año) =
	(nombre, habilidad : habilidades, año)

destruccion :: Evento
destruccion =
	muerteDe "Rorschach"
	--(retiro "Dr Manhattan").(muerteDe "Rorschach")

muerteDe :: NombreDeVigilante -> Evento
muerteDe nombreDelQueMuere vigilantes =
	filter ((/=nombreDelQueMuere).(nombre)) vigilantes

retiroDe :: NombreDeAgente -> [Agente]
retiroDe nombreDelQueSeRetira =
	filter ((/=nombreDelQueSeRetira).nombreAgente) agentesDelGobierno

nomresDeVigilantes :: [Vigilante] -> [NombreDeVigilante]
nomresDeVigilantes vigilantes =
	map nombre vigilantes

nombresDeAgentes :: [NombreDeAgente]
nombresDeAgentes = map nombreAgente agentesDelGobierno

esVigilanteAgente :: [Vigilante] -> Vigilante -> Bool
esVigilanteAgente vigilantes (nombre, habilidades, año) =
	elem nombre (nomresDeVigilantes vigilantes) && elem nombre nombresDeAgentes

vigilantesAgentes :: [Vigilante] -> [Vigilante]
vigilantesAgentes vigilantes = (filter (esVigilanteAgente vigilantes) vigilantes)

guerraDeVietnam :: Evento
guerraDeVietnam vigilantes =
	map (agregarHabilidad "Cinismo") (vigilantesAgentes vigilantes)

accidenteDeLaboratorio :: Int -> Evento
accidenteDeLaboratorio año vigilantes =
	("Dr. Manhattan", ["Manipulacion de la materia"], año) : vigilantes

menorSegunAño :: Vigilante -> Vigilante -> Vigilante
menorSegunAño primerVigilante segundoVigilante
	| añoAparicion primerVigilante < añoAparicion segundoVigilante = primerVigilante
	| otherwise = segundoVigilante 

---actaDeKeene :: Evento
---actaDeKeene vigilantes =

--destruccion.muerteDe "El Comediante".guerraDeVietnam.accidenteDeLaboratorio 1959.actaDeKeene

mayorSegun :: (Ord b, Num b) => (a -> b) -> a -> a -> Bool
mayorSegun funcion primerElemento segundoElemento =
	funcion primerElemento > funcion segundoElemento

devolverMayor :: Vigilante -> Vigilante -> Vigilante
devolverMayor primerVigilante segundoVigilante
	| mayorSegun (length.habilidades) primerVigilante segundoVigilante = primerVigilante
	| otherwise = segundoVigilante

vigilanteMasHabil :: [Vigilante] -> Vigilante
vigilanteMasHabil vigilantes =
	foldl1 devolverMayor vigilantes

nombreDelSalvador :: [Vigilante] -> String
nombreDelSalvador =
	nombre.vigilanteMasHabil.destruccion