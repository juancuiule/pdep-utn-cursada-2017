
class Presentacion {
	var lugar
	var fecha
	var capacidad
	constructor (unLugar,unaFecha,unaCapacidad) {
		lugar = unLugar
		fecha = unaFecha
		capacidad = unaCapacidad
	}
	method fecha(){
		return fecha
	}
	method sePasaDeSeptiembre(){
 		return fecha > new Date(1,9,2017)
	}
	method esConcurrida(){
		return capacidad > 5000
	}
}