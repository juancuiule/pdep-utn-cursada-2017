class Cancion {

	var duracion
	var letra
	
	constructor (unaDuracion,unaLetra){
		duracion = unaDuracion
		letra = unaLetra
	}
	
	method duracion() = duracion

	method letra()=letra	

	method dice(palabra) {
		return letra.contains(palabra)
	}
}
