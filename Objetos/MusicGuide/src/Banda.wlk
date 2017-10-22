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
}