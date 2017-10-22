import musico.*
import Presentacion.*

class Banda {
	var integrantes = #{}
	var representante
	
	constructor(unosMusicos,unRepresentante){
		integrantes = unosMusicos
		representante = unRepresentante
	}
	
	method cuantoCobran(unaPresentacion){   //no entendi el tema cobrador en la class musico(arreglado)
		return integrantes.sum({integrante=>integrante.cobra(unaPresentacion)}) + representante.cobra()
	}
	method estanEnGrupo(){
		return integrantes.all({integrante => integrante.estaEnGrupo()})
	}
		
	method habilidad(){
		if(integrantes.estanEnGrupo()){
		return integrantes.sum({integrante=>integrante.habilidad()}) * 1.1
		}else{
			return "error" //Nico agrego el if, y debe haber return en else, deberia tirar un error
		}
	}
	
	method discosEditados(){
		return integrantes.map({integrante => integrante.discosHechos()})
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

