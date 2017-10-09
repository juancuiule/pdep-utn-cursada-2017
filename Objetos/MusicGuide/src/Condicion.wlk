class Condicion {
	var mensaje
	var lambda
	constructor(unaLambda, unMensaje) {
		mensaje = unMensaje
		lambda = unaLambda
	}
	
	method mensaje() {
		return mensaje
	}
	method evaluar(unArtista) {
		return lambda.apply(unArtista)
	}
}