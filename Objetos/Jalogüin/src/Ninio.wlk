class Ninio {
	var elementos = #{}
	var actitud
	var caramelos = 0
	
	constructor(unaActitud, algunosElementos) {
		actitud = unaActitud
		elementos = algunosElementos
	}
	
	method caramelos() {
		return caramelos
	}
	
	method caramelos(cantidad) {
		caramelos = cantidad
	}
	
	method elementos() {
		return elementos
	}
	
	method capacidadDeSusto() {
		return self.sustoPorElementos() * actitud
	}
	
	method sustoPorElementos() {
		return elementos.sum({elemento => elemento.susto()})
	}
	
	method guardarCaramelos(cantidad) {
		caramelos += cantidad
	}
	
	method asustar(adulto) {
		adulto.recibirSusto(self)
	}
	
	method tieneMasDe(cantidad) {
		return caramelos > cantidad
	}
	
	method comerCaramelos(cantidad) {
		if(caramelos < cantidad)
			throw new Exception("no tiene suficientes caramelos")
		caramelos -= cantidad
	}
}