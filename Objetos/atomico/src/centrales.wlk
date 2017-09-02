import turbinas.*

object burns {
	// Atómica
	
	var cantidadDeVarillasDeUranio
	
	method produccion(ciudad) {
		return cantidadDeVarillasDeUranio * 0.1
	}
	
	method esContaminante() {
		return cantidadDeVarillasDeUranio > 20
	}
	
	method cantidadDeVarillasDeUranio(unaCantidad) {
		cantidadDeVarillasDeUranio = unaCantidad
	}
}

object exBosque {
	// Carbón
	
	var capacidadEnToneladas
	
	method produccion(ciudad) {
		return 0.5 + capacidadEnToneladas * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante() {
		return true
	}
	
	method capacidadEnToneladas(unaCapacidad) {
		capacidadEnToneladas = unaCapacidad
	}
}

object elSuspiro {
	// Eólica
	
	var turbinas = #{unaTurbina}
	
	method produccion(ciudad) {
		return turbinas.sum({ turbina => turbina.produccion(ciudad) })
	}
	
	method esContaminante() {
		return false
	}
	
	method agregarTurbina(unaTurbina) {
		turbinas.add(unaTurbina)
	}
}

object hidro {
	method produccion(ciudad) {
		return 2 * ciudad.caudal()
	}
}