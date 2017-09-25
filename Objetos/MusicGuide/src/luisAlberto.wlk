import musico.*

object luisAlberto inherits Musico("",8,#{}) {
	var guitarra

	method tocaConGuitarra(unaGuitarra) {
		guitarra = unaGuitarra
	}

	method trataMalAGuitarra() {
		guitarra.estaRota(true)
	}

	method habilidad() {
		return 100.min(8*guitarra.valor())
  	}

	method interpretaBien(cancion) {
		return true
	}

 	method cobra(presentacion) {
		if (presentacion.sePasaDeSeptiembre()) {
			return 1200
		} else {
			return 1000
		}
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
