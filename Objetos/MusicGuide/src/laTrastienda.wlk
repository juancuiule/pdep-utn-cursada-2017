object laTrastienda {
	var capacidad = 400
	
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
			if(self.esSabado(unaFecha)){
				self.asignoCapacidad(700)
			} else
			self.capacidad() 
	}
}