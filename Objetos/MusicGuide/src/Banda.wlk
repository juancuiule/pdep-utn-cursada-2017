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
	method estanEnGrupo(){
		return integrantes.all({integrante => integrante.estaEnGrupo()})
	
		
	method habilidad(){
		return integrantes.sum({integrante=>integrante.habilidad()}) * 1.1
	}
	method discosEditados(){
		if(integrantes.estanEnGrupo()){
		return integrantes.map({musico => musico.discosHechos()})
	}
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
