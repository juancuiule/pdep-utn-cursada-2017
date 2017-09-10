object laTrastienda {
	var capacidad = 400

	method esConcurrida(unaFecha) {
		return self.capacidad(unaFecha) > 5000
	}

	method capacidad(unaFecha){
		if(self.esSabado(unaFecha)) {
			return capacidad + 300
		} else {
			return capacidad
		}
	}

	method esSabado(unaFecha){
		return unaFecha.dayOfWeek() == 6
	}
}