import luisAlberto.*
import joaquin.*
import lucia.*
class Presentacion {
	var lugar
	var fecha
	var gentePresente
	constructor (unLugar,unaFecha, integrantes) {
		lugar = unLugar
		fecha = unaFecha
		gentePresente = integrantes
	}
		
	method capacidadDeUnLugar(unaFecha){
		return lugar.capacidadLugar(unaFecha)
	}

	method fecha(){
		return fecha
	}
	method sePasaDeSeptiembre(){
 		return fecha > new Date(1,9,2017)
	}
	method costo(){
		gentePresente.sum{integrante => integrante.cobra(self)}
	}
}