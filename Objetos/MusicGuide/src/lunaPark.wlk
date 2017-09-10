object lunaPark {
	var capacidad = 9290
	
	method esConcurrida(unaFecha){
		return self.capacidad(unaFecha) > 5000
	}
	
	method capacidad(unaFecha){
		return capacidad
	}
}