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
}
