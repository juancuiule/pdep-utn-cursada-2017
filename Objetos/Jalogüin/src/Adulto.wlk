class Adulto {
	
	var niniosQueIntentaronAsustarlo = 0
	
	method tolerancia() {
		return 10 * niniosQueIntentaronAsustarlo
	}
	
	method niniosQueIntentaronAsustarlo() {
		return niniosQueIntentaronAsustarlo
	}
	
	method darCaramelos(ninio) {
		ninio.guardarCaramelos(self.tolerancia() / 2)
	}
	
	method seAsusta(ninio) {
		return self.tolerancia() < ninio.capacidadDeSusto()
	}

	method recibirSusto(ninio) {
		if(self.seAsusta(ninio)) {
			self.darCaramelos(ninio)
		}
		if(ninio.tieneMasDe(15)) {
			niniosQueIntentaronAsustarlo += 1
		}
	}
}

class Abuelo inherits Adulto {
	override method seAsusta(ninio) {
		return true
	}
	
	override method darCaramelos(ninio) {
		ninio.recibirCaramelos(self.tolerancia() / 4)
	}
}

class AdultoNecio inherits Adulto {
	override method seAsusta(ninio) {
		return false
	}
}