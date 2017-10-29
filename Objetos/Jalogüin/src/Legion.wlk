class Legion {

	var integrantes
	
	constructor(unosIntegrantes) {
		if(unosIntegrantes.size() < 2)
			throw new Exception("La legion no puede tener menos de 2 integrantes")
		integrantes = unosIntegrantes
	}
	
	method elementos() {
		return integrantes.flatMap({integrante => integrante.elementos()})
	}
	
	method caramelos() {
		return integrantes.sum({integrante => integrante.caramelos()})
	}
	
	method capacidadDeSusto() {
		return integrantes.sum({integrante => integrante.capacidadDeSusto()})
	}
		
	method lider() {
		return integrantes.max({integrante => integrante.capacidadDeSusto()})
	}
	
	method asustar(adulto) {
		adulto.recibirSusto(self)
	}
	
	method recibirCaramelos(cantidad) {
		self.lider().recibirCaramelos(cantidad)
	}

	method tieneMasDe(cantidad) {
		return self.caramelos() > cantidad
	}

}