
class Presentacion {
	var lugar
	var fecha
	
	constructor (unLugar,unaFecha) {
		lugar = unLugar
		fecha = unaFecha
	}
	method fecha(){
		return fecha
	}
	method sePasaDeSeptiembre(){
 		return fecha > new Date(1,9,2017)
	}

}