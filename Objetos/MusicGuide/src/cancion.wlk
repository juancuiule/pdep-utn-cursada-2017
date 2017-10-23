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
	constructor (unTitulo,unaDuracion,unaLetra) = 
		super (unTitulo,unaDuracion,unaLetra)
		
	override method duracion() {
		return duracion * 3
	}
	
	override method letra() {
		return "mueve tu cuelpo baby" + letra + " yeah oh yeah"
	}
}

class Mashup inherits Cancion {
	var canciones
	constructor(listaDeCanciones) = super("Mashup", null, null) {
		canciones = listaDeCanciones
	}
	
	override method titulo() {
		return "Mashup"
	}
	
	method cancionMasLarga() {
		return canciones.max({cancion => cancion.duracion()})
	}
	
	override method duracion() {
		return self.cancionMasLarga().duracion()
	}
	
	method letraPrimerCancion() {
		return canciones.asList().head().letra()
	}
	
	method juntarLetras(unaLetra, otraLetra) {
		return unaLetra.trim() + " " + otraLetra.trim()
	}
	
	override method letra() {
		return canciones.fold(
			self.letraPrimerCancion(),
			{unaLetra, unaCancion => self.juntarLetras(unaLetra, unaCancion.letra())}
		) 
	}
}