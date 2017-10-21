class Cancion {
	
	var titulo
	var duracion
	var letra
	
	constructor (unTitulo,unaDuracion,unaLetra) {
		titulo = unTitulo
		duracion = unaDuracion
		letra = unaLetra
	}
	
	method titulo() = titulo
	
	method duracion() = duracion

	method letra() = letra	

	method esCorta() {
		return duracion <= 180
	}

	method dice(palabra) {
		return letra.contains(palabra)
	}
	method cantidadDeLetrasTitulo(){
		return self.titulo().size()
	}
	method cantidadDeLetras(){
		return self.letra().size()
	}
	method cantidadDePalabras() {
		return letra.split(" ").size()
	}

}

class Remix inherits Cancion {
	constructor(cancion) =
		super(
			cancion.titulo(),
			cancion.duracion() * 3,
			"mueve tu cuelpo baby" + cancion.letra() + " yeah oh yeah"
		)
}

class Mashup inherits Cancion {
	constructor(canciones) = 
		super (
			"Mashup",
			canciones.max({cancion => cancion.duracion()}).duracion(),
			canciones.fold(canciones.asList().head().letra(),
				{unaLetra, otraCancion => unaLetra.trim() + " " + otraCancion.letra().trim()}
			)
		)
}