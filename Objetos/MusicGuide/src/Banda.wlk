import musico.*
import Presentacion.*

class Banda {
	var integrantes = #{}
	var representante
	
	constructor(unosMusicos,unRepresentante){
		integrantes = unosMusicos
		representante = unRepresentante
	}
	
	method cuantoCobran(unaPresentacion){
		return integrantes.sum({integrante => integrante.cobra(unaPresentacion)}) + representante.cobra()
	}
	method estanEnGrupo(){
		return integrantes.all({integrante => integrante.estaEnGrupo()})
	}
		
	method habilidad(){
		return integrantes.sum({integrante=>integrante.habilidad()}) * 1.1
	}
	
	method discosEditados(){
		return integrantes.flatMap({integrante => integrante.discosHechos()})
	}
	
	method puedenTocar(unaCancion){
		return integrantes.all({integrante => integrante.interpretaBien(unaCancion)})
	}

	method integrantes() = integrantes
	
	method representante() = representante

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

