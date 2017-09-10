object lunaPark {
	var capacidad = 9290
	
	method esConcurrida(){
		return capacidad > 5000
	}
	
	method capacidad(){
		return capacidad
	}
	method asignoCapacidad(unaCantidad){
		capacidad = unaCantidad
	}
	method esSabado(unaFecha){
		return unaFecha.dayOfWeek() == 6
	}
	method capacidadLugar(unaFecha){
		return self.capacidad()
	}
}