type Onomatopeya = String
type Intensidad = Float
type MojoLaCama = Bool

type Grito = (Onomatopeya, Intensidad, MojoLaCama)

onomatopeya :: Grito -> Onomatopeya
onomatopeya (laOnomatopeya,_,_) = laOnomatopeya

intensidad :: Grito -> Intensidad
intensidad (_,laIntensidad,_) = laIntensidad

mojoLaCama :: Grito -> MojoLaCama
mojoLaCama (_,_,laMojo) = laMojo

nivelDeTerror = length.onomatopeya

energiaDeGrito :: Grito -> Float
energiaDeGrito (onomatopeya, intensidad, mojoLaCama)
	| mojoLaCama = nivelDeTerror * intensidad * intensidad
	| otherwise = 3.0 * nivelDeTerror + intensidad
		where nivelDeTerror = length onomatopeya

type Nombre = String
type Edad = Int
type Altura = Float
type Niño = (Nombre, Edad, Altura)

juan :: Niño
juan = ("Juan", 10, 13.2)

nombre :: Niño -> Nombre
nombre (elNombre,_,_) = elNombre

edad :: Niño -> Edad
edad (_,laEdad,_) = laEdad

altura :: Niño -> Altura
altura (_,_,laAltura) = laAltura

type Monstruo = Niño -> Grito

sullivan :: Monstruo
sullivan niño =
	(replicate ((length.nombre) niño) 'A' ++ "GH", 20 / 10, ((<3).edad) niño) 
