object laTrastienda {
	var capacidad = 400

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