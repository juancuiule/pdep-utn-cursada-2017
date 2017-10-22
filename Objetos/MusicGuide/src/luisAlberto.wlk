import musico.*

object luisAlberto inherits Musico("", 8, #{}, null, new CobraPorInflacion(1000, new Date(1, 9, 2017), 0.2)) {
	var guitarra

	method tocaConGuitarra(unaGuitarra) {
		guitarra = unaGuitarra
	}

	method trataMalAGuitarra() {
		guitarra.estaRota(true)
	}

	method habilidad() {
		return 100.min(8 * guitarra.valor())
  	}

	override method interpretaBien(cancion) {
		return true
	}
}

object fender {
	var estaRota = false
	
	method valor() {
		return 10
	}

	method estaRota() {
		return estaRota
	}

	method estaRota(trueOfalse) {
		estaRota = trueOfalse
	}
}

object gibson {
	var estaRota = false
	
	method valor() {
		if (self.estaRota()) {
			return 5
		} else {
			return 15
		}
	}

	method estaRota() {
		return estaRota
	}

	method estaRota(trueOfalse) {
		estaRota = trueOfalse
	}
}
