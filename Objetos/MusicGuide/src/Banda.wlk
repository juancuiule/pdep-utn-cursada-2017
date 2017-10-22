import musico.*
import Presentacion.*

class Banda {
	var integrantes = #{}
	var representante
	
	constructor(unosMusicos,unRepresentante){
		integrantes = unosMusicos
		representante = unRepresentante
	}
	
	method cuantoCobran(){   //no entendi el tema cobrador en la class musico
		return integrantes.sum({integrante=>integrante.cobra()}) + representante.cobra()
	}
	
		
	method habilidad(){//no se si hay que agregar algo el enunciado dice "considerar van a tocar en grupo"
		return integrantes.sum({integrante=>integrante.habilidad()}) * 1.1
	}
	
		

}

class Representante{
	var precio = 0
	
	constructor(precioQueCobra){
		precio = precioQueCobra
	}
	
	method cobra(){
		return precio
	}
	

}