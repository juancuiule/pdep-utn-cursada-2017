import centrales.*

object springfield {
	var necesidad
	var velocidadVientos = 10
	var riquezaDelSuelo = 0.9
	var centrales = #{burns, exBosque, elSuspiro}
	
	method cubreNecesidad() {
		return self.produccion() > necesidad
	}
	
	method produccion() {
		return centrales.sum({ central => central.produccion(self) })
	}
	
	method produccion(central) {
		return central.produccion(self)
	}
	
	method centralesContaminantes() {
		return centrales.filter({ central => central.esContaminante() })
	}
	
	method sonTodasContaminantes() {
		return centrales.fold(true, {
			valor, central =>
				valor && central.esContaminante()
		})
	}
	
	
	method produccionDeContaminantes() {
		return self.centralesContaminantes()
			.sum({ central => central.produccion(self) })
	}
	
	method estaAlHorno() {
		return self.sonTodasContaminantes() ||
			self.produccionDeContaminantes() > necesidad * 0.5
	}
	
	method centralMasProductora() {
		return centrales.max({ central => central.produccion(self)})
	}
	
	method necesidad(unaNecesidad) {
		necesidad = unaNecesidad
	}
	
	method riquezaDelSuelo() {
		return riquezaDelSuelo
	}
	
	method velocidadVientos() {
		return velocidadVientos
	}
}

object albuquerque {
	var caudal = 150
	var central = hidro	
	
	method caudal() {
		return caudal
	}
	
	method centralMasProductora() {
		return central
	}
}